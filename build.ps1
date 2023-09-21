$SourcePath = ".\src\"
$SourceAllPath = Join-Path -Path $SourcePath "all\"

$AllUnitFile = ".\all-units.template"

# Core
Set-Content -LiteralPath $AllUnitFile -Value (
    Get-Content -LiteralPath (Join-Path -Path $SourceAllPath -ChildPath ".\core.ini")
)

# Resource
Add-Content -Path $AllUnitFile -Value "
#=== Resources
"

$ResourcePath = Join-Path -Path $SourceAllPath ".\resources"
Get-ChildItem -LiteralPath (Join-Path -Path $ResourcePath ".\global") |
ForEach-Object {
    Add-Content -Path $AllUnitFile -Value (Get-Content -LiteralPath $_.FullName)
}
