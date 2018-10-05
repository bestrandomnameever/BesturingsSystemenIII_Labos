use Win32::OLE::Const;

$cdo = Win32::OLE->new("CDO.Message");
$conf = $cdo->{Configuration};

$congLib = Win32::OLE::Const->Load($conf);

print "Excel constants: \n";
while(($key, $value) = each %{$congLib}) {
    if ($key =~ /(SendUsing)|(SMTPServer)/) {
        printf "%s\n", $key;
    }
}