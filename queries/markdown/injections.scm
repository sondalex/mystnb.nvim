;; extends
(
 fenced_code_block (
                    (info_string (
                                 (language) @language
                                 (#eq? @language "code-cell")
                                 ) )@info_string
                    (
                     (code_fence_content) @injection.content
                     (#set-lang-from-info-string-line! @info_string)
                    ) 
                    )
 ) @code_block
