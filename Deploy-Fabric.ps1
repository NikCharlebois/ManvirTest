$subscriptionName="<to be updated>"
$resourceGroupName="MMAMediaBot-RG"
$keyvaultName="mmamediabot-vault1"
$parameterFilePath="$(Get-Location)\ServiceFabricCluster.Parameters.json"
$templateFilePath="$(Get-Location)\ServiceFabricCluster.json"
$secretID="<to be updated>"

Install-Module -Name Az -AllowClobber -Force

az login
az account set --subscription $subscriptionName
#Enable-AzureRmAlias

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultName -EnabledForDeployment
New-AzServiceFabricCluster -ResourceGroupName $resourceGroupName -SecretIdentifier $secretId -TemplateFile $templateFilePath -ParameterFile $parameterFilePath
