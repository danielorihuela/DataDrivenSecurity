# CAPEC Schema Analysis

CAPEC (Common Attack Pattern Enumeration and Classification) is a set of common attack patterns to help understand how adversaries exploit weaknesses.

## Attack Pattern Catalog

The Attack pattern catalog is used to hold an enumerated catalog of common attack patterns and contains:

* **Attack Patterns**
* **Categories**
* **Views**
* **External References**

### Attack Pattern
The Attack Pattern is an abstraction of an attack which has:

#### Attributes

Each attack pattern has four attributes:

* **ID (integer)**: Attack pattern identifier. Example: 130
* **Name (string)**: Attack pattern name. Example: "Excessive Allocation"
* **Abstraction (AbstractionEnumeration)**: Defines the different abstraction levels of an attack pattern.
    * **Meta**: High level abstraction of attack patterns to architecture and design levels.
    * **Standard**: Specific technique used in a bigger attack. It is usually seen as a piece of the entire attack.
    * **Detailed**: Low level detail of a specific technique targeting a specific technology.
* **Status (StatusEnumeration)**: Status of the specific Attack Pattern (Deprecated, Draft, Incomplete, Obsolete, Stable or Usable).


#### Elements

Mandatory:
* ***Description:*** Representation of a high level description of the attack pattern.

Optional:
* ***Alternate Terms:*** Alternative names to describe the same pattern.
* ***Likelihood Of Attack:*** Captures the average probability that the attack uses a specific pattern to be successful.
    * Possibilities: High, Medium, Low, Unknown.
* ***Typ Severity:*** Overall average severity value for attacks that leverage this attack pattern.
    * Possibilities: Very High, High, Medium, Low, Very Low.
* ***Related Attack Patterns:*** Relates the CAPEC identifier to another attack pattern.
* ***Execution Flow:*** Step-by-step description.
* ***Prerequisites:*** Prerequisites to an attack.
* ***Skills Required:*** Skills required to perform the attack.
    * Possibilities: High, Medium, Low.
* ***Resources Required:*** Resources needed to execute the attack.
* ***Indicators:*** Activities, events, conditions or behaviors that may indicate that an attack of leveraging this attack pattern is imminent, in progress, or has occurred.
* ***Consecuences:*** Individual consequences associated with an attack pattern.
* ***Mitigations:*** Actions to prevent or mitigate the risk of an attack that leverages this attack pattern.
* ***Example Instances:*** Attack pattern examples.
* ***Related Weakness:*** References to weaknesses associated with this attack pattern.
    * Example: <Related_Weakness CWE_ID="1021"/>.
* ***Taxonomy Mappings:*** Similar categories in taxomomies outside of CAPEC.
* ***References:*** External reference defined within the catalog.
* ***Notes:*** Additional comments that cannot be captured using the other elements.
* ***Content History:*** Track of the original author of an entry and any subsequent modifications to the content.

### Category

Collection of attack patterns based on some common characteristic.

#### Attributes

Each category has three attributes:

Mandatory:
* ***ID:*** Unique identifier for each category.
* ***Name:*** Descriptive title.
* ***Status:*** Status level for each category.


#### Elements

Mandatory:
* ***Summary:*** Definition of the category.

Optional:
* ***Relationships:*** Relationships with attack patterns, categories and views.
* ***Taxonomy Mappings:*** Similar categories in taxomomies outside of CAPEC.
* ***References:*** More defined information.
* ***Notes:*** Additional comments that cannot be captured using the other elements.
* ***Content History:*** Track of the original author of an entry and any subsequent modifications to the content.

### View
Perspective with which one might look at the collection of attack patterns defined within CAPEC.

#### Attributes

Each view has four attributes:

Mandatory:
* ***ID:*** Unique identifier for each category.
* ***Name:*** Descriptive title.
* ***Type:*** Description about how each view is being constructed.
* ***Status:*** Status level for each category.
  

#### Elements

Mandatory:
* ***Objective:*** Description about the perspective from which the view has been constructed.

Optional:
* ***Audience:*** Reference of target stakeholders or group for whom the view is most relevant.
* ***Members:*** Defined externally through memberOf relationships.
* ***Filter:*** XSL query for identifying which attack patterns are members of an implicit slice.
* ***References:*** More information about each view.
* ***Notes:*** Additional comments that cannot be captured using the other elements.
* ***Content History:*** Track of the original author of an entry and any subsequent modifications to the content.

