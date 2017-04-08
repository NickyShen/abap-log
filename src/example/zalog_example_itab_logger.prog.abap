REPORT zalog_example_itab_logger.

DATA(go_logger) = NEW zcl_alog_itab_logger( ).

go_logger->info( `Hello world.` ).
go_logger->warning( `Hello darkness my old friend.` ).
go_logger->error( `I've come to talk with you again.` ).
go_logger->debug( `BEEP BOOP` ).
go_logger->exception( NEW zcx_alog_argument_null( ) ).

MESSAGE s000(zalog) WITH 'Hello from message class' INTO DATA(gv_dummy) ##NEEDED.
go_logger->info_msg( ).

go_logger->warning_msg(
  iv_msgid = 'ZALOG'
  iv_msgno = '001'
  iv_msgv1 = 'Hello from message class'
  iv_msgv2 = 'without where used list support...'
).

TRY.
*    go_logger->display_as_alv( ).
    go_logger->display_as_alv_popup( ).
  CATCH cx_salv_msg INTO DATA(gx_ex).
    MESSAGE gx_ex TYPE 'E'.
ENDTRY.
