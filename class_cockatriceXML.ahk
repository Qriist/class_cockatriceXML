/*
.<set>
.  <name>XXX</name>
.  <longname>My awesome custom card set</longname>
.  <settype>Custom</settype>
.  <releasedate>2019-04-20</releasedate>
.</set>
*/

/*
.<card>
.  <name>Card name</name>
.  <text>Card description and oracle text, including actions, effects, etc..</text>
.  <prop>
.    <layout>normal</layout>
.    <side>front</side>
.    <type>Instant</type>
.    <maintype>Instant</maintype>
.    <manacost>R</manacost>
.    <cmc>1</cmc>
.    <colors>R</colors>
.    <coloridentity>R</coloridentity>
.    <pt>0/2</pt>
.    <loyalty>4</loyalty>
.    <format-standard>legal</format-standard>
.    <format-commander>legal</format-commander>
.    <format-modern>legal</format-modern>
.    <format-pauper>legal</format-pauper>
.  </prop>
.  <set rarity="common" uuid="12345678-abcd-1234-abcd-1234567890ab" num="42" muid="123456" picurl="http://.../image.jpg">XXX</set>	;CAN HAVE ANY NUMBER OF SET NODES
.  <related>Another card name</related>
.  <reverse-related>Another card name</reverse-related>
.  <token>1</token>	;OPTIONAL
.  <tablerow>3</tablerow>
.  <cipt>1</cipt>	;OPTIONAL
.  <upsidedown>1</upsidedown>	;OPTIONAL
.</card>
*/

/*
	Optional attributes can be used to add specific informations about the card in that set. These are the attributes that are commonly used:
	name	 = Description
	
	rarity = A textual description of the card's rarity in that set. This information can be useful to sort or filter cards in the deck editor. Common values are rare, uncommon, common.
	
	uuid = A universally unique identifier of this card in this set that must be unique for every single card. This can be used to reference the card on external resources, eg. to load a card picture from a website.
	
	num = The card's collector number in the set. This can be used to reference the card on external resources, eg. to load a card picture from a website.
	
	muid	= The card's multiverse id. This is a special code assigned to each card in a specific game (MtG).
	
	picurl = The complete URL (including the protocol prefix, eg. http://) to a picture of this card. This url will be used to download the card picture.
	
	
	Card relations can accept these optional attributes:
	
	name 	Description
	count	The number of cards that will be created; eg. for a card that creates three equal tokens, set it to 3 )
	attach	If the created card must be attached to the original card, set it to attach
	exclude	If you want the "Create all related cards" action to exclude this card from being created, set it to exclude
*/