### External Reference
Collection of elements that provide a pointer to where more information and deeper insight can be obtained.

#### Attributes
* ***Reference ID:*** Unique identifier for each reference.

#### Elements
Mandatory:
* ***Title:*** Reference.

Optional:
* ***Author:*** Reference.
* ***Edition:*** Identification of the edition.
* ***Publication:*** If the reference is part of a magazine or journal, this element should be used to identify the name of the publisher.
* ***Publication Year***
* ***Publication Month***
* ***Publication Day***
* ***Publisher:*** More specs about the publisher.
* ***URL:*** Material being referenced.
* ***URL Date:*** Date when the URL was validated to exist.

### CAPEC Attack Pattern schema

```xml
<!-- =============================================================================== -->
	<!-- ==============================  ATTACK PATTERN  =============================== -->
	<!-- =============================================================================== -->
	<xs:complexType name="AttackPatternType">
		<xs:annotation>
			<xs:documentation>An attack pattern is an abstraction mechanism for helping describe how an attack is executed. Each pattern defines a challenge that an attacker may face, provides a description of the common technique(s) used to meet the challenge, and presents recommended methods for mitigating an actual attack. Attack patterns help categorize attacks in a meaningful way in an effort to provide a coherent way of teaching designers and developers how their systems may be attacked and how they can effectively defend them.</xs:documentation>
			<xs:documentation>The required Description element represents a high level description of the attack pattern. The description should be no longer than a few sentences and should include how malicious input is initially supplied, the weakness being exploited, and the resulting negative technical impact. A full step by step description does not belong as part of the description, but rather in the optional Execution_Flow element. The optional Typical_Severity element is used to capture an overall average severity value for attacks that leverage this attack pattern with the understanding that it will not be completely accurate for all attacks. The optional Likelihood_Of_Attack element is used to capture an average likelihood that an attack that leverages this attack pattern will succeed with the understanding that it will not be completely accurate for all attacks. A number of other optional elements are available, each of which is described in more detail within the corresponding complexType that it references.</xs:documentation>
			<xs:documentation>The required ID attribute provides a unique identifier for the attack pattern. It is considered static for the lifetime of the entry. If this entry becomes deprecated, the identifier should not be reused and a placeholder for the deprecated attack pattern should be left in the catalog. The required Name attribute provides a descriptive title used to give the reader an idea of what the attack pattern represents. All words in the name should be capitalized except for articles and prepositions unless they begin or end the name. The required Abstraction attribute defines the abstraction level for this attack pattern. The required Status attribute defines the status level for this view. Please refer to the related simple types for a more detailed description of what information these attributes provide and a list of valid values and their meanings.</xs:documentation>
		</xs:annotation>
		<xs:sequence>
			<xs:element name="Description" type="capec:StructuredTextType" minOccurs="1" maxOccurs="1"/>
			<xs:element name="Alternate_Terms" type="capec:AlternateTermsType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Likelihood_Of_Attack" type="capec:LikelihoodEnumeration" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Typical_Severity" type="capec:SeverityEnumeration" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Related_Attack_Patterns" type="capec:RelatedAttackPatternType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Execution_Flow" type="capec:ExecutionFlowType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Prerequisites" type="capec:PrerequisitesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Skills_Required" type="capec:SkillsType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Resources_Required" type="capec:RequiredResourcesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Indicators" type="capec:IndicatorsType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Consequences" type="capec:ConsequencesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Mitigations" type="capec:MitigationsType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Example_Instances" type="capec:ExampleInstancesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Related_Weaknesses" type="capec:RelatedWeaknessesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Taxonomy_Mappings" type="capec:TaxonomyMappingsType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="References" type="capec:ReferencesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Notes" type="capec:NotesType" minOccurs="0" maxOccurs="1"/>
			<xs:element name="Content_History" type="capec:ContentHistoryType" minOccurs="0" maxOccurs="1"/>
		</xs:sequence>
		<xs:attribute name="ID" type="xs:integer" use="required"/>
		<xs:attribute name="Name" type="xs:string" use="required"/>
		<xs:attribute name="Abstraction" type="capec:AbstractionEnumeration" use="required"/>
		<xs:attribute name="Status" type="capec:StatusEnumeration" use="required"/>
	</xs:complexType>
```

