#compdef 

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! swagger-codegen (https://github.com/swagger-api/swagger-codegen)
# ! FROM SWAGGER SPECIFICATION IN JSON.
# !
# ! Based on: https://github.com/Valodim/zsh-curl-completion/blob/master/_curl
# !
# ! Generated on: 2018-04-19T14:20:40.764-07:00
# !
# !
# ! Installation:
# !
# ! Copy the _ file to any directory under FPATH
# ! environment variable (echo $FPATH)
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


local curcontext="$curcontext" state line ret=1
typeset -A opt_args

typeset -A mime_type_abbreviations
# text/*
mime_type_abbreviations[text]="text/plain"
mime_type_abbreviations[html]="text/html"
mime_type_abbreviations[md]="text/x-markdown"
mime_type_abbreviations[csv]="text/csv"
mime_type_abbreviations[css]="text/css"
mime_type_abbreviations[rtf]="text/rtf"
# application/*
mime_type_abbreviations[json]="application/json"
mime_type_abbreviations[xml]="application/xml"
mime_type_abbreviations[yaml]="application/yaml"
mime_type_abbreviations[js]="application/javascript"
mime_type_abbreviations[bin]="application/octet-stream"
mime_type_abbreviations[rdf]="application/rdf+xml"
# image/*
mime_type_abbreviations[jpg]="image/jpeg"
mime_type_abbreviations[png]="image/png"
mime_type_abbreviations[gif]="image/gif"
mime_type_abbreviations[bmp]="image/bmp"
mime_type_abbreviations[tiff]="image/tiff"

#
# Generate zsh completion string list for abbreviated mime types
#
get_mime_type_completions() {
    typeset -a result
    result=()
    for k in "${(@k)mime_type_abbreviations}"; do
        value=$mime_type_abbreviations[${k}]
        #echo $value
        result+=( "${k}[${value}]" )
        #echo $result
    done
    echo "$result"
}

#
# cURL crypto engines completion function
#
_curl_crypto_engine() {
    local vals
    vals=( ${${(f)"$(curl --engine list)":gs/ /}[2,$]} )
    _describe -t outputs 'engines' vals && return 0
}

#
# cURL post data completion functions=
#
_curl_post_data() {

    # don't do anything further if this is raw content
    compset -P '=' && _message 'raw content' && return 0

    # complete filename or stdin for @ syntax
    compset -P '*@' && {
        local expl
        _description files expl stdin
        compadd "$expl[@]" - "-"
        _files
        return 0
    }

    # got a name already? expecting data.
    compset -P '*=' && _message 'data value' && return 0

    # otherwise, name (or @ or =) should be specified
    _message 'data name' && return 0

}


local arg_http arg_ftp arg_other arg_proxy arg_crypto arg_connection arg_auth arg_input arg_output

# HTTP Arguments
arg_http=(''\
  {-0,--http1.0}'[force use of use http 1.0 instead of 1.1]' \
  {-b,--cookie}'[pass data to http server as cookie]:data or file' \
  {-c,--cookie-jar}'[specify cookie file]:file name:_files' \
  {-d,--data}'[send specified data as HTTP POST data]:data:{_curl_post_data}' \
  '--data-binary[post HTTP POST data without any processing]:data:{_curl_post_data}' \
  '--data-urlencode[post HTTP POST data, with url encoding]:data:{_curl_post_data}' \
  {-f,--fail}'[enable failfast behavior for server errors]' \
  '*'{-F,--form}'[add POST form data]:name=content' \
  {-G,--get}'[use HTTP GET even with data (-d, --data, --data-binary)]' \
  '*'{-H,--header}'[specify an extra header]:header' \
  '--ignore-content-length[ignore Content-Length header]' \
  {-i,--include}'[include HTTP header in the output]' \
  {-j,--junk-session-cookies}'[discard all session cookies]' \
  {-e,--referer}'[send url as referer]:referer url:_urls' \
  {-L,--location}'[follow Location headers on http 3XX response]' \
  '--location-trusted[like --location, but allows sending of auth data to redirected hosts]' \
  '--max-redirs[set maximum number of redirection followings allowed]:number' \
  {-J,--remote-header-name}'[use Content-Disposition for output file name]' \
  {-O,--remote-name}'[write to filename parsed from url instead of stdout]' \
  '--post301[do not convert POST to GET after following 301 Location response (follow RFC 2616/10.3.2)]' \
  '--post302[do not convert POST to GET after following 302 Location response (follow RFC 2616/10.3.2)]' \
  )

# FTP arguments
arg_ftp=(\
  {-a,--append}'[append to target file instead of overwriting (FTP/SFTP)]' \
  '--crlf[convert LF to CRLF in upload]' \
  '--disable-eprt[disable use of EPRT and LPRT for active FTP transfers]' \
  '--disable-epsv[disable use of EPSV for passive FTP transfers]' \
  '--ftp-account[account data (FTP)]:data' \
  '--ftp-alternative-to-user[command to send when USER and PASS commands fail (FTP)]:command' \
  '--ftp-create-dirs[create paths remotely if it does not exist]' \
  '--ftp-method[ftp method to use to reach a file (FTP)]:method:(multicwd ocwd singlecwd)' \
  '--ftp-pasv[use passive mode for the data connection (FTP)]' \
  '--ftp-skip-pasv-ip[do not use the ip the server suggests for PASV]' \
  '--form-string[like --form, but do not parse content]:name=string' \
  '--ftp-pret[send PRET before PASV]' \
  '--ftp-ssl-ccc[use clear command channel (CCC) after authentication (FTP)]' \
  '--ftp-ssl-ccc-mode[sets the CCC mode (FTP)]:mode:(active passive)' \
  '--ftp-ssl-control[require SSL/TLS for FTP login, clear for transfer]' \
  {-l,--list-only}'[list names only when listing directories (FTP)]' \
  {-P,--ftp-port}'[use active mode, tell server to connect to specified address or interface (FTP]:address' \
  '*'{-Q,--quote}'[send arbitrary command to the remote server before transfer (FTP/SFTP)]:command' \
  )

# Other Protocol arguments
arg_other=(\
  '--mail-from[specify From: address]:address' \
  '--mail-rcpt[specify email recipient for SMTP, may be given multiple times]:address' \
  {-t,--telnet-option}'[pass options to telnet protocol]:opt=val' \
  '--tftp-blksize[set tftp BLKSIZE option]:value' \
  )

# Proxy arguments
arg_proxy=(\
  '--noproxy[list of hosts to connect directly to instead of through proxy]:no-proxy-list' \
  {-p,--proxytunnel}'[tunnel non-http protocols through http proxy]' \
  {-U,--proxy-user}'[specify the user name and password to use for proxy authentication]:user:password' \
  '--proxy-anyauth[use any authentication method for proxy, default to most secure]' \
  '--proxy-basic[use HTTP Basic authentication for proxy]' \
  '--proxy-digest[use http digest authentication for proxy]' \
  '--proxy-negotiate[enable GSS-Negotiate authentication for proxy]' \
  '--proxy-ntlm[enable ntlm authentication for proxy]' \
  '--proxy1.0[use http 1.0 proxy]:proxy url' \
  {-x,--proxy}'[use specified proxy]:proxy url' \
  '--socks5-gssapi-service[change service name for socks server]:servicename' \
  '--socks5-gssapi-nec[allow unprotected exchange of protection mode negotiation]' \
  )

# Crypto arguments
arg_crypto=(\
  {-1,--tlsv1}'[Forces curl to use TLS version 1 when negotiating with a remote TLS server.]' \
  {-2,--sslv2}'[Forces curl to use SSL version 2 when negotiating with a remote SSL server.]' \
  {-3,--sslv3}'[Forces curl to use SSL version 3 when negotiating with a remote SSL server.]' \
  '--ciphers[specifies which cipher to use for the ssl connection]:list of ciphers' \
  '--crlfile[specify file with revoked certificates]:file' \
  '--delegation[set delegation policy to use with GSS/kerberos]:delegation policy:(none policy always)' \
  {-E,--cert}'[use specified client certificate]:certificate file:_files' \
  '--engine[use selected OpenSSL crypto engine]:ssl crypto engine:{_curl_crypto_engine}' \
  '--egd-file[set ssl entropy gathering daemon socket]:entropy socket:_files' \
  '--cert-type[specify certificate type (PEM, DER, ENG)]:certificate type:(PEM DER ENG)' \
  '--cacert[specify certificate file to verify the peer with]:CA certificate:_files' \
  '--capath[specify a search path for certificate files]:CA certificate directory:_directories' \
  '--hostpubmd5[check remote hosts public key]:md5 hash' \
  {-k,--insecure}'[allow ssl to perform insecure ssl connections (ie, ignore certificate)]' \
  '--key[ssl/ssh private key file name]:key file:_files' \
  '--key-type[ssl/ssh private key file type]:file type:(PEM DER ENG)' \
  '--pubkey[ssh public key file]:pubkey file:_files' \
  '--random-file[set source of random data for ssl]:random source:_files' \
  '--no-sessionid[disable caching of ssl session ids]' \
  '--pass:phrase[passphrase for ssl/ssh private key]' \
  '--ssl[try to use ssl/tls for connection, if available]' \
  '--ssl-reqd[try to use ssl/tls for connection, fail if unavailable]' \
  '--tlsauthtype[set TLS authentication type (only SRP supported!)]:authtype' \
  '--tlsuser[set username for TLS authentication]:user' \
  '--tlspassword[set password for TLS authentication]:password' \
  )

# Connection arguments
arg_connection=(\
  {-4,--ipv4}'[prefer ipv4]' \
  {-6,--ipv6}'[prefer ipv6, if available]' \
  {-B,--use-ascii}'[use ascii mode]' \
  '--compressed[request a compressed transfer]' \
  '--connect-timeout[timeout for connection phase]:seconds' \
  {-I,--head}'[fetch http HEAD only (HTTP/FTP/FILE]' \
  '--interface[work on a specific interface]:name' \
  '--keepalive-time[set time to wait before sending keepalive probes]:seconds' \
  '--limit-rate[specify maximum transfer rate]:speed' \
  '--local-port[set preferred number or range of local ports to use]:num' \
  {-N,--no-buffer}'[disable buffering of the output stream]' \
  '--no-keepalive[disable use of keepalive messages in TCP connections]' \
  '--raw[disable all http decoding and pass raw data]' \
  '--resolve[provide a custom address for a specific host and port pair]:host\:port\:address' \
  '--retry[specify maximum number of retries for transient errors]:num' \
  '--retry-delay[specify delay between retries]:seconds' \
  '--retry-max-time[maximum time to spend on retries]:seconds' \
  '--tcp-nodelay[turn on TCP_NODELAY option]' \
  {-y,--speed-time}'[specify time to abort after if download is slower than speed-limit]:time' \
  {-Y,--speed-limit}'[specify minimum speed for --speed-time]:speed' \
  )

# Authentication arguments
arg_auth=(\
  '--anyauth[use any authentication method, default to most secure]' \
  '--basic[use HTTP Basic authentication]' \
  '--ntlm[enable ntlm authentication]' \
  '--digest[use http digest authentication]' \
  '--krb[use kerberos authentication]:auth:(clear safe confidential private)' \
  '--negotiate[enable GSS-Negotiate authentication]' \
  {-n,--netrc}'[scan ~/.netrc for login data]' \
  '--netrc-optional[like --netrc, but does not make .netrc usage mandatory]' \
  '--netrc-file[like --netrc, but specify file to use]:netrc file:_files' \
  '--tr-encoding[request compressed transfer-encoding]' \
  {-u,--user}'[specify user name and password for server authentication]:user\:password' \
  )

# Input arguments
arg_input=(\
  {-C,--continue-at}'[resume at offset ]:offset' \
  {-g,--globoff}'[do not glob {}\[\] letters]' \
  '--max-filesize[maximum filesize to download, fail for bigger files]:bytes' \
  '--proto[specify allowed protocols for transfer]:protocols' \
  '--proto-redir[specify allowed protocols for transfer after a redirect]:protocols' \
  {-r,--range}'[set range of bytes to request (HTTP/FTP/SFTP/FILE)]:range' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  {-T,--upload-file}'[transfer file to remote url (using PUT for HTTP)]:file to upload:_files' \
  '--url[specify a URL to fetch (multi)]:url:_urls' \
  {-z,--time-cond}'[request downloaded file to be newer than date or given reference file]:date expression' \
  )

# Output arguments
arg_output=(\
  '--create-dirs[create local directory hierarchy as needed]' \
  {-D,--dump-header}'[write protocol headers to file]:dump file:_files' \
  {-o,--output}'[write to specified file instead of stdout]:output file:_files' \
  {--progress-bar,-\#}'[display progress as a simple progress bar]' \
  {-\#,--progress-bar}'[Make curl display progress as a simple progress bar instead of the standard, more informational, meter.]' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  '--raw[disable all http decoding and pass raw data]' \
  {-s,--silent}'[silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[show errors in silent mode]' \
  '--stderr[redirect stderr to specified file]:output file:_files' \
  '--trace[enable full trace dump of all incoming and outgoing data]:trace file:_files' \
  '--trace-ascii[enable full trace dump of all incoming and outgoing data, without hex data]:trace file:_files' \
  '--trace-time[prepends a time stamp to each trace or verbose line that curl displays]' \
  {-v,--verbose}'[output debug info]' \
  {-w,--write-out}'[specify message to output on successful operation]:format string' \
  '--xattr[store some file metadata in extended file attributes]' \
  {-X,--request}'[specifies request method for HTTP server]:method:(GET POST PUT DELETE HEAD OPTIONS TRACE CONNECT PATCH LINK UNLINK)' \
  )

_arguments -C -s $arg_http $arg_ftp $arg_other $arg_crypto $arg_connection $arg_auth $arg_input $arg_output \
  {-M,--manual}'[Print manual]' \
  '*'{-K,--config}'[Use other config file to read arguments from]:config file:_files' \
  '--libcurl[output libcurl code for the operation to file]:output file:_files' \
  {-m,--max-time}'[Limit total time of operation]:seconds' \
  {-s,--silent}'[Silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[Show errors in silent mode]' \
  '--stderr[Redirect stderr to specified file]:output file:_files' \
  '-q[Do not read settings from .curlrc (must be first option)]' \
  {-h,--help}'[Print help and list of operations]' \
  {-V,--version}'[Print service API version]' \
  '--about[Print the information about service]' \
  '--host[Specify the host URL]':URL:_urls \
  '--dry-run[Print out the cURL command without executing it]' \
  {-ac,--accept}'[Set the Accept header in the request]: :{_values "Accept mime type" $(get_mime_type_completions)}' \
  {-ct,--content-type}'[Set the Content-type header in request]: :{_values "Content mime type" $(get_mime_type_completions)}' \
  '1: :->ops' \
  '*:: :->args' \
  && ret=0


case $state in
  ops)
    # Operations
    _values "Operations" \
            "getAuditLogEntries[Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.]" \
            "getAuditLogEntry[Use this endpoint to fetch a single audit log entry by its resouce ID.]"             "deleteCustomRole[Delete a custom role by key.]" \
            "getCustomRole[Get one custom role by key.]" \
            "getCustomRoles[Return a complete list of custom roles.]" \
            "patchCustomRole[Modify a custom role by key.]" \
            "postCustomRole[Create a new custom role.]"             "deleteEnvironment[Delete an environment in a specific project.]" \
            "getEnvironment[Get an environment given a project and key.]" \
            "patchEnvironment[Modify an environment by ID.]" \
            "postEnvironment[Create a new environment in a specified project with a given name, key, and swatch color.]"             "deleteFeatureFlag[Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.]" \
            "getFeatureFlag[Get a single feature flag by key.]" \
            "getFeatureFlagStatus[Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.]" \
            "getFeatureFlagStatuses[Get the status for a particular feature flag.]" \
            "getFeatureFlags[Get a list of all features in the given project.]" \
            "patchFeatureFlag[Perform a partial update to a feature.]" \
            "postFeatureFlag[Creates a new feature flag.]"             "deleteProject[Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.]" \
            "getProject[Fetch a single project by key.]" \
            "getProjects[Returns a list of all projects in the account.]" \
            "patchProject[Modify a project by ID.]" \
            "postProject[Create a new project with the given key and name.]"             "getRoot[]"             "deleteMember[Delete a team member by ID.]" \
            "getMember[Get a single team member by ID.]" \
            "getMembers[Returns a list of all members in the account.]" \
            "patchMember[Modify a team member by ID.]" \
            "postMembers[Invite new members.]"             "getUserFlagSetting[Fetch a single flag setting for a user by key.]" \
            "getUserFlagSettings[Fetch a single flag setting for a user by key.]" \
            "putFlagSetting[Specifically enable or disable a feature flag for a user based on their key.]"             "deleteUser[Delete a user by ID.]" \
            "getSearchUsers[Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.]" \
            "getUser[Get a user by key.]" \
            "getUsers[List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.]"             "deleteWebhook[Delete a webhook by ID.]" \
            "getWebhook[Get a webhook by ID.]" \
            "getWebhooks[Fetch a list of all webhooks.]" \
            "patchWebhook[Modify a webhook by ID.]" \
            "postWebhook[Create a webhook.]" 
    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      getAuditLogEntries)
        local -a _op_arguments
        _op_arguments=(
                    "before=:[QUERY] A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have before this timestamp."
"after=:[QUERY] A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occured after this timestamp."
"q=:[QUERY] Text to search for. You can search for the full or partial name of the resource involved or fullpartial email address of the member who made the change."
"limit=:[QUERY] A limit on the number of audit log entries to be returned, between 1 and 20."
"spec=:[QUERY] A resource specifier, allowing you to filter audit log listings by resource."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAuditLogEntry)
        local -a _op_arguments
        _op_arguments=(
          "resourceId=:[PATH] The resource ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCustomRole)
        local -a _op_arguments
        _op_arguments=(
          "customRoleKey=:[PATH] The custom role key."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCustomRole)
        local -a _op_arguments
        _op_arguments=(
          "customRoleKey=:[PATH] The custom role key."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCustomRoles)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchCustomRole)
        local -a _op_arguments
        _op_arguments=(
          "customRoleKey=:[PATH] The custom role key."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postCustomRole)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteEnvironment)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getEnvironment)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchEnvironment)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postEnvironment)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteFeatureFlag)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"featureFlagKey=:[PATH] The feature flag&#39;s key. The key identifies the flag in your code."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFeatureFlag)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"featureFlagKey=:[PATH] The feature flag&#39;s key. The key identifies the flag in your code."
          "env=:[QUERY] By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env&#x3D;production will restrict the returned configurations to just your production environment."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFeatureFlagStatus)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFeatureFlagStatuses)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
