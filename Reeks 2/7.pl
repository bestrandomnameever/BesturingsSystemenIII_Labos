use Win32::OLE qw(in with);
use Win32::OLE::Const "Microsoft Excel";
Win32::OLE->Option(Warn => 3);


$fso = Win32::OLE->new("Scripting.FileSystemObject");
$excelApp = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');

if ($fso->FileExists($ARGV[0]) && ($file = $fso->GetFile($ARGV[0]))->{Type} =~ /Excel/) {
	$book = $excelApp->Workbooks->Open($file->Path);

	$book->Worksheets->Item(1)

} else {
	printf "Bestand %s is een onbestaand of ongeldig Excel document\n", $ARGV[0];
}