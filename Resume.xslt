<?xml version='1.0' encoding='utf-8'?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:output method="html"/>

<xsl:template match="/">
                
    <xsl:call-template name="header" />
    <xsl:apply-templates select="resume/objective"/>
		<xsl:apply-templates select="resume/summary"/>
		<xsl:apply-templates select="resume/skills"/>
    <xsl:call-template name="recentProjects" />
    <xsl:apply-templates select="resume/experience"/><!--
    <xsl:apply-templates select="resume/education"/>-->
    <xsl:apply-templates select="resume/books"/>
    <xsl:call-template name="map" />

</xsl:template>


<xsl:template match="@lastUpdated">
    Last Updated:
    <xsl:value-of select="."/>
</xsl:template>
    
<xsl:template match="resume/title">
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="resume/description">
	<br />
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="resume/logo">
    <img alt="" src="{/resume/logo/node()}" />
</xsl:template>

<xsl:template match="resume/personalInfo/phone">
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="resume/personalInfo/email">
    <a alt="{/resume/personalInfo/email/node()}" href="mailto:{/resume/personalInfo/email/node()}">
        <xsl:value-of select="text()"/>
    </a>
</xsl:template>

<xsl:template match="resume/personalInfo/location">
    <xsl:value-of select="text()"/>
</xsl:template>
   
<xsl:template match="resume/downloadMSWordVersion">
    <a alt="{@text}" href="{@url}">
        <xsl:value-of select="@text"/>
    </a>
</xsl:template>

<xsl:template match="resume/projects/project/screenshots/screenshot">
    <xsl:value-of select="@text"/>
</xsl:template>

<xsl:template match="resume/projects/project/screenshots">
    <xsl:for-each select="screenshot">
        <a alt="missing image" href="{@lg}" target="_blank">
            <img alt="" src="{@sm}" class="imageBorder" />
        </a>
        &#160;
    </xsl:for-each>
    <br />
    <br />
</xsl:template>

<xsl:template match="resume/projects/project/demo">
    <a alt="{@text}" href="{@url}" target="_blank">
        <xsl:value-of select="@text"/>
    </a>
</xsl:template>

<xsl:template name="header">
    <table style="width: 100%">
        <tr>
            <td width="33%" align="left">
                <xsl:apply-templates select="resume/logo"/>
            </td>

            <td width="33%" align="center">
                <span class="title_Lavender">
                    <xsl:apply-templates select="resume/title"/>
                </span>
                <br />
                <xsl:apply-templates select="resume/description"/>
            </td>

            <td width="33%" align="right">
                <table>
                    <tr>
                        <td align="left">
                          <!--
                            <span class="red">&gt;</span> Phone: <xsl:apply-templates select="resume/personalInfo/phone"/><br />-->
                            <span class="red">&gt;</span> Email: <xsl:apply-templates select="resume/personalInfo/email"/><br />
                            <span class="red">&gt;</span> Location: <xsl:apply-templates select="resume/personalInfo/location"/><br /><!--
                            <span class="red">&gt;</span> <xsl:apply-templates select="resume/@lastUpdated"/><br />-->
                            <span class="red">&gt;</span>&#160;<xsl:apply-templates select="resume/downloadMSWordVersion"/><br />                                
                            <span class="red">&gt;</span> View <a href="xml/Resume.xml" target="_blank">XML</a> or <a href="xml/Resume.xslt" target="_blank">XSLT</a><br />
                            <span class="red">&gt;</span>&#160;<a href="https://github.com/RobertVignato" target="_blank">GitHub</a> repository (WIP)

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        </table>
</xsl:template>


<xsl:template name="recentProjects">

    <div>
        <table class="grid" style="width: 100%">
            <tr>
                <td>

                    <span class="sectionHeader">Projects (partial)</span>
                    <br />
                        
                    <xsl:for-each select="resume/projects/project">
                        <br />
                        <span class="projectTitle"><xsl:value-of select="title/text()"/>&#160;</span>
                        <xsl:apply-templates select="demo"/><br />
                        <span class="projectAspect">Role:</span>&#160;<xsl:value-of select="position/text()"/><br />
                        <span class="projectAspect">Key Technologies:</span>&#160;<xsl:value-of select="technologies/text()"/><br />
                        <span class="projectAspect">Methodology:</span>&#160;<xsl:value-of select="methodologies/text()"/><br />                          
                        <span class="projectAspect">Description:</span><xsl:value-of select="description/text()"/><br /><br />
                        <xsl:apply-templates select="screenshots"/>                        
                        <hr />
                    </xsl:for-each>
                        
                </td>
            </tr>
        </table>
    </div>