"featureFlagKey=:[PATH] The feature flag&#39;s key. The key identifies the flag in your code."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFeatureFlags)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
          "env=:[QUERY] By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env&#x3D;production will restrict the returned configurations to just your production environment."
"tag=:[QUERY] Filter by tag. A tag can be used to group flags across projects."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchFeatureFlag)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"featureFlagKey=:[PATH] The feature flag&#39;s key. The key identifies the flag in your code."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postFeatureFlag)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteProject)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getProject)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getProjects)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchProject)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postProject)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRoot)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteMember)
        local -a _op_arguments
        _op_arguments=(
          "memberId=:[PATH] The member ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMember)
        local -a _op_arguments
        _op_arguments=(
          "memberId=:[PATH] The member ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMembers)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchMember)
        local -a _op_arguments
        _op_arguments=(
          "memberId=:[PATH] The member ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postMembers)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserFlagSetting)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
"userKey=:[PATH] The user&#39;s key."
"featureFlagKey=:[PATH] The feature flag&#39;s key. The key identifies the flag in your code."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserFlagSettings)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
"userKey=:[PATH] The user&#39;s key."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      putFlagSetting)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
"userKey=:[PATH] The user&#39;s key."
"featureFlagKey=:[PATH] The feature flag&#39;s key. The key identifies the flag in your code."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteUser)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
"userKey=:[PATH] The user&#39;s key."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSearchUsers)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
          "q=:[QUERY] Search query."
"limit=:[QUERY] Pagination limit."
"offset=:[QUERY] Specifies the first item to return in the collection."
"after=:[QUERY] A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occured after this timestamp."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUser)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
"userKey=:[PATH] The user&#39;s key."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsers)
        local -a _op_arguments
        _op_arguments=(
          "projectKey=:[PATH] The project key, used to tie the flags together under one project so they can be managed together."
"environmentKey=:[PATH] The environment key, used to tie together flag configuration and users under one environment so they can be managed together."
          "limit=:[QUERY] Pagination limit."
"h=:[QUERY] Next link query parameter."
"scrollId=:[QUERY] Next link query parameter."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteWebhook)
        local -a _op_arguments
        _op_arguments=(
          "resourceId=:[PATH] The resource ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWebhook)
        local -a _op_arguments
        _op_arguments=(
          "resourceId=:[PATH] The resource ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWebhooks)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchWebhook)
        local -a _op_arguments
        _op_arguments=(
          "resourceId=:[PATH] The resource ID."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postWebhook)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
