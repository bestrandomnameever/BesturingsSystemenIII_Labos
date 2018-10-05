use Win32::OLE qw(in with);

Win32::OLE->Option(Warn => 3);
$fso = Win32::OLE->new("Scripting.FileSystemObject");
$excelApp = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');

$absoluteToDir = $fso->GetFolder('.')->{Path};

if ($fso->FileExists($ARGV[0]) && $fso->GetFile($ARGV[0])->{Type} =~ /Excel/) {
	printf "%s\n", "Bestand bestaat";
	$book = $excelApp->{Workbooks}->Open(join "/", $absoluteToDir, $ARGV[0]);
}else {
	printf "Bestand bestaat niet\nBestand %s wordt gemaakt\n", $ARGV[0];
	$book = $excelApp->{Workbooks}->Add();
	$book->SaveAs(join "/", $absoluteToDir,$ARGV[0]);

}

printf "Aantal werkbladen: %s\n", $book->{Worksheets}->{Count};