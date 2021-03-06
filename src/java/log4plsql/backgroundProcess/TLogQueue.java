package log4plsql.backgroundProcess;

/* Class TLogQueue
   Generated by JPublisher (publish Oracle objects to Java classes)
   > jpub -user=user/password@sid -sql=T_LOG_QUEUE
   
   
*/

import java.sql.SQLException;
import java.sql.Connection;
import oracle.jdbc.OracleTypes;
import oracle.sql.ORAData;
import oracle.sql.ORADataFactory;
import oracle.sql.Datum;
import oracle.sql.STRUCT;
import oracle.jpub.runtime.MutableStruct;

public class TLogQueue implements ORAData, ORADataFactory
{
  public static final String _SQL_NAME = "T_LOG_QUEUE";
  public static final int _SQL_TYPECODE = OracleTypes.STRUCT;

  protected MutableStruct _struct;

  protected static int[] _sqlType =  { 2,91,2,2,12,12,12 };
  protected static ORADataFactory[] _factory = new ORADataFactory[7];
  protected static final TLogQueue _TLogQueueFactory = new TLogQueue();

  public static ORADataFactory getORADataFactory()
  { return _TLogQueueFactory; }
  /* constructors */
  protected void _init_struct(boolean init)
  { if (init) _struct = new MutableStruct(new Object[7], _sqlType, _factory); }
  public TLogQueue()
  { _init_struct(true); }
  public TLogQueue(java.math.BigDecimal lid, java.sql.Timestamp ldate, java.math.BigDecimal lhsecs, java.math.BigDecimal llevel, String lsection, String luser, String ltext) throws SQLException
  { _init_struct(true);
    setLid(lid);
    setLdate(ldate);
    setLhsecs(lhsecs);
    setLlevel(llevel);
    setLsection(lsection);
    setLuser(luser);
    setLtext(ltext);
  }

  /* ORAData interface */
  public Datum toDatum(Connection c) throws SQLException
  {
    return _struct.toDatum(c, _SQL_NAME);
  }


  /* ORADataFactory interface */
  public ORAData create(Datum d, int sqlType) throws SQLException
  { return create(null, d, sqlType); }
  protected ORAData create(TLogQueue o, Datum d, int sqlType) throws SQLException
  {
    if (d == null) return null; 
    if (o == null) o = new TLogQueue();
    o._struct = new MutableStruct((STRUCT) d, _sqlType, _factory);
    return o;
  }
  /* accessor methods */
  public java.math.BigDecimal getLid() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(0); }

  public void setLid(java.math.BigDecimal lid) throws SQLException
  { _struct.setAttribute(0, lid); }


  public java.sql.Timestamp getLdate() throws SQLException
  { return (java.sql.Timestamp) _struct.getAttribute(1); }

  public void setLdate(java.sql.Timestamp ldate) throws SQLException
  { _struct.setAttribute(1, ldate); }


  public java.math.BigDecimal getLhsecs() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(2); }

  public void setLhsecs(java.math.BigDecimal lhsecs) throws SQLException
  { _struct.setAttribute(2, lhsecs); }


  public java.math.BigDecimal getLlevel() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(3); }

  public void setLlevel(java.math.BigDecimal llevel) throws SQLException
  { _struct.setAttribute(3, llevel); }


  public String getLsection() throws SQLException
  { return (String) _struct.getAttribute(4); }

  public void setLsection(String lsection) throws SQLException
  { _struct.setAttribute(4, lsection); }


  public String getLuser() throws SQLException
  { return (String) _struct.getAttribute(5); }

  public void setLuser(String luser) throws SQLException
  { _struct.setAttribute(5, luser); }


  public String getLtext() throws SQLException
  { return (String) _struct.getAttribute(6); }

  public void setLtext(String ltext) throws SQLException
  { _struct.setAttribute(6, ltext); }

} 
