function cds { pushd C:\ONO\DullScript }
function css { pushd C:\spool }
function col { pushd E:\Office }
function cnc { pushd E:\NugetCache }
function cssbuild { pushd C:\ONO\ss_compiler\src\Compiler\bin\x86\Release }



function gpa {
  git checkout master

  $pruned = git pull --prune
  $clump = $pruned -join '-'

  git branch |
    ForEach-Object { $_.Trim() } |
    Where-Object {-not ( $_ -Like "*master" )} |
    Where-Object { $clump -Like "*origin/$($_)*"} |
    ForEach-Object { git branch -D $_ }
}

Set-Alias c pushd
Set-Alias p popd


function manualDel {
  $deleted = @(
    "origin/fix-bundle-size-report",
    "origin/fix-ie11-get-type-bug",
    "origin/fix-logging-requests",
    "origin/iancra/extract-js-libs",
    "origin/iancra/remove-expose-globals",
    "origin/orig-info",
    "origin/simplified-generics",
    "origin/stop-registering-generic-interfaces",
    "origin/webpack-upgrade"
  )
  $clump = $deleted -join '-'
  $branches = git branch


  git branch |
    ForEach-Object { $_.Trim() } |
    Where-Object {-not ( $_ -Like "*master" )} |
    Where-Object { $clump -Like "*origin/$($_)*"} |
    ForEach-Object { git branch -D $_ }
}


Import-Module posh-git
