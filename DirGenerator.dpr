program DirGenerator;

uses
  Forms,
  fmDirGenerator in 'fmDirGenerator.pas' {DirGeneratorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDirGeneratorForm, DirGeneratorForm);
  Application.Run;
end.
