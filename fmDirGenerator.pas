unit fmDirGenerator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ExtDlgs;

type
  TDirGeneratorForm = class(TForm)
    OpenDialog: TOpenDialog;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    SaveDialog: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  DirGeneratorForm: TDirGeneratorForm;

implementation

{$R *.dfm}

resourcestring
  rsSXFFilter = 'SXF файлы (*.sxf)|*.sxf';
  rsRSCFilter = 'RSC файлы (*.rsc)|*.rsc';

procedure TDirGeneratorForm.BitBtn1Click(Sender: TObject);
begin
  with OpenDialog do begin
    Filter := rsSXFFilter;
    Options := Options + [ofAllowMultiSelect];
    if Execute then
      LabeledEdit1.Text := Files.CommaText;
  end;
end;

procedure TDirGeneratorForm.BitBtn2Click(Sender: TObject);
begin
  with OpenDialog do begin
    Filter := rsRSCFilter;
    Options := Options - [ofAllowMultiSelect];
    if Execute then
      LabeledEdit2.Text := FileName;
  end;
end;

procedure TDirGeneratorForm.LabeledEdit1Change(Sender: TObject);
begin
  Button1.Enabled := (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '');
end;

procedure TDirGeneratorForm.Button1Click(Sender: TObject);
begin
  with SaveDialog do
    if Execute then
      with TStringList.Create do
        try
          CommaText := LabeledEdit1.Text;
          Insert(0, 'DIR');
          Insert(1, LabeledEdit2.Text);
          SaveToFile(FileName);
          Application.MessageBox('Готово', PChar(Caption));
        finally
          Free;
        end;
end;

end.
