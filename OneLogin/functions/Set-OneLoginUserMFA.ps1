function Set-OneLoginUserMFA
{
    [CmdletBinding(ConfirmImpact = "Medium")]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [OneLogin.User]
        $Identity,

        [boolean]
        $MFA_SMS,
    )
     write-output "1"
    begin
    {

      $body = @{factor_id = "65347";name = "Send 6-digit OTP to mobile";auth_factor_name = "SMS"}|convertto-json

        $Splat = @{
            Method = "Post"
            Body   = $Body}

    } #begin

    process
    {

     $Splat["Endpoint"] = "api.us.onelogin.com/api/2/mfa/users/120411132/registrations"

        if ($PSCmdlet.ShouldProcess($Identity, $MyInvocation.MyCommand.Name))
        {
            Invoke-OneLoginRestMethod @Splat
             write-output "1"
        }
    }
}
.\Set-OneLoginUserMFA.ps1 -Identity 120411132 -MFA_SMS $true
