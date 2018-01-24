.worker.create:{[c;cb] /c:command for worker to run e.g. q script path,cb:callback function
  if[not system"p";system"p 0W"];                   //if current proc not on a port, pick a random available one
  p:string system"p";                               //get current port to give to worker for callback
  cb:string cb;                                     //convert callback function name to string
  system"q "," " sv (c;p;cb);                       //start bg process, telling it port & cb function to return to
 }

.worker.ret:{[x]
  (`$"::",.z.x 0)(cb:`$.z.x 1;x);
 }

\
Example usage:

q)-1 read0`:util/dummy_worker.q;
\l util/worker.q
system"sleep 10";
.worker.ret[1+1];
q).work.cb:{0N!x}
q).worker.create["util/dummy_worker.q";`.work.cb]
q)
q)
q)/not hung
q)2 /value returned from worker