</xsl:template>

<xsl:template name="map">

    <br />
    <br />
    <script type="text/javascript" src="http://feedjit.com/map/?bc=ffffff&amp;tc=494949&amp;brd1=336699&amp;lnk=494949&amp;hc=336699&amp;dot=ff0000"></script>
    <noscript>
        <a href="http://feedjit.com/">Feedjit Live Blog Stats</a>
    </noscript>
    <br />
    <br />
    <script type="text/javascript" src="http://feedjit.com/serve/?vv=673&amp;tft=3&amp;dd=0&amp;wid=7f8dc67dfc3270ad&amp;pid=0&amp;proid=0&amp;bc=ffffff&amp;tc=000000&amp;brd1=012b6b&amp;lnk=135d9e&amp;hc=ffffff&amp;hfc=2853a8&amp;btn=c99700&amp;ww=278&amp;wne=10&amp;wh=Live+Traffic+Feed&amp;hl=0&amp;hlnks=0&amp;hfce=0&amp;srefs=0&amp;hbars=0"></script>
    <noscript>
        <a href="http://feedjit.com/">Feedjit Live Blog Stats</a>
    </noscript>
        
</xsl:template>

<xsl:template match="personalInfo">


    <table class="grid" style="width: 100%">
        <tbody>
            <tr>
                <td>
                    <div class="text33">
                        <xsl:value-of select="name"/>
                    </div>
                    <div class="text22">
                        <xsl:for-each select="bulltetPoint">
                            <xsl:value-of select="text()"/>
                        </xsl:for-each>
                    </div>
                    <br/>
                    <br/>
                    <a href="mailto:{email}">
                        <xsl:value-of select="email"/>
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="phone"/>
                </td>
            </tr>
        </tbody>
    </table>

</xsl:template>

<!--
<xsl:template match="personalInfo">
    <table>
        <tbody>
            <tr>
                <td>
                    <div class="text33">
                        <xsl:value-of select="name"/>
                    </div>
                    <div class="text22">
                        <xsl:for-each select="bulltetPoint">
                            <xsl:value-of select="text()"/>
                        </xsl:for-each>
                    </div>
                    <br/>
                    <br/>
                    <a href="mailto:{email}">
                        <xsl:value-of select="email"/>
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="phone"/>
                </td>
            </tr>
        </tbody>
    </table>
</xsl:template>
-->

<xsl:template match="objective">
    <div>
        <table class="grid" style="width: 100%">
            <tr>
                <td>

                    <span class="sectionHeader">Objective</span>
                    <br />
                    <br />
                    <span class="red">&gt;</span>&#160;<xsl:value-of select="text()"/>

                </td>
            </tr>
        </table>
    </div>    
    <br />
</xsl:template>

<xsl:template match="summary">
    <div>
        <table class="grid" style="width: 100%">
            <tr>
                <td>

                    <span class="sectionHeader">Summary</span>
                    <br />
                    <br />
                    <xsl:for-each select="paragraph">
                        <span class="red">&gt;</span>&#160;<xsl:value-of select="."/>
                        <br />
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </div>
    <br />
</xsl:template>

<xsl:template match="skills">
  <div>
  <table class="grid" style="width: 100%">
          <tr>
              <td colSpan="2">
                  <div class="sectionHeader">Skills</div>
                <br />
              </td>
          </tr>
    
          <tr>
              <td vAlign="top">
                  <b>Languages:</b>
              </td>
              <td vAlign="top">
                  <b>Applications:</b>
              </td>
          </tr>
    
          <tr>
              <td vAlign="top">
                  <xsl:for-each select="languages/language">
                    <span class="red">&gt;</span>&#160;<xsl:value-of select="."/>
                    <br />
                  </xsl:for-each>
              </td>
              <td vAlign="top">
                  <xsl:for-each select="applications/application">
                    <span class="red">&gt;</span>&#160;<xsl:value-of select="."/>
                    <br />
                  </xsl:for-each>
              </td>
          </tr>
    </table>
  </div>
  <br />
