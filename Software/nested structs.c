
Here are a couple says to play with nesteed structs:



typedef struct
{
   uint32_t a;
   uint32_t b;
} box_typedef;

typedef struct
{
   uint32_t h;
   box_typedef box;
} cube_typedef;

box_typedef box1 = 
{
   .a = 2,
   .b = 3,
};



cube_typedef cube2 = 
{
   .h = 7,
   .box = 
   {
      .a = 8,
      .b = 9,
   }
};


int main()
{
	
   printf("a: %d \n\r", cube2.box.a );
   printf("b: %d \n\r", cube2.box.b );
   printf("h: %d \n\n\r", cube2.h );
   
   cube2.box = box1;
   
   printf("a: %d \n\r", cube2.box.a );
   printf("b: %d \n\r", cube2.box.b );
   printf("h: %d \n\n\r", cube2.h );

   
   cube_typedef cube3;
   cube3.box.a = 21;
   cube3.box.b = 22;
   cube3.h = 30;
   
   printf("a: %d \n\r", cube3.box.a );
   printf("b: %d \n\r", cube3.box.b );
   printf("h: %d \n\n\r", cube3.h );

}


/* should return:
a: 8 
b: 9 
h: 7 

a: 2 
b: 3 
h: 7 

a: 88 
b: 99 
h: 77 

*/





Given that register checks often deal with memory addr, you could also nest a struct through a pointer:
(the following works for 32bit system, which is what you have. a different WORD (system bit size) size would require some changes to addressing)



typedef struct
{
	uint32_t regAddr1;
	uint32_t regAddr2;
	uint32_t regAddr3;
} GPIO_TypeDef;


GPIO_TypeDef * GPIOX = 0x4000000;
/*
&GPIOX->regAddr1 = 0x40000000  (address held by pointer)
&GPIOX->regAddr2 = 0x40000004  (address held by pointer)
&GPIOX->regAddr3 = 0x40000008  (address held by pointer)


GPIOX->regAddr1 = 0x???????? (32bit content in addr: 0x40000000)
GPIOX->regAddr2 = 0x???????? (32bit content in addr: 0x40000004)
GPIOX->regAddr3 = 0x???????? (32bit content in addr: 0x40000008)
*/



typedef struct
{
   uint32_t x;
   uint32_t y;
   GPIO_TypeDef * gpio;
} fingerGPIO;



fingerGPIO indexFinger =
{
   .x = 45,
   .y = 90,
   .gpio = GPIOX,
};


where,
/*
&indexFinger.gpio->regAddr1 = 0x40000000  (address held by pointer)
&indexFinger.gpio->regAddr2 = 0x40000004  (address held by pointer)
&indexFinger.gpio->regAddr3 = 0x40000008  (address held by pointer)


indexFinger.gpio->regAddr1 = 0x???????? (32bit content in addr: 0x40000000)
indexFinger.gpio->regAddr2 = 0x???????? (32bit content in addr: 0x40000004)
indexFinger.gpio->regAddr3 = 0x???????? (32bit content in addr: 0x40000008)
*/



