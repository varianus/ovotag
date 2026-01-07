program ovotag_testunit;
{$mode objfpc}{$H+}
{$IFDEF CONSOLE_MODE}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
{$IFDEF CONSOLE_MODE}
  consoletestrunner,
{$else}
  Interfaces,
  Forms, GuiTestRunner, fpcunitconsolerunner,
{$ENDIF}
  testreader, testmp3_v24, testmp3_v23,
  testflac, testogg, testMp4, testOpus, testMonkey, testWav, testAAc, testWma;

{$R *.res}

begin
  {$IFDEF CONSOLE_MODE}
   with TTestRunner.Create(nil) do
   begin
     Initialize;
     run;
     Free;

   end;
  {$ELSE}
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;

  {$ENDIF}
end.

