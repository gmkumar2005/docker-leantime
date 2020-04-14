oc delete project leantimestage
oc new-project leantimestage --description="Leantime testing" --display-name="Leantime-stage"
oc policy add-role-to-user edit system:serviceaccount:leantimestage:default -n leantimestage
oc new-app  -f leantime-template-stagejob.yaml -n leantimestage