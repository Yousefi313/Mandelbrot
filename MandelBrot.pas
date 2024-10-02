unit MandelBrot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math,
  System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    StaticText1: TStaticText;
    RadioButton1: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  amin, bmin, kante, ds: real;
  a, b, x, y, xx, yy: real;
  s, z, zaehler: integer;
  widthFactor, heightFactor: real;
begin
  try
    //Die Eingaben aus den Edit-Feldern werden gelesen und konvertiert
    amin := StrToFloat(Edit1.Text);
    bmin := StrToFloat(Edit2.Text);
    kante := StrToFloat(Edit3.Text);
  except
    on E: Exception do
    begin
      ShowMessage('Fehler bei der Eingabe: ' + E.Message);  //Fehlermeldung wenn die Eingabe kein Float ist
      Exit;
    end;
  end;

  // Berechne die Skalierungsfaktoren basierend auf der PaintBox-Größe
  widthFactor := PaintBox1.Width / 200;
  heightFactor := PaintBox1.Height / 200;
  ds := kante / 200;

  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(Rect(0, 0, PaintBox1.Width, PaintBox1.Height)); // Gesamte PaintBox leeren
  PaintBox1.Canvas.Pen.Color := clRed;

  // Mandelbrot-Algorithmus
  a := amin;
  for s := 0 to PaintBox1.Width - 1 do
  begin
    b := bmin;
    for z := 0 to PaintBox1.Height - 1 do
    begin
      x := 0;
      y := 0;
      zaehler := 0;
      while (zaehler < 100) and (Sqrt(x * x + y * y) < 2) do
      begin
        Inc(zaehler);
        xx := x * x - y * y + a;
        y := 2 * x * y + b;
        x := xx;
      end;

      // Setze Pixel basierend auf der Anzahl der Iterationen
      if zaehler >= 100 then
        PaintBox1.Canvas.Pixels[s, z] := clBlack
      else
      begin
        case zaehler of
          0..9: PaintBox1.Canvas.Pixels[s, z] := clRed;
          10..19: PaintBox1.Canvas.Pixels[s, z] := clGreen;
          20..29: PaintBox1.Canvas.Pixels[s, z] := clOlive;
          30..39: PaintBox1.Canvas.Pixels[s, z] := clNavy;
          40..49: PaintBox1.Canvas.Pixels[s, z] := clYellow;
          50..59: PaintBox1.Canvas.Pixels[s, z] := clTeal;
          60..69: PaintBox1.Canvas.Pixels[s, z] := clGray;
          70..79: PaintBox1.Canvas.Pixels[s, z] := clSilver;
          80..89: PaintBox1.Canvas.Pixels[s, z] := clAqua;
          90..99: PaintBox1.Canvas.Pixels[s, z] := clLime;
        end;
      end;

      b := b + ds;
    end;
    a := a + ds;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  // Passe die PaintBox-Größe bei Änderung der Form-Größe an
  PaintBox1.Width := ClientWidth - 10;  // 10 Pixel Rand
  PaintBox1.Height := ClientHeight - 50; // 50 Pixel Rand für Buttons
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
  var message : string;
    begin
      message := 'Komma statt Punkt im Eingabegeld :)';
      ShowMessage(message);
    end;

end.

