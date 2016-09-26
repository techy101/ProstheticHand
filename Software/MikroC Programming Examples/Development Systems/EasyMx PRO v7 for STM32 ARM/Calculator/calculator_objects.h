enum GlcdColor {_clClear, _clDraw, _clInvert};

typedef struct Screen TScreen;

typedef struct  Button {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned short         ObjectsCount;
  unsigned int           ButtonsCount;
  TButton                * const code *Buttons;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
};

extern   TScreen                Screen1;
extern   TButton               Button19;
extern   TButton               Button1;
extern   TButton               Button5;
extern   TButton               Button6;
extern   TButton               Button7;
extern   TButton               Button2;
extern   TButton               Button3;
extern   TButton               Button4;
extern   TButton               Button8;
extern   TButton               Button9;
extern   TButton               Button10;
extern   TButton               Button12;
extern   TButton               Button13;
extern   TButton               Button14;
extern   TButton               Button15;
extern   TBox                   Box3;
extern   TButton               Button16;
extern   TButton               Button17;
extern   TButton               Button18;
extern   TBox                   Box1;
extern   TLabel                 Label1;
extern   TLabel                 Label2;
extern   TLabel                 Label3;
extern   TLabel                 Label4;
extern   TLabel                 Label5;
extern   TLabel                 Label6;
extern   TButton_Round          ButtonRound2;
extern   TButton                * const code Screen1_Buttons[18];
extern   TButton_Round          * const code Screen1_Buttons_Round[1];
extern   TLabel                 * const code Screen1_Labels[6];
extern   TBox                   * const code Screen1_Boxes[2];


extern   TScreen                Screen2;
extern   TLabel                 Label7;
extern   TLabel                 Label8;
extern   TButton_Round          ButtonRound1;
extern   TLabel                 Label9;
extern   TLabel                 Label10;
extern   TButton_Round          * const code Screen2_Buttons_Round[1];
extern   TLabel                 * const code Screen2_Labels[4];



/////////////////////////
// Events Code Declarations
void Button19Click();
void Button1Click();
void Button5Click();
void Button6Click();
void Button7Click();
void Button2Click();
void Button3Click();
void Button4Click();
void Button8Click();
void Button9Click();
void Button10Click();
void Button12Click();
void Button13Click();
void Button14Click();
void Button15Click();
void Button16Click();
void Button17Click();
void Button18Click();
void ButtonRound2Click();
void ButtonRound1Click();
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char Button19_Caption[];
extern char Button1_Caption[];
extern char Button5_Caption[];
extern char Button6_Caption[];
extern char Button7_Caption[];
extern char Button2_Caption[];
extern char Button3_Caption[];
extern char Button4_Caption[];
extern char Button8_Caption[];
extern char Button9_Caption[];
extern char Button10_Caption[];
extern char Button12_Caption[];
extern char Button13_Caption[];
extern char Button14_Caption[];
extern char Button15_Caption[];
extern char Button16_Caption[];
extern char Button17_Caption[];
extern char Button18_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
extern char ButtonRound2_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char ButtonRound1_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
