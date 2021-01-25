Install-Module -Name Pester -MaximumVersion 4.99.99 -Force -Verbose -Scope CurrentUser
Invoke-Pester ./pipeline/scripts/ci -OutputFormat NUnitXml -OutputFile ./TEST-CI.xml -EnableExit