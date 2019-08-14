#!/bin/sh

#TOP_WORK_DIR="`cd "${dirToNormalize}";pwd`"
#
#def focused_specs(dir)
#    pattern = focuses.join('fit(|fcontext(|fdescribe(')
#
#    spec_files = FileList[File.join(dir, '**', '*Spec.swift')]
#    grep_files = spec_files.map {|x| "\"#{x}\"" }
#
#    focused_specs = `grep -l -r -e "\\(#{pattern}\\)" #{grep_files.join(' ')} | grep -v 'Frameworks'`.split("\n")
#end
#
## returns: true when a focus is removed. false, otherwise.
#def remove_focuses(dir)
#    sed_files = focused_specs(dir).map {|x| "\"#{x}\"" }
#
#    if sed_files.empty?
#    print("No focuses to remove.\n")
#    return false
#    end
#
#    substitutions = focuses.map { |method|
#    unfocused_method = method.sub(/^f/, '')
#    "-e 's/#{method}/#{unfocused_method}/g;'"
#    }
#
#    sh "sed -i '' #{substitutions.join(' ')} #{sed_files.join(' ')}"
#    print("\nRemoved all focuses.\n")
#    return true
#end
