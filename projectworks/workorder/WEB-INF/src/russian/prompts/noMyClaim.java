/**
 * Last generated by Orchestration Designer at: 21 ИЮЛЯ 2020 Г. 8:12:35 MSK
 */
package russian.prompts;

public class noMyClaim extends com.avaya.sce.runtime.Prompt {

	//{{START:CLASS:FIELDS
	//}}END:CLASS:FIELDS

	/**
	 * Constructor for noMyClaim.
	 */
	public noMyClaim() {
		//{{START:CLASS:CONSTRUCTOR
		super();
		//}}END:CLASS:CONSTRUCTOR
	}


	/**
	 * This method is generated automatically and should not be manually edited
	 * To manually edit the prompt, override:
	 * void updatePrompt()
	 * Last generated by Orchestration Designer at: 21 ИЮЛЯ 2020 Г. 17:11:54 MSK
	 */
	public void buildPrompt(){
		com.avaya.sce.runtime.Format format = null;
		com.avaya.sce.runtime.RenderHint hint = null;
		com.avaya.sce.runtime.MediaPage mediaPage = null;
		setBarginType(com.avaya.sce.runtimecommon.SCERT.BARGIN_SPEECH);
		setName("noMyClaim");
		setOrder(com.avaya.sce.runtime.Prompt.STANDARD);

		// Prompt level 1
		setTimeout(1,8000);
		setBargin(1,true);

		add(1, new com.avaya.sce.runtime.PromptElement(com.avaya.sce.runtime.PromptElement.HTMLTEXTELEMENT,"<h1>У Вас нет заявок в работе!", null));

		add(1, new com.avaya.sce.runtime.PromptElement(com.avaya.sce.runtime.PromptElement.HTMLTEXTELEMENT,"</h1>", null));

		add(1, new com.avaya.sce.runtime.PromptElement(com.avaya.sce.runtime.PromptElement.HTMLTEXTELEMENT,"<p style=\"font-weight:bold\">", null));

		add(1, new com.avaya.sce.runtime.PromptElement(com.avaya.sce.runtime.PromptElement.HTMLTEXTELEMENT,"Возьмите в работу новую заявку!", null));

		add(1, new com.avaya.sce.runtime.PromptElement(com.avaya.sce.runtime.PromptElement.HTMLTEXTELEMENT,"</p>", null));

	}
}
