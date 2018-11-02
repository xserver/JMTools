var i=0;

function timedCount()
{
i=i+1;
postMessage(i);
setTimeout("timedCount()",500);
    console('aa');
    alert('bbb');
}

timedCount();
