use Win32::OLE qw(in with);

$Message = Win32::OLE->New("CDO.Message");

$Message->{To} = 'anthony.baert@ugent.be';
$Message->{From} = 'anthony.baert@ugent.be';
$Message->{Subject} = 'test';
$Message->{TextBody} = 'Test';
$Message->Send();