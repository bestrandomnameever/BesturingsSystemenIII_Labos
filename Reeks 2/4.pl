use Win32::OLE qw(in with);
use Win32::OLe::Const "Microsoft Excel";
Win32::OLE->Option(Warn => 3);


$fso = Win32::OLE->new("Scripting.FileSystemObject");
$excelApp = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');
# use Win32::OLE::Const->Load($excelApp);

if ($fso->FileExists($ARGV[0]) && ($file = $fso->GetFile($ARGV[0]))->{Type} =~ /Excel/) {
	$book = $excelApp->Workbooks->Open($file->Path);
	foreach $sheet (in $book->Worksheets) {
		$cell = $nsheet->Range("A1")->SpecialCells(xlCellTypeLastCell); 
		$range = $nsheet->Range("A1",$cell);
	}
}else {
	printf "Bestand %s is een onbestaand of ongeldig Excel document\n", $ARGV[0];
}