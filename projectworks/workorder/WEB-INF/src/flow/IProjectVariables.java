package flow;

/**
 * This interface is used to define the name of variables that are 
 * declared in the call flow.  All variables are defined as 
 * <code>public static final String</code>, which allows user-defined
 * code to reference variable names by the Java variable name.
 * Last generated by Orchestration Designer at: 20 ИЮЛЯ 2020 Г. 18:00:31 MSK
 */
public interface IProjectVariables {





	//{{START:PROJECT:VARIABLES
	/**
	 * This is a reserved block of variable name definitions.
	 * The variable names defined here can be used as the key
	 * to get the <code>com.avaya.sce.runtime.Variable</code>
	 * from the <code>SCESession</code> at runtime.<br>
	 * 
	 * For example, given a variable name <code>phoneNum</code>,
	 * user-defined code should access the variable in this format:<PRE>
	 *   Variable phNum = mySession.getVariable(IProjectVariables.PHONE_NUM);
	 *   if ( phNum != null ) {
	 *        // do something with the variable
	 *   }</PRE>
	 * 
	 * This block of code is generated automatically by Orchestration Designer and should not
	 * be manually edited as changes may be overwritten by future code generation.
	 * Last generated by Orchestration Designer at: 21 ИЮЛЯ 2020 Г. 12:14:05 MSK
	 */
	public static final String DATE = "date";
	public static final String REQUEST = "request";
	public static final String CODE = "code";
	public static final String MAIN_MENU = "mainMenu";
	public static final String SESSION = "session";
	public static final String CLAIM = "claim";
	public static final String MSISDN = "msisdn";
	public static final String DD_LAST_EXCEPTION = "ddLastException";
	public static final String RESPONSE = "response";
	public static final String TIME = "time";
	//}}END:PROJECT:VARIABLES
	//{{START:PROJECT:VARIABLEFIELDS
	public static final String DATE_FIELD_AUDIO = "audio";
	public static final String DATE_FIELD_DAYOFMONTH = "dayofmonth";
	public static final String DATE_FIELD_DAYOFWEEK = "dayofweek";
	public static final String DATE_FIELD_DAYOFWEEKNUM = "dayofweeknum";
	public static final String DATE_FIELD_DAYOFYEAR = "dayofyear";
	public static final String DATE_FIELD_MONTH = "month";
	public static final String DATE_FIELD_MONTHINYEAR = "monthinyear";
	public static final String DATE_FIELD_YEAR = "year";
	public static final String REQUEST_FIELD_ACTION = "action";
	public static final String REQUEST_FIELD_CLAIM__ID = "claim_id";
	public static final String REQUEST_FIELD_EMPLOYEE_ID = "employeeId";
	public static final String REQUEST_FIELD_FILTER = "filter";
	public static final String REQUEST_FIELD_MSISDN = "msisdn";
	public static final String MAIN_MENU_FIELD_CONFIDENCE = "confidence";
	public static final String MAIN_MENU_FIELD_INPUTMODE = "inputmode";
	public static final String MAIN_MENU_FIELD_INTERPRETATION = "interpretation";
	public static final String MAIN_MENU_FIELD_NOINPUTCOUNT = "noinputcount";
	public static final String MAIN_MENU_FIELD_NOMATCHCOUNT = "nomatchcount";
	public static final String MAIN_MENU_FIELD_UTTERANCE = "utterance";
	public static final String MAIN_MENU_FIELD_VALUE = "value";
	public static final String SESSION_FIELD_EXIT_CUSTOMER_ID = "exitCustomerId";
	public static final String SESSION_FIELD_EXIT_INFO_1 = "exitInfo1";
	public static final String SESSION_FIELD_EXIT_INFO_2 = "exitInfo2";
	public static final String SESSION_FIELD_EXIT_PARENT_ID = "exitParentId";
	public static final String SESSION_FIELD_EXIT_PREFERRED_PATH = "exitPreferredPath";
	public static final String SESSION_FIELD_EXIT_REASON = "exitReason";
	public static final String SESSION_FIELD_EXIT_TOPIC = "exitTopic";
	public static final String SESSION_FIELD_LASTERROR = "lasterror";
	public static final String SESSION_FIELD_SESSIONID = "sessionid";
	public static final String SESSION_FIELD_SESSIONLABEL = "sessionlabel";
	public static final String SESSION_FIELD_UCID = "ucid";
	public static final String CLAIM_FIELD_CRITICAL = "critical";
	public static final String CLAIM_FIELD_DESCRIPTION = "description";
	public static final String CLAIM_FIELD_ID = "id";
	public static final String CLAIM_FIELD_STATUS = "status";
	public static final String CLAIM_FIELD_TOPIC = "topic";
	public static final String DD_LAST_EXCEPTION_FIELD_ERRORCODE = "errorcode";
	public static final String DD_LAST_EXCEPTION_FIELD_MESSAGE = "message";
	public static final String DD_LAST_EXCEPTION_FIELD_OBJECT = "object";
	public static final String DD_LAST_EXCEPTION_FIELD_STACKTRACE = "stacktrace";
	public static final String DD_LAST_EXCEPTION_FIELD_TYPE = "type";
	public static final String RESPONSE_FIELD_ALL = "all";
	public static final String TIME_FIELD_AUDIO = "audio";
	public static final String TIME_FIELD_HOUR = "hour";
	public static final String TIME_FIELD_MILLISECOND = "millisecond";
	public static final String TIME_FIELD_MINUTE = "minute";
	public static final String TIME_FIELD_SECOND = "second";
	public static final String TIME_FIELD_TIMEZONE = "timezone";
	//}}END:PROJECT:VARIABLEFIELDS
}