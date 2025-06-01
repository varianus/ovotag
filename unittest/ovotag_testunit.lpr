program ovotag_testunit;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, GuiTestRunner, testreader, testmp3_v24, testmp3_v23,
  testflac, testogg, testMp4, testOpus, testMonkey, testWav, testAAc, testWma;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

