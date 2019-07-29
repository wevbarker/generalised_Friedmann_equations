#	The CLIo package (Clio is a Greek muse of history) stands for "Command Line Interface options".

CLIo[dit]:=proc(opts::set,message::string,n1:=NULL,n2:=NULL,n3:=NULL,n4:=NULL,n5:=NULL)::NULL;
  description "Enhanced commentary for the CLI.";
  local tmp1,tmp2,transl,possible,violators,accepted,ii;
  transl:=table([none=0,bold=1,faint=2,italic=3,underline=4,sblink=5,fblink=6,conceal=8,cross=9,dunderline=21,fblack=30,fred=31,fgreen=32,fyellow=33,fblue=34,fmagenta=35,fcyan=36,fwhite=37,bblack=40,bred=41,bgreen=42,byellow=43,bblue=44,bmagenta=45,bcyan=46,bwhite=47,frame=51,encircle=52,overline=53]);
  possible:=map(op,{indices(transl)});
  if evalb(opts={}) then
    tmp2:="\e[1;34m";
  else
    if evalb(opts subset possible) then
      tmp2:="";
      for ii from 1 to numelems(opts) do
	tmp2:=cat(tmp2,convert(transl[opts[ii]],string),";");
      end do;
      tmp2:=cat("\e[",substring(tmp2,1..-2),"m");
    else
      violators:=convert(opts minus possible,string);
      accepted:=convert(possible,string);
      error cat("some of your formatting options are wrong, namely, ",violators," which are not in ",accepted);
    end if;
  end if;
  tmp1:=cat(tmp2,message,"\e[00m\n\n");
  printf(tmp1,n1,n2,n3,n4,n5);
  return NULL;
end proc;

CLIo[fin]:=proc()::NULL;
  description "Prints a nice bold message to let you know when you're done.";
  dit({byellow,fblack,bold,underline},"CALCULATION FINISHED");
  `quit`(12);
end proc;