</xsl:template>


  <xsl:template match="skills01">
    <div>
      <table class="grid" style="width: 100%">
        <tr>
          <td colSpan="2">
            <div class="sectionHeader">Skills</div>
          </td>
        </tr>

        <tr>
          <td vAlign="top">
            <b>Languages:</b>
          </td>
          <td vAlign="top">
            <xsl:for-each select="languages/language">
              <span class="red">&gt;</span>&#160;<xsl:value-of select="."/>
              <br />
            </xsl:for-each>
            <br/>
            <br/>
          </td>
        </tr>

        <tr>
          <td vAlign="top">
            <b>Applications:</b>
          </td>
          <td vAlign="top">
            <xsl:for-each select="applications/application">
              <xsl:value-of select="text()"/>&#160;
            </xsl:for-each>
            <br/>
          </td>
        </tr>

      </table>
    </div>
    <br />
  </xsl:template>

  <xsl:template match="skills00">
    <table class="grid" style="width: 100%">
      <tr>
        <td colSpan="2">
          <div class="sectionHeader">Skills</div>
        </td>
      </tr>
      <tr>
        <td vAlign="top">
          <b>Languages:</b>
        </td>
        <td vAlign="top">
          <xsl:for-each select="languages/language">
            <xsl:value-of select="text()"/>&#160;
          </xsl:for-each>
          <br/>
          <br/>
        </td>
      </tr>
      <tr>
        <td vAlign="top">
          <b>Applications:</b>
        </td>
        <td vAlign="top">
          <xsl:for-each select="applications/application">
            <xsl:value-of select="text()"/>&#160;
          </xsl:for-each>
          <br/>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="experience">
    <br />
    <div>
        <table class="grid" style="width: 100%">
            <tr>
                <td colSpan="3">
                    <div class="sectionHeader">Experience</div>
                    <br />
                </td>
            </tr>
            <xsl:for-each select="job">
                <tr>
                    <td vAlign="top" align="right">
                        <b>Employer: </b>
                    </td>
                    <td width="11"/>
                    <td>
                        <xsl:value-of select="employer"/>
                    </td>
                </tr>
                <tr>
                    <td vAlign="top" align="right">
                        <b>Location: </b>
                    </td>
                    <td width="11"/>
                    <td>
                        <xsl:value-of select="location"/>
                    </td>
                </tr>
                <tr>
                    <td vAlign="top" align="right">
                        <b>Appointment: </b>
                    </td>
                    <td width="11"/>
                    <td>
                        <xsl:value-of select="appointment"/>
                    </td>
                </tr>
                <tr>
                    <td vAlign="top" align="right">
                        <b>Dates: </b>
                    </td>
                    <td width="11"/>
                    <td>
                        <xsl:value-of select="dates"/>
                    </td>
                </tr>
                <tr>
                    <td vAlign="top" align="right">
                        <b>Description: </b>
                    </td>
                    <td width="11"/>
                    <td>
                        <xsl:value-of select="description"/>
                    </td>
                </tr>
                <xsl:for-each select="bulletPoint">
                    <tr>
                        <td vAlign="top" align="right">
                            <b>{} </b>
                        </td>
                        <td width="11"/>
                        <td>
                            <xsl:value-of select="text()"/>
                        </td>
                    </tr>
                </xsl:for-each>
                <tr>
                    <td vAlign="top" align="right"/>
                    <td width="11"/>
                    <td>
                        <br/>
                        <hr/>
                        <br/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
</xsl:template>

<xsl:template match="education">
    <br />
    <div>
        <table class="grid" style="width: 100%">
            <tr>
                <td>
                    <div class="sectionHeader">Education</div>
                </td>
            </tr>
            <xsl:for-each select="bulletPoint">
                <tr>
                    <td>
                        <b>{} </b>
                        <xsl:value-of select="."/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
</xsl:template>

<xsl:template match="training">
    <table>
        <tbody>
            <tr>
                <td>
                    <div class="text22">Training</div>
                </td>
            </tr>
            <xsl:for-each select="bulletPoint">
                <tr>
                    <td>
                        <b>{} </b>
                        <xsl:value-of select="."/>
                    </td>
                </tr>
            </xsl:for-each>
        </tbody>
    </table>
</xsl:template>


<xsl:template match="books">
    <br />
    <div>
        <table class="grid" style="width: 100%">
            <tr>
                <td colspan="2" style="width: 175px">
                    <div class="sectionHeader">My Book Shelf</div> (partial listing in alphabetical order)<br /><br />
                </td>
            </tr>

            <tr>
                <td>
                    <b>ISBN</b>
                </td>
                <td>
                    <b>Title</b>
                </td>
            </tr>
                
            <xsl:for-each select="book">
            <tr>
                <td vAlign="top">
                    <xsl:value-of select="@isbn"/>
                </td>
                <td vAlign="top">
                    <xsl:value-of select="text()"/>
                </td>
            </tr>
            </xsl:for-each>
                
        </table>
    </div>
</xsl:template>


</xsl:stylesheet>