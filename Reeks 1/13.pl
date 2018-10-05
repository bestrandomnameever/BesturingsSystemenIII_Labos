use Net::SMTP;

$smtp = Net::SMTP->new('smtp.ugent.be');   #stel de juiste smtp-server in 
$smtp->mail('anthony.baert@ugent.be');
$smtp->to('anthony.baert@ugent.be');

$smtp->data();
$smtp->datasend("Subject: testje met smtp\n");
$smtp->datasend("test\n");
$smtp->dataend();
$smtp->quit;