## CAPEC Attack Pattern example

```xml
   <Attack_Patterns>
      <Attack_Pattern ID="1" Name="Accessing Functionality Not Properly Constrained by ACLs"
                      Abstraction="Standard"
                      Status="Draft">
         <Description>In applications, particularly web applications, access to functionality is mitigated by an authorization framework. This framework maps Access Control Lists (ACLs) to elements of the application's functionality; particularly URL's for web apps. In the case that the administrator failed to specify an ACL for a particular element, an attacker may be able to access it with impunity. An attacker with the ability to access functionality not properly constrained by ACLs can obtain sensitive information and possibly compromise the entire application. Such an attacker can access resources that must be available only to users at a higher privilege level, can access management sections of the application, or can run queries for data that they otherwise not supposed to.</Description>
         <Likelihood_Of_Attack>High</Likelihood_Of_Attack>
         <Typical_Severity>High</Typical_Severity>
         <Related_Attack_Patterns>
            <Related_Attack_Pattern Nature="ChildOf" CAPEC_ID="122"/>
            <Related_Attack_Pattern Nature="CanPrecede" CAPEC_ID="17"/>
         </Related_Attack_Patterns>
         <Execution_Flow>
            <Attack_Step>
               <Step>1</Step>
               <Phase>Explore</Phase>
               <Description>[Survey] The attacker surveys the target application, possibly as a valid and authenticated user</Description>
               <Technique>Spidering web sites for all available links</Technique>
               <Technique>Brute force guessing of resource names</Technique>
               <Technique>Brute force guessing of user names / credentials</Technique>
               <Technique>Brute force guessing of function names / actions</Technique>
            </Attack_Step>
            <Attack_Step>
               <Step>2</Step>
               <Phase>Explore</Phase>
               <Description>[Identify Functionality] At each step, the attacker notes the resource or functionality access mechanism invoked upon performing specific actions</Description>
               <Technique>Use the web inventory of all forms and inputs and apply attack data to those inputs.</Technique>
               <Technique>Use a packet sniffer to capture and record network traffic</Technique>
               <Technique>Execute the software in a debugger and record API calls into the operating system or important libraries. This might occur in an environment other than a production environment, in order to find weaknesses that can be exploited in a production environment.</Technique>
            </Attack_Step>
            <Attack_Step>
               <Step>3</Step>
               <Phase>Experiment</Phase>
               <Description>[Iterate over access capabilities] Possibly as a valid user, the attacker then tries to access each of the noted access mechanisms directly in order to perform functions not constrained by the ACLs.</Description>
               <Technique>Fuzzing of API parameters (URL parameters, OS API parameters, protocol parameters)</Technique>
            </Attack_Step>
         </Execution_Flow>
         <Prerequisites>
            <Prerequisite>The application must be navigable in a manner that associates elements (subsections) of the application with ACLs.</Prerequisite>
            <Prerequisite>The various resources, or individual URLs, must be somehow discoverable by the attacker</Prerequisite>
            <Prerequisite>The administrator must have forgotten to associate an ACL or has associated an inappropriately permissive ACL with a particular navigable resource.</Prerequisite>
         </Prerequisites>
         <Skills_Required>
            <Skill Level="Low">In order to discover unrestricted resources, the attacker does not need special tools or skills. They only have to observe the resources or access mechanisms invoked as each action is performed and then try and access those access mechanisms directly.</Skill>
         </Skills_Required>
         <Resources_Required>
            <Resource>None: No specialized resources are required to execute this type of attack.</Resource>
         </Resources_Required>
         <Consequences>
            <Consequence>
               <Scope>Confidentiality</Scope>
               <Scope>Access Control</Scope>
               <Scope>Authorization</Scope>
               <Impact>Gain Privileges</Impact>
            </Consequence>
         </Consequences>
         <Mitigations>
            <Mitigation>
               <xhtml:p>In a J2EE setting, administrators can associate a role that is impossible for the authenticator to grant users, such as "NoAccess", with all Servlets to which access is guarded by a limited number of servlets visible to, and accessible by, the user.</xhtml:p>
               <xhtml:p>Having done so, any direct access to those protected Servlets will be prohibited by the web container.</xhtml:p>
               <xhtml:p>In a more general setting, the administrator must mark every resource besides the ones supposed to be exposed to the user as accessible by a role impossible for the user to assume. The default security setting must be to deny access and then grant access only to those resources intended by business logic.</xhtml:p>
            </Mitigation>
         </Mitigations>
         <Example_Instances>
            <Example>
               <xhtml:p>Implementing the Model-View-Controller (MVC) within Java EE's Servlet paradigm using a "Single front controller" pattern that demands that brokered HTTP requests be authenticated before hand-offs to other Action Servlets.</xhtml:p>
               <xhtml:p>If no security-constraint is placed on those Action Servlets, such that positively no one can access them, the front controller can be subverted.</xhtml:p>
            </Example>
         </Example_Instances>
         <Related_Weaknesses>
            <Related_Weakness CWE_ID="276"/>
            <Related_Weakness CWE_ID="285"/>
            <Related_Weakness CWE_ID="434"/>
            <Related_Weakness CWE_ID="693"/>
            <Related_Weakness CWE_ID="721"/>
            <Related_Weakness CWE_ID="732"/>
            <Related_Weakness CWE_ID="1191"/>
            <Related_Weakness CWE_ID="1193"/>
            <Related_Weakness CWE_ID="1220"/>
            <Related_Weakness CWE_ID="1224"/>
            <Related_Weakness CWE_ID="1244"/>
            <Related_Weakness CWE_ID="1252"/>
            <Related_Weakness CWE_ID="1257"/>
            <Related_Weakness CWE_ID="1262"/>
            <Related_Weakness CWE_ID="1268"/>
            <Related_Weakness CWE_ID="1283"/>
            <Related_Weakness CWE_ID="1311"/>
            <Related_Weakness CWE_ID="1312"/>
            <Related_Weakness CWE_ID="1313"/>
            <Related_Weakness CWE_ID="1314"/>
            <Related_Weakness CWE_ID="1315"/>
            <Related_Weakness CWE_ID="1318"/>
            <Related_Weakness CWE_ID="1320"/>
            <Related_Weakness CWE_ID="1321"/>
            <Related_Weakness CWE_ID="1326"/>
            <Related_Weakness CWE_ID="1327"/>
         </Related_Weaknesses>
         <Taxonomy_Mappings>
            <Taxonomy_Mapping Taxonomy_Name="ATTACK">
               <Entry_ID>1574.010</Entry_ID>
               <Entry_Name>Hijack Execution Flow: ServicesFile Permissions Weakness</Entry_Name>
            </Taxonomy_Mapping>
         </Taxonomy_Mappings>
         <Content_History>
            <Submission>
               <Submission_Name>CAPEC Content Team</Submission_Name>
               <Submission_Organization>The MITRE Corporation</Submission_Organization>
               <Submission_Date>2014-06-23</Submission_Date>
            </Submission>
            <Modification>
               <Modification_Name>CAPEC Content Team</Modification_Name>
               <Modification_Organization>The MITRE Corporation</Modification_Organization>
               <Modification_Date>2017-05-01</Modification_Date>
               <Modification_Comment>Updated Attack_Pattern, References</Modification_Comment>
            </Modification>
            <Modification>
               <Modification_Name>CAPEC Content Team</Modification_Name>
               <Modification_Organization>The MITRE Corporation</Modification_Organization>
               <Modification_Date>2017-08-04</Modification_Date>
               <Modification_Comment>Updated Attack_Pattern, Description Summary</Modification_Comment>
            </Modification>
            <Modification>
               <Modification_Name>CAPEC Content Team</Modification_Name>
               <Modification_Organization>The MITRE Corporation</Modification_Organization>
               <Modification_Date>2020-07-30</Modification_Date>
               <Modification_Comment>Updated Related_Weaknesses, Skills_Required, Taxonomy_Mappings</Modification_Comment>
            </Modification>
            <Modification>
               <Modification_Name>CAPEC Content Team</Modification_Name>
               <Modification_Organization>The MITRE Corporation</Modification_Organization>
               <Modification_Date>2020-12-17</Modification_Date>
               <Modification_Comment>Updated Related_Attack_Patterns, Related_Weaknesses</Modification_Comment>
            </Modification>
         </Content_History>
      </Attack_Pattern>
```

## References

https://capec.mitre.org/
