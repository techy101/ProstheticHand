/*
 * Project Name:
     Basic_Realm
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release; Author: Bruno Gavand.
 *
 * description  :
 *              This program show how to use the HTTP utils mini-library,
 *              to build a private web zone (username + password needed)
 *              with basic realm authentication method.
 *                               username: mikroe
 *                               password: basicrealm
 *              Includes also some other useful functions and methods.
 *
 *      RB0 : !RESET    to ENC reset input pin
 *      RB1 : !CS       to ENC chip select input pin
 *      the ENC28J60 SPI bus CLK, SO, SI must be connected to the corresponding SPI pins of the ARM
 *      the INT and WOL signals from the ENC are not used
 *
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     ext. modules:    ac:Serial_Ethernet_Board
                      ac:SmartADAPT
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Since the ENC28J60 doesn't support auto-negotiation, full-duplex mode is
       not compatible with most switches/routers.  If a dedicated network is used
       where the duplex of the remote node can be manually configured, you may
       change this configuration.  Otherwise, half duplex should always be used.
     - Use SmartADAPT board to connect Serial Ethernet 2 board to EasyMx v7 development system, on PORTB.
     - External power supply should be used due to Serial Ethernet Board power consumption.

 */

/*
 * library header
 */
#include        "__EthEnc28j60.h"
#include        "httpUtils.h"

/*
 * pictures
 */
#include        "pictures.h"

/*
 * HTTP request buffer size (extra bytes will be ignored)
 */
#define  HTTP_REQUEST_SIZE 50

/*
 * username and password of the private zone,
 * separated by a period
 */
#define PRIVATE_LOGINPASSWD     "mikroe:basicrealm"

/*
 * reply message if authorization fails or if user gives up
 */
#define MSG_DENIED              "Authorization Required"

/*
 * private web zone name, will be displayed by the browser
 */
#define ZONE_NAME               "HTTP Utils private zone"

/*
 * main page : public zone
 */
const unsigned char publicHTML[] = "<html><body>\
<center>\
<h1>Basic Realm Authentication for mikroC Ethernet Library</h1>\
<h2>\
<img src=\"/stop.gif\">\
<a href=\"/private\"> Click here to enter private area </a>\
<img src=\"/stop.gif\">\
</h2>\
</center>\
</body></html>";

/*
 * second page : private zone
 */
const unsigned char privateHTML[] = "<html><body>\
<center>\
<h2>\
<font color=red>\
<h1>Welcome to the private area</h1>\
<img src=\"/good.gif\">\
<a href=\"/private/redirect\">Click here to be redirected to a great web site</a>\
<img src=\"/good.gif\">\
</font>\
</h2>\
</center>\
</body></html>";

/*
 * path names
 */
unsigned char path_private[]    = "/private";          // private zone
unsigned char path_redirect[]   = "/redirect";         // redirect under private zone
unsigned char path_stop[]       = "/stop.gif";         // image
unsigned char path_good[]       = "/good.gif";         // another image

// mE ehternet NIC pinout
sfr sbit SPI_Ethernet_Rst at GPIOB_ODR.B0;
sfr sbit SPI_Ethernet_CS  at GPIOB_ODR.B1;
// end ethernet NIC definitions

/*
 * put your network settings here
 */
unsigned char myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3f};  // ethernet board MAC address
unsigned char myIpAddr[4]  = {10, 101, 14, 52 }; // my IP address
unsigned char gwIpAddr[4]  = {10, 101, 14, 1}; // gateway (router) IP address
unsigned char ipMask[4]    = {255, 255, 255, 0 }; // network mask (for example : 255.255.255.0)
unsigned char dnsIpAddr[4] = {10, 101, 14, 99 }; // DNS server IP address

/*
 * URL for redirection
 */
unsigned char redirURL[]          = "http://www.mikroe.com/";

/*
 * buffer to receive a copy of HTTP request
 */
unsigned char http_request[HTTP_REQUEST_SIZE + 1];

/*
 * no reply to UDP requests
 */
unsigned int    SPI_Ethernet_UserUDP(unsigned char *remoteHost, unsigned int remotePort, unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags)
        {
        return(0);
        }

/*
 * TCP request processing
 */
unsigned int    SPI_Ethernet_UserTCP(unsigned char *remoteHost, unsigned int remotePort, unsigned int localPort, unsigned int reqLength, TEthPktFlags *flags)
        {
        unsigned int    len = 0;       // my reply length
        unsigned char   admin;         // admin flag set when private zon is allowed
        unsigned char   *ptr;          // pointer to buffer

        // should we close tcp socket after response is sent?
        // library closes tcp socket by default if canCloseTCP flag is not reset here
        // flags->canCloseTCP = 0; // 0 - do not close socket
                                   // otherwise - close socket

        /*
         * check if request is on TCP port 80 (HTTP)
         */
        if(localPort != 80)
                {
                return(0);             // no reply to other ports
                }

        /*
         * check for a GET request
         */
        if(HTTP_getRequest(http_request, &reqLength, HTTP_REQUEST_SIZE) == 0)
                {
                return(0);             // no reply if not found
                }

        /*
         * try to find authorization
         */
        admin = HTTP_basicRealm(reqLength, PRIVATE_LOGINPASSWD);

        /*
         * process request string
         */
        if(memcmp(http_request, path_private, sizeof(path_private) - 1) == 0)   // is path under private section ?
                {
                // yes, points to sub path
                ptr = http_request + sizeof(path_private) - 1;

                // check if access is granted
                if(admin == 0)
                        {
                        // no, reply with access denied message
                        len = HTTP_accessDenied(ZONE_NAME, MSG_DENIED);
                        }
                else
                        {
                        // yes, test path if redirection is requested
                        if(memcmp(ptr, path_redirect, sizeof(path_redirect) - 1) == 0)
                                {
                                // yes, reply with redirect string
                                len = HTTP_redirect(redirURL);
                                }
                        else
                                {
                                // no, reply with private page
                                len = HTTP_html(privateHTML);
                                }
                        }
                }
        else if(memcmp(http_request, path_stop, strlen(path_stop)) == 0)        // is 'stop' image requested ?
                {
                // yes, reply with image header and dump image
                len = HTTP_imageGIF(dump_stop_GIF, DUMP_STOP_GIF_SIZE);
                }
        else if(memcmp(http_request, path_good, strlen(path_good)) == 0)        // is 'good' image requested ?
                {
                // yes, reply with image header and dump image
                len = HTTP_imageGIF(dump_good_GIF, DUMP_GOOD_GIF_SIZE);
                }
        else if(memcmp(http_request, "/", 1) == 0)                              // is home page requested ?
                {
                // yes, reply with html header and dump page
                len = HTTP_html(publicHTML);
                }
        else
                {
                // any other case, reply with error 404 (not found)
                len = HTTP_error();
                }

        return(len);   // return reply buffer length to library
        }

/*
 * program entry point
 */
void    main() {

        SPI3_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI3_PB345);
        GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);


        SPI_Ethernet_Init(myMacAddr, myIpAddr, SPI_Ethernet_FULLDUPLEX); // init ethernet board

        // dhcp will not be used here, so use preconfigured addresses
        SPI_Ethernet_confNetwork(ipMask, gwIpAddr, dnsIpAddr);

        while(1) {             // forever

                /*
                 * if necessary, test the return value to get error code
                 */
                SPI_Ethernet_doPacket();   // process incoming Ethernet packets and do services
        }
}