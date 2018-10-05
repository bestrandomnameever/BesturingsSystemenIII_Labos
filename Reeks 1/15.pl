use Win32::OLE qw(in with);

$Message = Win32::OLE->New("CDO.Message");
$Configuration = Win32::OLE->New("CDO.Configuration");



$Message->{Configuration} = $Configuration;

$Message->{To} = 'anthony.baert@ugent.be';
$Message->{From} = 'anthony.baert@ugent.be';
$Message->{Subject} = 'test';
$Message->{TextBody} = 'Test';
$Message->Send();