/*
.<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
.    <xs:complexType name="relatedType">
.        <xs:simpleContent>
.            <xs:extension base="xs:string">
.                <xs:attribute type="xs:string" name="count" use="optional" />
.                <xs:attribute type="xs:string" name="exclude" use="optional" />
.                <xs:attribute type="xs:string" name="attach" use="optional" />
.            </xs:extension>
.        </xs:simpleContent>
.    </xs:complexType>
.    <xs:complexType name="setType">
.        <xs:all>
.            <xs:element type="xs:string" name="name" minOccurs="1" maxOccurs="1" />
.            <xs:element type="xs:string" name="longname" minOccurs="0" maxOccurs="1" />
.            <xs:element type="xs:string" name="settype" minOccurs="0" maxOccurs="1" />
.            <xs:element type="xs:string" name="releasedate" minOccurs="0" maxOccurs="1" />
.        </xs:all>
.    </xs:complexType>
.    <xs:complexType name="cardInSetType">
.        <xs:simpleContent>
.            <xs:extension base="xs:string">
.                <xs:attribute type="xs:string" name="muid" use="optional" />
.                <xs:attribute type="xs:string" name="uuid" use="optional" />
.                <xs:attribute type="xs:anyURI" name="picurl" use="optional" />
.                <!-- permit usage of the old, half-uppercase tag -->
.                <xs:attribute type="xs:anyURI" name="picURL" use="optional" />
.                <xs:attribute type="xs:string" name="num" use="optional" />
.                <xs:attribute type="xs:string" name="rarity" use="optional" />
.            </xs:extension>
.        </xs:simpleContent>
.    </xs:complexType>
.    <xs:group name="cardPropertyGroup">
.        <xs:sequence>
.            <xs:any processContents="skip" minOccurs="0" maxOccurs="unbounded" />
.        </xs:sequence>
.    </xs:group>
.    <xs:complexType name="cardType">
.        <xs:sequence>
.            <xs:element type="xs:string" name="name" minOccurs="1"/>
.            <xs:element type="xs:string" name="text" minOccurs="0" maxOccurs="1" />
.            <xs:element name="prop" minOccurs="0" maxOccurs="1">
.                <xs:complexType>
.                    <xs:group ref="cardPropertyGroup"/>
.                </xs:complexType>
.            </xs:element>
.            <xs:element type="cardInSetType" name="set" minOccurs="1" maxOccurs="unbounded" />
.            <xs:choice minOccurs="0" maxOccurs="unbounded">
.                <xs:element type="relatedType" name="related" minOccurs="0" maxOccurs="unbounded" />
.                <xs:element type="relatedType" name="reverse-related" minOccurs="0" maxOccurs="unbounded" />
.            </xs:choice>
.            <xs:element type="xs:boolean" name="token" minOccurs="0" maxOccurs="1" />
.            <xs:element type="xs:integer" name="tablerow" minOccurs="0" maxOccurs="1" />
.            <xs:element type="xs:boolean" name="cipt" minOccurs="0" maxOccurs="1" />
.            <xs:element type="xs:boolean" name="upsidedown" minOccurs="0" maxOccurs="1" />
.        </xs:sequence>
.    </xs:complexType>
.    <xs:element name="cockatrice_carddatabase">
.        <xs:complexType>
.            <xs:sequence>
.                <xs:element name="info" minOccurs="0" maxOccurs="1">
.                    <xs:complexType>
.                        <xs:all>
.                            <xs:element type="xs:string" name="author" minOccurs="0" maxOccurs="1" />
.                            <xs:element type="xs:string" name="createdAt" minOccurs="0" maxOccurs="1" />
.                            <xs:element type="xs:string" name="sourceUrl" minOccurs="0" maxOccurs="1" />
.                            <xs:element type="xs:string" name="sourceVersion" minOccurs="0" maxOccurs="1" />
.                        </xs:all>
.                    </xs:complexType>
.                </xs:element>
.                <xs:element name="sets" minOccurs="0">
.                    <xs:complexType>
.                        <xs:sequence>
.                            <xs:element type="setType" name="set" maxOccurs="unbounded" minOccurs="0" />
.                        </xs:sequence>
.                    </xs:complexType>
.                </xs:element>
.                <xs:element name="cards" minOccurs="0">
.                    <xs:complexType>
.                        <xs:sequence>
.                            <xs:element type="cardType" name="card" maxOccurs="unbounded" minOccurs="0" />
.                        </xs:sequence>
.                    </xs:complexType>
.                </xs:element>
.            </xs:sequence>
.            <xs:attribute type="xs:integer" name="version" fixed="4" />
.        </xs:complexType>
.    </xs:element>
.</xs:schema>
*/

