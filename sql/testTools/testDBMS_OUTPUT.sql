/*
Feature tested

PLOG
    DBMS_OUTPUT
       features        
*/

begin PLOG.PURGE; end;
/

SET SERVEROUTPUT ON SIZE 1000000 
set linesize 2000

--default context
begin PLOG.debug ('stdout SQLPLUS'); end;
/

declare
    pCTX       PLOGPARAM.LOG_CTX := PLOG.INIT (pDBMS_OUTPUT => TRUE , pLEVEL       => PLOG.LDEBUG) ;
    pCTX1      PLOGPARAM.LOG_CTX ; 
    mess       varchar2(4000) ;
begin 
    if plog.getDBMS_OUTPUTMode(pCTX) then
       plog.info( pCTX , 'getDBMS_OUTPUTMode(pCTX1) is true ');
    else
        plog.info( pCTX , 'getDBMS_OUTPUTMode(pCTX1) is false ');
        plog.setDBMS_OUTPUTMode(pCTX);
    end if;

    -- test limit to 2000 charactere
    
    for i in 1..1997 loop        
        mess := mess || '-';
    end loop;
    
    mess := mess || 'End';
    
    PLOG.debug (pCTX, mess);
    
    mess := mess || 'TooLong';
    begin
        PLOG.debug (pCTX, mess);
    Exception
        WHEN OTHERS THEN
            PLOG.debug (pCTX);
    END;
end;
/

select * from vlog;

SET SERVEROUTPUT OFF

/* Result in SQLPUS.

SQL> exec PLOG.PURGE;

Proc�dure PL/SQL termin�e avec succ�s.

SQL>
SQL> SET SERVEROUTPUT ON SIZE 1000000
SQL> set linesize 2000
SQL>
SQL>
SQL>
SQL> --default context
SQL> exec PLOG.debug ('stdout SQLPLUS');

Proc�dure PL/SQL termin�e avec succ�s.

SQL>
SQL> declare
  2      pCTX       PLOGPARAM.LOG_CTX := PLOG.INIT (pDBMS_OUTPUT => TRUE , pLEVEL       => PLOG.LDEBUG) ;
  3      pCTX1      PLOGPARAM.LOG_CTX ;
  4      mess       varchar2(4000) ;
  5  begin
  6      if plog.getDBMS_OUTPUTMode(pCTX) then
  7         plog.info( pCTX , 'getDBMS_OUTPUTMode(pCTX1) is true ');
  8      else
  9          plog.info( pCTX , 'getDBMS_OUTPUTMode(pCTX1) is false ');
 10          plog.setDBMS_OUTPUTMode(pCTX);
 11      end if;
 12
 13      -- test limit to 2000 charactere
 14
 15      for i in 1..1997 loop
 16          mess := mess || '-';
 17      end loop;
 18
 19      mess := mess || 'End';
 20
 21      PLOG.debug (pCTX, mess);
 22
 23      mess := mess || 'TooLong';
 24      begin
 25          PLOG.debug (pCTX, mess);
 26      Exception
 27          WHEN OTHERS THEN
 28              PLOG.debug (pCTX);
 29      END;
 30  end;
 31  /
22:27:44:28-INFO-block  getDBMS_OUTPUTMode(pCTX1) is true
22:27:44:28-DEBUG-block  ---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-----------------------------------------------End
22:27:44:28-ERROR-block  AAS-20000: Log Message id:4264 too long.
22:27:44:28-DEBUG-block  ---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-----------------------------------------------End

Proc�dure PL/SQL termin�e avec succ�s.

SQL>
SQL> select * from vlog;

LOG

[Mars  29, 22:27:32:28][INFO][GBM010][plog.purge][Purge by user:GBM010]
[Mars  29, 22:27:44:28][INFO][GBM010][block][getDBMS_OUTPUTMode(pCTX1) is true ]

-------------------------------------------End]


-------------------------------------------End]

[Mars  29, 22:27:44:28][ERROR][GBM010][block][AAS-20000: Log Message id:4264 too long. ]

SQL>
SQL> SET SERVEROUTPUT OFF
SQL>
SQL>
*/