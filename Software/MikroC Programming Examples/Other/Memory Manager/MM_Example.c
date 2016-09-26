/*
 * Project name:
     Memory Manager Example (Demonstration of the Memory Manager Library usage)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111226:
       - initial release;
 * Description:
     In this example Memory Manager library functions are used for dynamic 
     memory allocation and deallocation of objects in runtime.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     None.
*/


// Structure that describes Item object
typedef struct {
    long         id;     // Item number
    char *      name;    // Item name
} tItem;

// Allocate and initialize a new Item object and returns pointer to created Item
tItem * make_item(char *name) {
    tItem * item;

    item = (tItem*) malloc(sizeof(tItem)); // Allocate a block of memory for a new Item object
    if (item == 0)                         // If allocation failed return null
        return (tItem *)0;

    memset(item, 0, sizeof(tItem));        // Initialize the members of the new Item
    item->id =   -1;
    item->name = (char *)0;

    item->name = malloc(strlen(name) + 1); // Allocate a block of memory for a name in the Item
    if (item->name == 0) {                 // If allocation failed return null
        Free( (char*)item, sizeof(tItem));
        return (tItem *)0;
    }
    strcpy(item->name, name);              //Save a copy of the name in the new Item

    return item;                           // Return the created Item object
}

// Deallocate an Item object
void destroy_item(tItem *item) {

    if (item == 0)                         // Check for a null object pointer
        return;

    if (item->name != 0) {
        Free(item->name, strlen(item->name) + 1);// Deallocate the name string saved within the Item
        item->name = (char *)0;
    }

    Free((char*)item, sizeof(tItem));      // Deallocate the Item object itself
}

tItem *it[3];    // Array of pointers to Item objects
char txt[15];
long freeMemSize;
long largerstFreeBlock;

void main() {
  MM_Init();

  freeMemSize = MM_TotalFreeMemSize();          // Get free memory size before allocating
  largerstFreeBlock = MM_LargestFreeMemBlock(); // Get largest free memory block size before allocating

  it[0] = make_item("one");                     // Allocate object
  it[1] = make_item("two");
  it[2] = make_item("three");
  
  freeMemSize = MM_TotalFreeMemSize();          // Get free memory size
  largerstFreeBlock = MM_LargestFreeMemBlock(); // Get largest free memory block size
  
  strcpy(txt,it[0]->name);
  strcpy(txt,it[1]->name);
  strcpy(txt,it[2]->name);

  destroy_item(it[0]);                          // Deallocate the Item object
  it[0] = make_item("instead one");             // Make another Item object
  strcpy(txt,it[0]->name);
  strcpy(txt,it[1]->name);
  strcpy(txt,it[2]->name);

  destroy_item(it[0]);                          // Deallocate Items
  destroy_item(it[1]);
  destroy_item(it[2]);

  freeMemSize = MM_TotalFreeMemSize();          // Get free memory size
  largerstFreeBlock = MM_LargestFreeMemBlock(); // Get largest free memory block size
}