class class_cockatriceXML{
	static gameEntity := []
	static currentCardEntity := []
	static currentCard := ""
	static currentSetEntity := []
	static currentSet := ""
	static xmlInProgress := []
	static xmlsize := 262144000
	static base64 := []
	init(incomingGameEntityName := ""){
		this.gameEntity := []
		this.gameEntity["game"] := incomingGameEntityName
		this.gameEntity["cards"] := []
		this.gameEntity["sets"] := []
		this.gameEntity["relationships"] := []
		this.currentCardEntity := []
	}
	
	
	;new entities
	newCardEntity(incomingName,autoChangeToNewEntity := 1){
		if this.gameEntity["cards"].HasKey(incomingName)
			return
		
		;construct the basic card object
		card := this.gameEntity["cards",incomingName] := []
		card["name"] := incomingName
		,card["text"] := ""
		,card["props"] := []
		,card["sets"] := []
		,card["sets",0] := []	;maintains a list of visibleSetCodes
		,card["related"] := []
		,card["reverse-related"] := []
		,card["token"] := 0
		,card["tablerow"] := 3
		,card["cipt"] := 0
		,card["upsidedown"] := 0
		
		if (autoChangeToNewEntity = 1)
			this.changeCardEntity(incomingName)
	}
	newSetEntity(incomingName,autoChangeToNewEntity := 1){
		if this.gameEntity["sets"].HasKey(incomingName)
			return
		
		;construct the basic set object
		set := this.gameEntity["sets",incomingName] := []
		set["name"] := incomingName
		,set["longname"] := ""
		,set["settype"] := ""
		,set["releasedate"] := ""
		
		if (autoChangeToNewEntity = 1)
			this.changeSetEntity(incomingName)
	}
	
	
	;changing the current default entity
	changeCardEntity(incomingName){
		this.currentCardEntity := this.gameEntity["cards",incomingName]
		this.currentCard := incomingName
	}
	changeSetEntity(incomingName){
		this.currentSetEntity := this.gameEntity["sets",incomingName]
		this.currentSet := incomingName
	}
	
	
	;setting an entity property
	setMajorCardProp(propName,propValue, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,propName] := propValue
	}
	setCardProp(propName,propValue, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,"props",propName] := propValue
	}
	setSetProp(propName, propValue, nameOfSetEntity := ""){
		if (nameOfSetEntity = "")
			nameOfSetEntity := this.currentSet
		this.gameEntity["sets",nameOfSetEntity,propName] := propValue
	}
	attachSetToCard(visibleSetCode,setArr,nameOfCardEntity := ""){
		;used for generating the unbounded <set> tags on each card
		;first parameter is what's visible in cockatrice
		;visibleSetCode does not need to be unique, nor does any property of setArr[]
		;all properties will be attached exactly as passed, k=v
		;pseudocode template: <set setArr["prop1"]="abc" setArr["prop2"]="xyz">visibleSetCode</set>
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,"sets"].push(setArr)	;should start from 1
		this.gameEntity["cards",nameOfCardEntity,"sets",0,(this.gameEntity["cards",nameOfCardEntity,"sets"].count()-1)] := visibleSetCode
	}
	attachRelatedCard(relatedCard,relatedCardObj,nameOfCardEntity := ""){
		;attaches relatedCard to nameOfCardEntity
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,"relationships","related",relatedCard] := relatedCardObj
	}
	attachReverseRelatedCard(rRelatedCard,rRelatedCardObj,nameOfCardEntity := ""){
		;attaches rRelatedCard card to nameOfCardEntity
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,"relationships","reverse-related",rRelatedCard] := rRelatedCardObj
	}
	
	;appending to a property
	appendMajorCardProp(propName,propValue, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,propName] .= propValue
	}
	appendCardProp(propName,propValue, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,"props",propName] .= propValue
	}
	appendSetProp(propName, propValue, nameOfSetEntity := ""){
		if (nameOfSetEntity = "")
			nameOfSetEntity := this.currentSet
		this.gameEntity["sets",nameOfSetEntity,propName] .= propValue
	}
	
	;prepending to a property
	prependMajorCardProp(propName,propValue, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,propName] := propValue this.gameEntity["cards",nameOfCardEntity,propName]
	}
	prependCardProp(propName,propValue, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		this.gameEntity["cards",nameOfCardEntity,"props",propName] := propValue this.gameEntity["cards",nameOfCardEntity,propName]
	}
	prependSetProp(propName, propValue, nameOfSetEntity := ""){
		if (nameOfSetEntity = "")
			nameOfSetEntity := this.currentSet
		this.gameEntity["sets",nameOfSetEntity,propName] := propValue this.gameEntity["cards",nameOfCardEntity,propName]
	}
	
	
	;retrieving an entity property
	getMajorCardProp(propName, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		return this.gameEntity["cards",nameOfCardEntity,propName]
	}
	getCardProp(propName, nameOfCardEntity := ""){
		if (nameOfCardEntity="")
			nameOfCardEntity := this.currentCard
		return this.gameEntity["cards",nameOfCardEntity,"props",propName]
	}
	getSetProp(propName,nameOfSetEntity := ""){
		if (nameOfSetEntity = "")
			nameOfSetEntity := this.currentSetEntity
		return this.gameEntity["sets",nameOfSetEntity,propName]
	}
	
	
	;retrieving an entire entity object
	getCardEntity(nameOfCardEntity := ""){
		if (nameOfCardEntity = "")
			return this.currentCardEntity
		return this.gameEntity["cards",nameOfCardEntity]
	}
	getSetEntity(nameOfSetEntity := ""){
		if (nameOfSetEntity = "")
			return this.currentSetEntity
		return this.gameEntity["sets",nameOfSetEntity]
	}
	
	
	;font stuff
	colorizeText(inText,inColor,boldOrItalics := ""){
		;wraps text in html color tags (pass either specific words or 0xFFFFFF codes)
		;useful links to look at the colors
		;	https://htmlcolorcodes.com/color-names/
		;	https://www.computerhope.com/jargon/w/w3c-color-names.htm
		return "<font color=" chr(34) inColor chr(34) ">" this.boldOrItalicText(inText,boldOrItalics) "</font>"
	}
	colorizeBackground(inText,inColor){	;use just for 
		
		return
	}
	longdash(){	;longdash is useful when building type lines - just a shortcut
		return "—"
	}
	ld(){	;longdash alias
		return this.longdash()
	}
	boldOrItalicText(inText,boldOrItalic := ""){
		;0 = nothing
		;1 = bold
		;2 = italic
		;3 = both
		switch boldOrItalic {
			case "",0: {
				return inText
			}
			case 1,"bold","b": {
				return "<b>" inText "</b>"
			}
			case 2,"italic","i": {
				return "<i>" inText "</i>"
			}
			case 3,"bolditalic","bi": {
				return "<b><i>" inText "</i></b>"
			}
			Default: {
				return inText
			}
		}
	}
	colorizeBackgroundAndText(inText, backgroundColor := "white", textColor := "black", boldOrItalics := ""){
		;using a dirty hack to get in-line background colors... 
		;a code block is used due Cockatrice's extremely limited rendering engine
		
		;should probably expand the font list to prioritize the current modern OS fonts
		;static codeblockFonts := st_glue(["Helvetica","sans-serif"],",")
		
		;return "<code style=""background-color:" backgroundColor ";font-family:" codeblockFonts ";"">" this.colorizeText(inText,textColor,boldOrItalics) "</code>"
		return "<span style=""background-color:" backgroundColor ";"">" this.colorizeText(inText,textColor,boldOrItalics) "</span>"
		;bodyStart := 
		;bodyEnd := 
	}
	embedImage(imgPath,styleObj := ""){
		if this.base64.HasKey(imgPath)	;image already processed into memory
			return "<img src=""data:image/png;base64," this.base64[imgPath] """ /></img>"
		
		FileOpen(imgPath,"r").RawRead(rawData,FileGetSize(imgPath))
		LC_Base64_Encode(img64, rawData, FileGetSize(imgPath))
		this.base64[imgPath] := img64
		return "<img" this.StyleOptions(styleObj) " src=""data:image/png;base64," this.base64[imgPath] """ /></img>"
	}
	embedComment(inText,ByRef dedupe := ""){
		;used to add invisible comments, usually when you need to add a search term without affecting game text
		;won't embed the comment if it exists in dedupe in order to save xml space
		if !InStr(dedupe,inText)
			return "<!--" inText "-->"
	}
	addTable(ByRef tableObj,ByRef colRowObj := ""){
		;format any number of outer objects (rows) plus any number of nested inner keys (columns) into an HTML table
		;all font processing should be done as the tableObj is built
		;backgroundObj is used to set the background color of a specific cell
		;example backgroundObj key:  {"4|2" : "green"}  where "4|2" corresponds to row 4 and column 2
		
		if (tableObj.count() = 0)	;nothing to do
			return
		
		body := "<table>"
		loop, % tableObj.count(){
			rowIndex := a_index			
			body .= "<tr " this.StyleOptions(colRowObj["row",rowIndex]) ">"
			loop, % tableObj[rowIndex].count(){
				colIndex := a_index
				
				if (tableObj[rowIndex,colIndex,"colspan"] != "")
					colspan := a_space "colspan=" tableObj[rowIndex,colIndex,"colspan"]
				if (tableObj[rowIndex,colIndex,"rowspan"] != "")
					rowspan := a_space "rowspan=" tableObj[rowIndex,colIndex,"rowspan"]
				for k,v in ["backgound-color","font-weight"]{
					
				}
				if (style != "")
					style := "style=" chr(34) style chr(34)
				;if (tableObj[rowIndex,colIndex,"background-color"] != "")
					;bgcolor := a_space "style=" chr(34) "background-color:" tableObj[rowIndex,colIndex,"background-color"] ";" chr(34)
				body .= "<td" colspan rowspan this.StyleOptions(tableObj[rowIndex,colIndex]) ">" tableObj[rowIndex,colIndex,"text"] "</td>"
				
				;msgbox % "<td" colspan ">" tableObj[rowIndex,colIndex,"text"] "</td>"
				style := colspan := ""	;reset values
				
			}
			body .= "</tr>"
		}
		body .= "</table>"
		;msgbox % clipboard := body
		return body 
	}
	addList(listObj,listType := "u"){
		;creates an ordered or unordered list
		;defaults to unordered, set listType to "o" to make an ordered list
		For k,v in listObj{
			outList .= "<li>" v "</li>"
		}
		if (outList != "")
			return "<" listType "l>" outList "<" listType "l>"
	}
	styleOptions(ByRef styleObj){
		;pass in any object and it will return a style string with all matching keys
		
		for k,v in ["background-color","font-weight","text-align","vertical-align"]
			if styleObj.HasKey(v)
				styleStr .= v ":" styleObj[v] ";"
		
		if (styleStr != "")
			return " style=" chr(34) styleStr chr(34)
	}
	
	uniqify(stripNonAlphanumeric := 1,normalizeCase := 1,params*){
		;pass in any number of strings and objects to create a unique hash of all discovered text
		;stripNonAlphanumeric removes all white space, punctuation, and special characters before hashing
		;normalizeCase makes everything lowercase before hashing
		for k,v in params
			unique .= (IsObject(v)?json.dump(v):v)
		If (stripNonAlphanumeric = 1)
			unique := RegExReplace(unique,"\W")
		If (normalizeCase = 1)
			unique := StringLower(unique)
		;msgbox % unique
		return LC_SHA512(unique)
	}
	
	;XML generation
	generateXML(infoObj := ""){
		;ret := this.generateXML_header(infoObj)
		;ret .= this.generateXML_sets()
		;ret .= this.generateXML_cards()
		;ret .= this.generateXML_footer()
		;return ret
		
		this.xmlInProgress := []
		this.generateXML_header(infoObj)
		this.generateXML_sets()
		this.generateXML_cards()
		this.generateXML_footer()
		ret := ""
		VarSetCapacity(ret,this.xmlsize)
		;msgbox % 
		for k,v in this.xmlInProgress {
			ret .= this.xmlInProgress[k]
		}
		return ret
	}
	generateXML_header(infoObj := ""){
		this.xmlInProgress.push("<?xml version=""1.0"" encoding=""UTF-8""?>`n")
		this.xmlInProgress.push("<cockatrice_carddatabase version=""4"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xsi:schemaLocation=""https://raw.githubusercontent.com/Cockatrice/Cockatrice/master/doc/carddatabase_v4/cards.xsd"">`n")
		this.xmlInProgress.push(a_tab "<info>`n")
		for k,v in infoObj {
			this.xmlInProgress.push(a_tab a_tab "<" k ">" v "</" k ">`n")
		}
		this.xmlInProgress.push(a_tab "</info>`n")
	}
	generateXML_sets(){
		this.xmlInProgress.push(a_tab "<sets>`n")
		for k,v in this.gameEntity["sets"]{
			set := k
			this.xmlInProgress.push(a_tab a_tab "<set>`n")
			for k,v in this.gameEntity["sets",set]{
				if (v!="")
					this.xmlInProgress.push(a_tab a_tab a_tab "<" this.UnicodeToXML(k) ">" this.UnicodeToXML(v) "</" this.UnicodeToXML(k) ">`n")
			}
			this.xmlInProgress.push(a_tab a_tab "</set>`n")
		}
		this.xmlInProgress.push("</sets>`n")
		
	}
	generateXML_cards(){
		this.xmlInProgress.push("<cards>`n")
		for k,v in this.gameEntity["cards"]{
			card := k
			this.xmlInProgress.push(a_tab a_tab "<card>`n")
			for k,v in this.gameEntity["cards",card]{
				majProp := k
				switch majProp {
					case "cipt","token","upsidedown": {
						if (v != 0)
							this.xmlInProgress.push(a_tab a_tab a_tab "<" k ">" this.UnicodeToXML(v) "</" k ">`n")
					}
					case "props": {
						this.xmlInProgress.push(a_tab a_tab a_tab "<prop>`n")
						for k,v in this.gameEntity["cards",card,"props"]{
							this.xmlInProgress.push(a_tab a_tab a_tab a_tab "<" k ">" this.UnicodeToXML(v) "</" k ">`n")
						}
						this.xmlInProgress.push(a_tab a_tab a_tab "</prop>`n")						
					}
					case "related": {
						for k,v in this.gameEntity["cards",card,"related"]{
							relatedCard := k
							relStr := ""
							for k,v in this.gameEntity["cards",card,"related",relatedCard]{
								relStr .= a_space k "=" chr(34) v chr(34)
							}
							this.xmlInProgress.push(a_tab a_tab a_tab "<related" relStr ">" this.UnicodeToXML(relatedCard) "</related>`n")							
						}
					}
					case "reverse-related" : {
						;todo
					}
					case "sets" : {
						for k,v in this.gameEntity["cards",card,"sets",0]{
							;msgbox % st_printArr(this.gameEntity["cards",card,"sets",0])
							setIndex := k
							setCode := v
							setAttributes := ""
							for k,v in this.gameEntity["cards",card,"sets",setIndex]{
								;do NOT push this one to xmlInProgress
								setAttributes .= a_space k "=" chr(34) this.UnicodeToXML(v) chr(34)
							}
							this.xmlInProgress.push(a_tab a_tab a_tab "<set" setAttributes ">" this.UnicodeToXML(setCode) "</set>`n")
						}
					}
					default: {
						this.xmlInProgress.push(a_tab a_tab a_tab "<" k ">" this.UnicodeToXML(StrReplace(StrReplace(v,"`r"),"`n","<br>")) "</" k ">`n")
					}
				}
				
			}
			this.xmlInProgress.push(a_tab a_tab "</card>`n")
		}
		this.xmlInProgress.push(a_tab "</cards>`n")
		;return ret
	}
	generateXML_footer(){
		/*
			ret .= "</cockatrice_carddatabase>"
			return ret
		*/
		this.xmlInProgress.push("</cockatrice_carddatabase>")
	}
	UnicodeToXML(ByRef UnicodeString)
	{
		static  specificOrds := st_glue([34	; "
		,38
		,39
		,60
		,62],",")
		
		;msgbox % UnicodeString
		UnicodeStringNew := ""
		VarSetCapacity(UnicodeStringNew,(StrLen(UnicodeString) * 8)) ;maybe speeds up building UnicodeStringNew
		Loop,Parse,UnicodeString
		{
			checkOrd := ord(A_LoopField)
			if IfIn(checkOrd,specificOrds) || (checkOrd > 126){
				UnicodeStringNew .= "&#" checkOrd ";"
			}
			else 
				UnicodeStringNew .= a_loopfield
		}
		return UnicodeStringNew
	}
	
}