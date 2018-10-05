# Excel.Application
#   CLSID: {00024500-0000-0000-C000-000000000046}
#   ProgId: Excel.Application.12

# Excel.Sheet
#   CLSID: {00020830-0000-0000-C000-000000000046}
#   ProgId: Excel.Sheet.12
#   Typelib: {00020813-0000-0000-C000-000000000046} (CLSID)

# 
use Win32::OLE qw(in); 
#gebruik bestaand process of start een nieuw proces in embedded mode

$excelAppl = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');

#$excelAppl->{visible}=1;  #naar keuze
print "\naantal werkboeken in excel : ", $excelAppl->{Workbooks}->{Count};
print "\n-----------------------------------------\n";

#werkbook toevoegen
my $book=$excelAppl->{Workbooks}->Add();
print "\naantal werkboeken in excel : ", $excelAppl->{Workbooks}->{Count};
print "\naantal werksheets in het toegevoegd boek:", $book->{Worksheets}->{Count};
print "\n\t$_->{name}" foreach in $book->{Worksheets};
print "\n-----------------------------------------\n";

#Werkblad toevoegen
$book->{Worksheets}->add();
print "\nNa add : aantal werksheets in het toegevoegd boek:", $book->{Worksheets}->{Count};
print "\n\t$_->{name}" foreach in $book->{Worksheets};
print "\n-----------------------------------------\n";

$excelAppl->{DisplayAlerts}=0; #geen foutboodschappen tonen 
