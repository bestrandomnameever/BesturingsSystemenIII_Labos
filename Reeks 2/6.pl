use Win32::OLE qw(in with);
use Win32::OLE::Const "Microsoft Excel";
Win32::OLE->Option(Warn => 3);


$fso = Win32::OLE->new("Scripting.FileSystemObject");
$excelApp = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');
# use Win32::OLE::Const->Load($excelApp);

sub printRange {
	foreach $row (@{@_[0]}) {
		foreach $col (@{$row}) {
			printf "%3s", $col;
		}
		printf "\n";
	}
}

if ($fso->FileExists($ARGV[0]) && ($file = $fso->GetFile($ARGV[0]))->{Type} =~ /Excel/) {
	$book = $excelApp->Workbooks->Open($file->Path);
	foreach $sheet (in $book->Worksheets) {
		$cell = $sheet->Range("A1")->SpecialCells(xlCellTypeLastCell);
		$range = $sheet->Range("A1",$cell);

		printf "Sheet %s:\n----------------------------------------------\n", $sheet->Name;
		
		printf "$range=$sheet->Range('A1:D10')\n";
		$values=$sheet->Range("A1:D10")->Value;
		printf "Values: %s\n", $values;
		printRange($values);

		printf "$range=$sheet->Range('A1:D10')\n";
		$values=$sheet->Cells(4,1)->Value;
		printRange($values);

		printf "$range=$sheet->Range('A1:D10')\n";
		$values=$sheet->Range($sheet->Cells(1,1),$sheet->Cells(4,3))->Value;
		printRange($values);

		printf "----------------------------------------------\n";
	}
}else {
	printf "Bestand %s is een onbestaand of ongeldig Excel document\n", $ARGV[0];
}