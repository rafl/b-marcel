#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "hook_op_check.h"
#include "hook_op_ppaddr.h"

static OP *
invoke_cb (pTHX_ OP *o, void *user_data)
{
  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  PUTBACK;

  call_sv((SV *)user_data, G_VOID | G_DISCARD);

  SPAGAIN;
  PUTBACK;

  FREETMPS;
  LEAVE;

  return o;
}

MODULE = B::Marcel  PACKAGE = B::Marcel

void
hook_ppaddr(OP *op, SV *cb)
  CODE:
    hook_op_ppaddr_around(op, invoke_cb, NULL, newSVsv(cb));
