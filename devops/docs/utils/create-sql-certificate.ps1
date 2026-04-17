# Create Self Signed RSA Cert for SQL Server usage
# 
# Customize:
# + -Subject should contain hostname (or virtal name for FCI)
# + -FriendlyName is anything which helps you to recognize the key
# + -DnsName should list all variants (FQDN) of hostnames used by clients (VIP+Machines)
# + -NotAfter set expire accoring to your policy
# + (Non)Exportable is more secure but harder to manage
#
# - Using RSASSA-PSS (-AlternateSignatureAlgorithm) does not work with Java 8 clients:
#    Caused by: java.security.NoSuchAlgorithmException: 1.2.840.113549.1.1.10 Signature not available
# - Using CNG (Software KSP, Platform KSP) does not work with SQL Server
# - No ECDSA possible since CNG KSP is used
# - sets extended key usage id-kp-serverAuth
New-SelfSignedCertificate -Type SSLServerAuthentication `
    -Subject "CN=<server-name>" -FriendlyName 'SQL Server RSA2048 G1' `
    -DnsName "<server-name>",'localhost.' `
    -KeyAlgorithm 'RSA' -KeyLength 2048 -Hash 'SHA256' `
    -TextExtension '2.5.29.37={text}1.3.6.1.5.5.7.3.1' `
    -NotAfter (Get-Date).AddMonths(720) `
    -KeyExportPolicy Exportable -KeySpec KeyExchange `
    -Provider 'Microsoft RSA SChannel Cryptographic Provider' `
    -CertStoreLocation Cert:\LocalMachine\My `
| fl -Property Thumbprint,FriendlyName,DnsNameList,NotAfter,PrivateKey,SerialNumber,Subject,Issuer

Write-Warning 'You need to open MMC "Manage Machine Certificates", select new cert in "Personal > Certificates"'
Write-Warning 'and specify "All Tasks > Manage private Keys...". Add MSSQL service login (NT Service\MSSQL$INST) with READ.'