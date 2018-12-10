\d .redir

codes:()!()                                                                         //status code dict for redirects
codes[300]:"Multiple Choices";
codes[301]:"Moved Permanently";
codes[302]:"Found";
codes[303]:"See other";
codes[304]:"Not Modified";
codes[305]:"Use Proxy";
codes[306]:"Switch Proxy";
codes[307]:"Temporary Redirect";
codes[308]:"Permanent Redirect";

head:{.h.htc[`head].h.htc[`title]string[x]," ",codes x};                            //title for HTML page
body:{
  .h.htc[`body]raze(
     .h.htc[`h1]codes x;                                                            //heading
     .h.htc[`p]"The document has moved ",.h.htac[`a;(1#`href)!enlist y;"here"]      //redirect link
    )
 }
html:{"<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">",head[x],body[x;y]}     //generate HTML redirect page

err:{[c;u] /c:code, u:redirect URL
  b:html[c;u];                                                                      //generate HTML redirect page
  h:enlist[""]!enlist"";                                                            //empty record to set types for dict
  h["Content-Type"]:.h.ty`html;                                                     //response headers
  h["Content-Length"]:count b;                                                      //response headers
  h["Connection"]:"close";                                                          //response headers
  h["Location"]:u;                                                                  //response headers
  h:.req.enchd 1_h;                                                                 //drop empty key
  :"HTTP/1.1 ",string[c]," ",codes[c],"\r\n",h,b;                                   //return HTTP response
 }

h:{[x;y] /x:handler to overwrite,y:HTTP request
  if[0=count .z.e;                                                                  //check for TLS params
     :.redir.err[301]"https://",(last[y][`Host]),"/",first " "vs y 0];              //if HTTP, redirect
  :x@y;                                                                             //if HTTPS, use orig handler
 }

\d .

.z.ph:.redir.h[.z.ph]                                                               //GET
.z.pp:.redir.h[.z.pp]                                                               //POST
