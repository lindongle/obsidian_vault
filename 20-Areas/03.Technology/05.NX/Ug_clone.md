---
title: Ug_clone
updated: 2026-06-05T23:46:37
created: 2026-07-05T17:04:51
---

<span style='color:#1E1E1E'>Run ug_clone</span>
<span style='color:#212529'>Use the following command syntax to run the**ug_clone**utility:</span>
<span style='color:#212529'>ug_clone</span>
<span style='color:#212529'>\[-pim=\<yes\>\]</span>
<span style='color:#212529'>\[-u=\<username\>\]\[-p=\<password\>\]\[-g=\<group\>\]</span>
<span style='color:#212529'>\[-pf=\<filename\>\]</span>
<span style='color:#212529'>\[-corba_ior_file=\<iorfile\>\]</span>
<span style='color:#212529'>\[-corba_soa_ior_file=\<soafile\>\]</span>
<span style='color:#212529'>\[-http_url=\<4-tierserverurl\>\]</span>
<span style='color:#212529'>\[-http_cookie=\<4–tierhttpcookie\>\]</span>
<span style='color:#212529'>\[-o=\<operation\>\]</span>
<span style='color:#212529'>\[-fam=\<lose\|strip_status\|error\>\]</span>
<span style='color:#212529'>\[-asse=\<assembly\>\]</span>
<span style='color:#212529'>\[-par=\<part\>\]</span>
<span style='color:#212529'>\[-dir=\<directoryname\></span>
<span style='color:#212529'>\[-fol=\<foldername\>as\<user\>:\<folder\>:\<folder...\></span>
<span style='color:#212529'>\[-default_checki=\<defaultcheckin\>\]</span>
<span style='color:#212529'>\[-default_checko=\<defaultcheckout\>\]</span>
<span style='color:#212529'>\[-default_a=\<defaultaction\>\]</span>
<span style='color:#212529'>\[-default_n=\<defaultnaming\>\]</span>
<span style='color:#212529'>\[-default_t=\<defaultitemtype\>\]</span>
<span style='color:#212529'>\[-asso=\<associateddirectory\>\]</span>
<span style='color:#212529'>\[-copy_a=\<copyassociatedfiles\>\]</span>
<span style='color:#212529'>\[-copy_n=\<copynon-mastertype\>\]</span>
<span style='color:#212529'>\[-copy_related_draw\]=\<yes\|no\></span>
<span style='color:#212529'>\[-copy_related_cae\]=\<none\|ideal\|fem\|all\></span>
<span style='color:#212529'>\[-default_o=\<defaultowner=\<user\>:\<group\>\]</span>
<span style='color:#212529'>\[-default_f=\<defaultfolder\>\]</span>
<span style='color:#212529'>\[-default_d=\<defaultdirectory\>\]</span>
<span style='color:#212529'>\[-n=\<namerule\>\]</span>
<span style='color:#212529'>\[-l=\<loadlogfile\>\]</span>
<span style='color:#212529'>\[-s=\<savelogfile\>\]</span>
<span style='color:#212529'>\[-r=\<revisionrule\></span>
<span style='color:#212529'>\[-aut=\<default\|legacy\></span>
<span style='color:#212529'>\[-propagate=\<yes\|no\></span>
<span style='color:#212529'>\[-export_dfa_kf=\<dfa_only\|dfa_in_part\></span>
<span style='color:#212529'>\[-export_dfa_list\]</span>
<span style='color:#212529'>\[-rev_up\]</span>
<span style='color:#212529'>\[-attach_log_file\]</span>
<span style='color:#212529'>\[-dr=\<dryrun\>\]</span>
<span style='color:#212529'>\[-e\[ncrypt\]</span>
<span style='color:#212529'>\[-http_vmid=\<4–tierhttpvmid\>\]</span>
<span style='color:#212529'>\[-validation_m\]</span>
<span style='color:#212529'>\[-validation_r\]</span>
<span style='color:#212529'>\[-abort_import\]</span>
<span style='color:#212529'>\[—treat_validation_w\]</span>
<span style='color:#212529'>\[-treat_validation_o\]</span>
<span style='color:#212529'>\[-h=\<help\>\]</span>
<span style='color:#212529'>You must run the**ug_clone**utility from a NX command shell that also has a Teamcenter environment set. This will allow you to connect to a database.</span>
<span style='color:#212529'>For example, after you open an NX command shell type:</span>
<span style='color:#212529'>setTC_ROOT=C:\ProgramFiles\Teamcenter\Teamcenter8</span>
<span style='color:#212529'>setTC_DATA=C:\ProgramFiles\Teamcenter\tcdata</span>
<span style='color:#212529'>call%TC_DATA%\tc_profilevars</span>
<span style='color:#212529'>You must have the following environment variable and preference set to run NX in four-tier mode:</span>
- «span style='color:#212529'»**UGII_UGMGR_HTTP_URL  **
  Note:  
  The**UGII_UGMGR_HTTP_URL**environment variable and the**–http_url**parameter provide the same information.«/span»
- «span style='color:#212529'»**UGII_UGMGR_COMMUNICATION  **
  Note:  
  The**UGII_UGMGR_COMMUNICATION**environment variable must be set to HTTP, and HTTP must be in uppercase.«/span»
<span style='color:#212529'>If you want the leafnames to become item IDs and a default revision of A, you must set**UGII_UGMGR_ITEMID_IS_OSFILE_NAME**to**yes**. For example, after you set**UGII_UGMGR_ITEMID_IS_OSFILE_NAME**=**yes**, and you import a sample.prt file into NX, the file is imported as sample/A.</span>
<span style='color:#212529'>The following table lists the values corresponding to the command line options:</span>
<table>
<colgroup>
<col style="width: 47%" />
<col style="width: 52%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Command line options</strong></th>
<th style="text-align: center;"><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>–pim</strong></td>
<td>Set<strong>–pim</strong>to<strong>Yes</strong>to initialize Teamcenter Integration for NX only, instead of native NX.</td>
</tr>
<tr>
<td><strong>–u[user]</strong></td>
<td>Teamcenter username.</td>
</tr>
<tr>
<td><strong>–g[group]</strong></td>
<td>Teamcenter group.</td>
</tr>
<tr>
<td><strong>–p[password]</strong></td>
<td>Teamcenter password.</td>
</tr>
<tr>
<td><strong>–pf</strong></td>
<td>Password file name. For additional information, see<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299844.html">Keep passwords secure with password file</a>.</td>
</tr>
<tr>
<td><strong>–corba_ior_file</strong></td>
<td>Specifies the Teamcenter server IOR file.</td>
</tr>
<tr>
<td><strong>–corba_soa_ior_file</strong></td>
<td>Specifies the CORBA SOA IOR file.</td>
</tr>
<tr>
<td><strong>–http_url</strong></td>
<td><p>Specifies the http url for Teamcenter four-tier environment.</p>
<p>Note:</p>
<p>The<strong>–http_url</strong>option and the<strong>UGII_UGMGR_HTTP_URL</strong>environment variable provide the same information.</p></td>
</tr>
<tr>
<td><strong>–http_cookie</strong></td>
<td>Specifies the http cookie for Teamcenter four-tier environment.</td>
</tr>
<tr>
<td><strong>–o[peration]</strong></td>
<td><p>The following keyword values are required:</p>
<ul>
<li><p><strong>clone</strong></p></li>
<li><p><strong>edit</strong></p></li>
<li><p><strong>import</strong></p></li>
<li><p><strong>export</strong></p></li>
</ul>
<p>Note:</p>
<p>This option must follow the<strong>–p[pim]</strong>option and precede other options used in the command.</p>
<p>Note:</p>
<p>Using the<strong>clone</strong>or<strong>edit</strong>value enables cloning of an assembly that contains multi-CAD components.</p></td>
</tr>
<tr>
<td><strong>–fam[ily_treatment]</strong></td>
<td><p>Specifies how to treat the part family members.</p>
<p>The following keyword values are required:</p>
<ul>
<li><p><strong>lose</strong></p></li>
<li><p><strong>strip_status</strong></p></li>
<li><p><strong>error</strong></p></li>
</ul>
<p>This option must be added before the<strong>–dir</strong>option.</p>
<p>If you add an assembly containing the family members, this option must always be positioned before the<strong>–asse</strong>option.</p>
<p>The default value is<strong>error</strong>.</p></td>
</tr>
<tr>
<td><strong>–asse[mbly]</strong></td>
<td><p>Specifies the root assembly.</p>
<p>You can repeat the value to add an assembly to the operation.</p></td>
</tr>
<tr>
<td><strong>–par[t]</strong></td>
<td><p>Specifies the item ID of a single part of the assembly to be cloned.</p>
<p>You can repeat the value to add a part to the assembly.</p></td>
</tr>
<tr>
<td><strong>–dir[ectory]</strong></td>
<td><p>To add all assemblies in the specified directory to the operation. You can repeat the values.</p>
<p>Note:</p>
<p>If not specified then the value for<strong>LoadOptions_SearchPaths</strong>in the<strong>load_options.def</strong>file is used.</p></td>
</tr>
<tr>
<td><strong>–fol[der]</strong></td>
<td><p>As<strong>&lt;user&gt;:&lt;folder&gt;:&lt;folder...&gt;</strong>to add all assemblies in the specified folder to the operation. You can repeat the values.</p>
<p>The contents of the folder must contain the item and item revision, not just an item revision. If there are multiple item revisions, the ug_clone command selects the item revision by using the Latest By Creation Date rule. Copying and pasting an item revision only into the folder without the associated item is not supported.</p></td>
</tr>
<tr>
<td><strong>–default_checki[n]</strong></td>
<td>The default setting is<strong>no</strong>.</td>
</tr>
<tr>
<td><strong>–default_checko[ut]</strong></td>
<td>The default setting is<strong>no.yes:&lt;comment&gt;no</strong>.</td>
</tr>
<tr>
<td><strong>–default_a[ction]</strong></td>
<td><p>The following keyword values are required:</p>
<ul>
<li><p><strong>clone</strong></p></li>
<li><p><strong>retain</strong></p></li>
<li><p><strong>overwrite</strong></p></li>
<li><p><strong>use_existing</strong></p></li>
<li><p><strong>new_revision</strong></p></li>
</ul></td>
</tr>
<tr>
<td><strong>–default_n[aming]</strong></td>
<td><p>The following keyword values are required:</p>
<ul>
<li><p><strong>autogen</strong></p></li>
<li><p><strong>autotranslate</strong></p></li>
<li><p><strong>name_rule</strong></p></li>
<li><p><strong>user_name</strong></p></li>
</ul></td>
</tr>
<tr>
<td><strong>–default_t[ype]</strong></td>
<td>Specifies the default Teamcenter Integration for NX item type.</td>
</tr>
<tr>
<td><strong>–asso[ciated file root directory]</strong></td>
<td>Specifies the default Teamcenter Integration for NX associated file directory.</td>
</tr>
<tr>
<td><strong>–copy_a[ssociated files]</strong></td>
<td><p>Specifies whether to copy Teamcenter Integration for NX associated files.</p>
<p>The default setting is<strong>yes</strong>.</p></td>
</tr>
<tr>
<td><strong>–copy_n[on-master]</strong></td>
<td><p>Specifies whether to copy Teamcenter Integration for NX non-master files.</p>
<p>Set the type of file to copy;<strong>specification:yes</strong>or<strong>manifestation:yes</strong>. If you do not enter a type, no non-master files are copied.</p>
<p>For example, when you set<strong>–copy_n=manifestation:yes</strong>, it copies all non-master manifestations.</p>
<p>You can also repeat this value to get both specifications and manifestations.</p></td>
</tr>
<tr>
<td><strong>–copy_related_draw[ings]</strong></td>
<td><p>Specifies whether to copy related, independent (Teamcenter master item) drawing files. Keyword values are<strong>yes|no</strong>. The default is<strong>no</strong>. Add this option to the command before the option that specifies the part/assembly.</p>
<p>For more information, see<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/xid881601/id1299536/xid615314.html">Export independent drawing</a>.</p></td>
</tr>
<tr>
<td><strong>–copy_related_cae[_parts]</strong></td>
<td>Specifies whether to copy related, independent (Teamcenter master item) CAE part files. Keyword values are<strong>none|ideal|fem|all</strong>. The default is<strong>none</strong>. Add this option to the command before the option that specifies the part/assembly.</td>
</tr>
<tr>
<td><strong>–default_o[wner]=&lt;user&gt;&lt;group&gt;</strong></td>
<td>Specifies the default Teamcenter Integration for NX user and group to own the parts.</td>
</tr>
<tr>
<td><strong>–default_f[older]</strong></td>
<td>Specifies the default folder where the parts are placed during import.</td>
</tr>
<tr>
<td><strong>–default_d[irectory]</strong></td>
<td>Specifies the default directory where the parts are placed during export.</td>
</tr>
<tr>
<td><strong>–n[ame rule]</strong></td>
<td><p>Defines a naming rule to be used for the clone operation.</p>
<p>The following keyword values are required:</p>
<ul>
<li><p><strong>prepend</strong>:<em>&lt;string&gt;</em></p></li>
<li><p><strong>append</strong>:<em>&lt;string&gt;</em></p></li>
<li><p><strong>replace</strong>:<em>&lt;base_string&gt;:&lt;replace_string&gt;</em></p></li>
<li><p><strong>rename</strong>:<em>&lt;string&gt;</em></p></li>
</ul>
<p>It is same as using the user interface clone options<strong>File</strong>tab→<strong>Export Assembly outside Teamcenter</strong>→<strong>Naming</strong>→<strong>Define Naming Rule</strong>.</p></td>
</tr>
<tr>
<td><strong>–r[evision_rule]</strong></td>
<td><p>Defines a revision rule (or load rule) to be applied to the assembly during a clone export operation.</p>
<p>It is the same as using the user interface clone options,<strong>File</strong>tab→<strong>Export Assembly outside Teamcenter</strong>→<strong>Load Option</strong>and selecting a revision rule.</p>
<p>The value supplied to<strong>–r[revision_rule]</strong>option must be a revision rule to be applied from the database.</p>
<p>Note:</p>
<p>You must specify the<strong>–r[revision_rule]</strong>option before the<strong>–asse</strong>option for the<strong>ug_clone</strong>utility. Otherwise, the value for the<strong>IMAN_config_rule_name</strong>preference is used.</p>
<p>Note:</p>
<p>You can repeat the<strong>–r [revision_rule]</strong>and<strong>–asse</strong>options to add more than one assembly and change the revision rule between assemblies.</p></td>
</tr>
<tr>
<td><strong>–l[oad log file]=&lt;log_file_name&gt;</strong></td>
<td>You can repeat this value.</td>
</tr>
<tr>
<td><strong>–s[ave log file]=&lt;log_file_name&gt;</strong></td>
<td>The default setting is<strong>&lt;operation&gt;.clone</strong>.</td>
</tr>
<tr>
<td><strong>–aut[otranslate_mode]=&lt;default|legacy&gt;</strong></td>
<td><p>Specifies whether autotranslate mode for import is<strong>default</strong>for interactive or<strong>legacy</strong>compatible.</p>
<p>When set to<strong>legacy</strong>mode, all of the following attributes must be valid; otherwise all are ignored and the name from the operating system is used for the Item ID:</p>
<ul>
<li><p>DB_PART_NO: This must be non-NULL and less than 32 characters, or 128 characters if Teamcenter is setup to accept longer names.<br />
Maps to UGMGR_part_number_keyword</p></li>
<li><p>DB_PART_REV: Same as DB_PART_NO (above).<br />
Maps to UGMGR_partrev_name_keyword</p></li>
<li><p>DB_MODEL_NAME: This can be NULL depending upon the value for DB_MODEL_TYPE (below). If non-NULL, then it must be less than 32 characters, or 128 characters if Teamcenter is setup to accept longer names.<br />
Maps to UGMGR_appdata_name_keyword</p></li>
<li><p>DB_MODEL_TYPE: This is set to a valid part file type. If DB_MODEL_NAME (above) is NULL, then this value must be set to either:</p>
<ul>
<li><p>master</p></li>
<li><p>cae_geometry</p></li>
<li><p>cae_mesh</p></li>
<li><p>cae_solution<br />
Maps to UGMGR_reltype_name_keyword and UGMGR_apptype_name_keyword</p></li>
</ul></li>
</ul>
<p>If you use<strong>legacy</strong>mode, also use the option<strong>–default_naming=autotranslate</strong>to name the parts as it is going through the clone operation.</p>
<p>The default value is<strong>default</strong>.</p></td>
</tr>
<tr>
<td><strong>–dr[yrun]</strong></td>
<td>Indicates whether the utility proceeded as expected, without actually performing the clone.</td>
</tr>
<tr>
<td><strong>–propagate[_actions]</strong></td>
<td><p>Specifies whether to propagate action settings to referenced and referencing parts. Values are<strong>yes|no</strong>. The default value is<strong>no</strong>.</p>
<p>Caution:</p>
<p>This option is intended for use by other applications driving<strong>ug_clone</strong>, and not for direct use.</p></td>
</tr>
<tr>
<td><strong>–export_dfa_kf</strong></td>
<td><p>Specify this option in the beginning of the argument list to export the DFA files.</p>
<p>Following are the examples to use this option:</p>
<ul>
<li><p>For DFA files:ug_clone -pim=yes -export_dfa_kf=dfa_only -o=export -part= &lt;dfa classname&gt;</p></li>
<li><p>For DFA files referenced by part:ug_clone -pim=yes -export_dfa_kf=dfa_in_part -o=export -part=&lt;@DB/testprt/A&gt; ()</p></li>
</ul></td>
</tr>
<tr>
<td><strong>–export_dfa_list</strong></td>
<td><p>Specify this option to export the DFA filenames listed in an input file.</p>
<p>Following is an example to use this option:</p>
<p>ug_clone -pim=yes -export_dfa_kf=dfa_only -export_dfa_list -o=export -part=&lt;input file list name&gt;</p></td>
</tr>
<tr>
<td><strong>–import_dfa_kf</strong></td>
<td><p>Specify this option in the beginning of the argument list to import the DFA files.</p>
<p>Following is an example to use this option:</p>
<p>ug_clone -pim=yes —o=import —import_dfa_kf=dfa_only -part=&lt;dfa filename&gt;</p></td>
</tr>
<tr>
<td><strong>–import_dfa_list</strong></td>
<td><p>Specify this option to import the DFA filenames listed in an input file.</p>
<p>Following is an example to use this option:</p>
<p>ug_clone -pim=yes —o=import —import_dfa_kf=dfa_only -import_dfa_list -part=&lt;input file list name&gt;</p></td>
</tr>
<tr>
<td><strong>–rev_up[_read_only]</strong></td>
<td><p>Assigns the next available item revision to an imported dataset, when the dataset is read-only.</p>
<p>This option is applicable only when the cloning<strong>operation=import</strong>and the cloning<strong>action=overwrite</strong>or<strong>new_revision</strong>.</p></td>
</tr>
<tr>
<td><strong>–attach[_log_file]</strong></td>
<td>Attaches the log file to the cloned item.</td>
</tr>
<tr>
<td><strong>–encrypt</strong></td>
<td>Do not use. For internal development use only by Siemens PLM Software.</td>
</tr>
<tr>
<td><strong>–http_vmid</strong></td>
<td>Do not use. For internal development use only by Siemens PLM Software.</td>
</tr>
<tr>
<td><strong>–validation_m[ode]</strong></td>
<td>See<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299882/id1299890/valid_overview.html">Validation options overview</a>.</td>
</tr>
<tr>
<td><strong>–validation_r[ule]</strong></td>
<td>See<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299882/id1299890/valid_overview.html">Validation options overview</a>.</td>
</tr>
<tr>
<td><strong>–abort_import[_on_fail]</strong></td>
<td>See<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299882/id1299890/valid_overview.html">Validation options overview</a>.</td>
</tr>
<tr>
<td><strong>–treat_validation_w[arning_as_pass]</strong></td>
<td>See<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299882/id1299890/valid_overview.html">Validation options overview</a>.</td>
</tr>
<tr>
<td><strong>–treat_validation_o[utdated_as_pass]</strong></td>
<td>See<a href="https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299882/id1299890/valid_overview.html">Validation options overview</a>.</td>
</tr>
</tbody>
</table>
<span style='color:#212529'>If you have any characters other than letters, digits, underscores, and hyphens in the value that you specify for a particular option, it is recommended that you enclose the value in quotes (" ") to avoid errors. For example, if you want to clone a part named Wing Assembly/A from Teamcenter to your current directory, it is advisable to specify the following command:</span>
<span style='color:#212529'>ug_clone-part="@DB/WingAssembly/A"</span>
<span style='color:#212529'>Ensure that the part name is surrounded by quotes.</span>
<span style='color:#212529'>Note:</span>
<span style='color:#212529'>Any invalid characters in the Teamcenter item ID or dataset name are replaced by an underscore when**ug_clone**forms the operating system filename. Invalid characters are generally defined as any character that is not a letter, digit, hyphen, or period.</span>
<span style='color:#212529'>Note:</span>
<span style='color:#212529'>When specifying part files, use the command line interface (CLI) format. For additional information, see</span>[CLI format for part files](https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/command_line_inter.html)<span style='color:#212529'>.</span>
<span style='color:#212529'>Model views are not imported with the part. To also import model views, use the**tcin_import**utility with the**-publish_information**option.</span>
<span style='color:#212529'>**Using the user_name method for naming**</span>
<span style='color:#212529'>When you use the**–default_n=user_name**method for naming of cloned files you must include a log file that contains the new names.</span>
<span style='color:#212529'>When you run clone using the**Clone Assembly**dialog box, NX prompts you for the new clone name for each item that is cloned. When you use the**ug_clone**utility, a log file must be used that contains all of the names for all of the parts that you are cloning. If the log file is not present or incomplete, the clone operation fails.</span>
<span style='color:#212529'>When specifying the log file, ensure the**–l**option is before the**–default_n=user_name**option so the**user_name**option is applied. If the**–l**option is after the**–default_n**option, the default naming rule specified in the log file is used. The latter option is applied.</span>
<span style='color:#212529'>For additional information on the format, content, and syntax of the log file, see</span>[Clone Log Files](https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299690/id1299704/clone_log_files1.html)<span style='color:#212529'>.</span>
<span style='color:#212529'>**Wave linked geometry**</span>
<span style='color:#212529'>When you are performing a clone operation on an item that has wave linked geometry, you must first enter the name of the parent to the wave linked geometry to get a new link to the cloned part source. Otherwise, there is a reference back to the original part source. For example, if you are cloning a subassembly, enter the top assembly first:</span>
<span style='color:#212529'>ug_clone—o=clone—asse=\<topassembly\>—asse=\<subassembly\>..........</span>
<span style='color:#212529'>**Using the tilde character**</span>
<span style='color:#212529'>Use of the tilde character (~) in the file name (Teamcenter Item ID) can cause an error when running ug_clone. The error may be reported as an “Internal Hookup Error.” The tilde character is used as the default escape character by Teamcenter and causes problems on clone import.</span>
<span style='color:#212529'>Note:</span>
<span style='color:#212529'>The tilde character may be added to your file name due to Windows/DOS shortnaming, for example: ABC-00009864~KVA12 Left Bracket</span>
<span style='color:#212529'>To enable clone import, change the value for the following preference to a character that is not part of the Item ID, such as “\\</span>
- <span style='color:#212529'>**TC_escape_character**</span>
<span style='color:#212529'>Note:</span>
<span style='color:#212529'>You can create Items and datasets in NX and Teamcenter with tildes in the Item ID, but they cannot be used when you run ug_clone unless you change the default escape character.</span>

*来自 \< <https://docs.sw.siemens.com/documentation/external/PL20190529153444861/zh-CN/nx/11.0.1/nx_help_sc/zh-CN/tcint/id1299838/id1299882/impexp_clone_run.html>\>*
