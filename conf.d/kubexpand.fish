function _kubexpand_update_abbreviations --on-event fish_prompt --description="Update dynamic kubectl aliases"

    # Erase old abbreviations and abort in case kubectl is gone for some reason
    if not command --quiet kubectl
        abbr --query k; and abbr --erase k
        abbr --query kubectl; and abbr --erase kubectl
        return 0
    end

    # Detect if kubeconfig has changed since last invocation; abort if our abbreviations are up-to-date to avoid expensive 'kubectl config current-context' call below
    test -n "$KUBECONFIG"; or set KUBECONFIG ~/.kube/config
    test (uname) = "Linux"; or set stat_args "-x"
    set kubeconfig_stat (
        for kubeconfig_segment in (string split ":" "$KUBECONFIG")
            stat $stat_args "$kubeconfig_segment" 2>/dev/null | grep -E "^ *(File|Modify):"
        end
    )
    if test "$_kubexpand_last_kubeconfig_stat" != "$kubeconfig_stat"
        set --global _kubexpand_last_kubeconfig_stat "$kubeconfig_stat"
    else
        return 0
    end

    # Update kubectl abbreviations to contain current context
    set kubectl_context (kubectl config current-context 2>/dev/null)
    if test -n "$kubectl_context"
        set kubectl_cmd "kubectl --context=$kubectl_context"
    else
        set kubectl_cmd "kubectl"
    end
    abbr --global k $kubectl_cmd
    abbr --global kubectl $kubectl_cmd

end
