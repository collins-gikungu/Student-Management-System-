codeunit 50101 "Workflow Response Handling Ext"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling Custom";
        WorkFlowResponse: Codeunit "Workflow Response Handling";
    begin
        case ResponseFunctionName OF
            WorkFlowResponse.SetStatusToPendingApprovalCode:
                begin
                    //SemesterRegistration 
                    WorkFlowResponse.AddResponsePredecessor(WorkFlowResponse.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendSemesterRegistrationForApprovalCode());
                end;
            WorkFlowResponse.CreateApprovalRequestsCode:
                begin
                    //SemesterRegistration
                    WorkFlowResponse.AddResponsePredecessor(WorkFlowResponse.CreateApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnSendSemesterRegistrationForApprovalCode());
                end;
            WorkFlowResponse.SendApprovalRequestForApprovalCode:
                begin
                    //SemesterRegistration
                    WorkFlowResponse.AddResponsePredecessor(WorkFlowResponse.CreateApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnSendSemesterRegistrationForApprovalCode());
                end;
            WorkFlowResponse.OpenDocumentCode:
                begin
                    //SemesterRegistration
                    WorkFlowResponse.AddResponsePredecessor(WorkFlowResponse.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelSemesterRegistrationApprovalRequestCode());
                end;
            WorkFlowResponse.CancelAllApprovalRequestsCode:
                begin
                    //SemesterRegistration
                    WorkFlowResponse.AddResponsePredecessor(WorkFlowResponse.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelSemesterRegistrationApprovalRequestCode());
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        WorkflowResponses: Codeunit "Workflow Responses";
        VarVariant: Variant;
        SememseterRegistration: Record "Semester Registration";
    begin
        VarVariant := RecRef;
        case RecRef.NUMBER OF
            Database::"Semester Registration":
                    begin
                        SememseterRegistration.SetView(RecRef.GetView());
                        Handled := true;
                        WorkflowResponses.SemesterRegistrationRelease(VarVariant);
                    end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', false, false)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        WorkflowResponses: Codeunit "Workflow Responses";
        SemesterRegistration: Record "Semester Registration";
    begin
        case RecRef.NUMBER OF
            Database::"Semester Registration":
                begin       
                    SemesterRegistration.SetView(RecRef.GetView());
                    Handled := true;
                    WorkflowResponses.SemesterRegistrationReopen(SemesterRegistration);
        end;
    end;
    end;

}



