package russian.textsets;

/**
 * This textset class will be automatically populated with data from the 
 * textset project file.  Manual edits should only be outside of the tag 
 * areas or overridden methods. 
 * Class created on: 
 * Last generated by Orchestration Designer at: 20 ИЮЛЯ 2020 Г. 18:18:58 MSK
 */
public class mainMenu extends com.avaya.sce.runtime.Textset { 

	//{{START:CLASS:FIELDS
	private static final com.avaya.sce.runtime.Textset.TextMap TEXT_MAP;
	//}}END:CLASS:FIELDS

	/**
	 * Static initializer
	 */
	static {
		//{{START:TEXTSET:STATIC

		// Create the text map, then populate with texts
		TEXT_MAP = new com.avaya.sce.runtime.Textset.TextMap(14);
		com.avaya.sce.runtime.TextsetText text;

		// text: listClaim
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "listClaim","Все заявки"); 

		// text: getClaim
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "getClaim","Взять в работу"); 

		// text: closeClaim
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "closeClaim","Закрыть заявку"); 

		// text: farewell
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "farewell","Выход"); 

		// text: msisdn
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "msisdn","Номер телефона"); 

		// text: code
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "code","Код из SMS"); 

		// text: listMyClaim
		com.avaya.sce.runtime.Textset.addLocalText(TEXT_MAP, "listMyClaim","Мои заявки"); 

		//}}END:TEXTSET:STATIC
	}
	/**
	 * Returns the Text with the given name.  To override the
	 * behavior and dynamically return a different Text object,
	 * override the method "hookGetText(...)".
	 * 
	 * This method is generated automatically by the code generator
	 * and should not be manually edited.  Manual edits may be overwritten
	 * by the code generator.
	 * Last generated by Orchestration Designer at: 21 ИЮЛЯ 2020 Г. 17:11:54 MSK
	 * @see com.avaya.sce.runtime.Textset#getText(String) 
	 */ 
	public com.avaya.sce.runtime.TextsetText getTextsetText(String textName) {
		return(getTextsetText(mainMenu.TEXT_MAP, textName));
	}
}
