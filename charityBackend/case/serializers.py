from rest_framework import serializers
from case.models import FileUpload, Case, CaseQuery, CasePurpose, CaseEvaluation, LovSeedData, CaseDisbursement, CaseRepayment
from user.models import CustomUser
import base64
import imghdr
import uuid
from django.core.files.base import ContentFile
from datetime import datetime


class FileUploadSerializer(serializers.ModelSerializer):

    def validate_file(self, value):
        allowed_types = [
            'image/jpeg', 'image/png', 'application/pdf', 
            'application/msword', 
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
        ]
        if value.content_type not in allowed_types:
            raise serializers.ValidationError('Unsupported file type.')
        return value

    class Meta:
        model = FileUpload
        fields = ('id', 'file')

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        file_url = representation['file']
        # Remove the full URL and only return the path
        representation['file'] = file_url.replace(self.context['request'].build_absolute_uri('/'), '')
        return representation

class Base64ImageField(serializers.ImageField):
    def to_internal_value(self, data):
        # Check if this is a base64 string
        if isinstance(data, str) and data.startswith('data:image'):
            # Format is "data:image/<image-type>;base64,<image-data>"
            format, imgstr = data.split(';base64,') 
            ext = format.split('/')[-1]  # Extract image type from data string
            id = uuid.uuid4().hex  # Create a unique name
            data = ContentFile(base64.b64decode(imgstr), name=f"{id}.{ext}")

        return super().to_internal_value(data)

class Base64FileField(serializers.FileField):
    def to_internal_value(self, data):
        if data is None:
            return None
        if isinstance(data, str) and data.startswith('data:'):
            format, filestr = data.split(';base64,')
            ext = format.split('/')[-1]
            id = uuid.uuid4().hex
            data = ContentFile(base64.b64decode(filestr), name=f"{id}.{ext}")
        return super().to_internal_value(data)


class CustomUserSerializer(serializers.ModelSerializer):
    #profile_pic = Base64ImageField(max_length=None, use_url=True, required=False, allow_null=True)
    #identity_proof_copy = Base64FileField(max_length=None, use_url=True, required=False, allow_null=True)
    #address_proof_copy = Base64FileField(max_length=None, use_url=True, required=False, allow_null=True)
    #income_copy = Base64FileField(max_length=None, use_url=True, required=False, allow_null=True)

    class Meta:
        model = CustomUser
        #fields = '__all__'
        #fields = ['id', 'is_active', 'default_account_id', 'firstname', 'lastname', 'email', 'b_phoneno', 'gender', 'dob', 'b_profile_pic', 'user_role', 'nationality', 'religion', 'marital_status','b_profession', 'identity_proof', 'identity_proof_copy', 'address_proof','address_proof_copy','state', 'user_role', 'is_guarantor','income_proof','income_copy','monthly_income','tot_fam_income','tot_dependants','cibil_score']  
        fields = ['id', 'user_role', 'is_active', 'default_account_id', 'firstname', 'lastname', 'email', 'gender', 'dob', 'phoneno', 'nationality', 'religion', 'marital_status','highest_education', 'profession', 'profile_pic', 'monthly_income','tot_fam_income','tot_dependants','cibil_score', 'covenants_risks', 'identity_proof', 'identity_proof_copy', 'address_proof', 'address_proof_copy', 'income_proof','income_copy', 'status','default_account_id', 'is_guarantor']

class CustomUserListSerializer(serializers.ModelSerializer):
    user_role = serializers.CharField()
    email = serializers.EmailField()
    first_name = serializers.CharField(source='firstname')
    last_name = serializers.CharField(source='lastname')
    user_phonenumber = serializers.CharField(source='phoneno')
    is_active = serializers.CharField(source='status')
    created_on = serializers.SerializerMethodField()  

    class Meta:
        model = CustomUser
        #fields = '__all__'
        #fields = ['id', 'is_active', 'default_account_id', 'firstname', 'lastname', 'email', 'b_phoneno', 'gender', 'dob', 'b_profile_pic', 'user_role', 'nationality', 'religion', 'marital_status','b_profession', 'identity_proof', 'identity_proof_copy', 'address_proof','address_proof_copy','state', 'user_role', 'is_guarantor','income_proof','income_copy','monthly_income','tot_fam_income','tot_dependants','cibil_score']  
        fields = ['user_role', 'is_active','first_name', 'last_name', 'email', 'created_on', 'user_phonenumber']
    
    def get_created_on(self, obj):
        created_at = obj.created_at
        if created_at:
            date_obj = datetime.strptime(str(created_at), "%Y-%m-%d %H:%M:%S.%f+00:00")
            return date_obj.strftime("%d %b, %Y")
        return 'N/A'  # Default value if 'created_at' is not available

class CaseSerializer(serializers.ModelSerializer):

    class Meta:
        model = Case
        #fields = '__all__'
        #fields = ['id', 'request_amt', 'guarantor_email', 'guarantor_name', 'guarantor_phone', 'benefactor_user_id', 'coapplicant_user_id', 'referred_by', 'grant_type', "approval_status", "coordinator_user_id",'purpose', 'short_description', 'disbursement_schedule', 'collateral', 'case_submit_date', 'pending_info']
        fields = ['id', 'request_amt', 'purpose', 'short_description', 'has_guarantor','benefactor_user_id', 'guarantor_user_id', 'guarantor_name', 'guarantor_phone', 'guarantor_email', 'coapplicant_user_id', 'referred_by',  'coordinator_user_id', 'grant_type', 'approval_status', 'disbursement_schedule', 'collateral', 'case_submit_date', 'pending_info','approved_amt','disbursement_count','repay_plan','repayment_count','repay_percent']

class CaseQuerySerializer(serializers.ModelSerializer):
    class Meta:
        model = CaseQuery
        fields = ['id', 'question_text', 'answer_text', 'supp_docs_list', 'question_by', 'answer_by', 'question_time', 'answer_time', 'state', 'answer_by_userid', 'question_by_userid' , 'case_id']

class CasePurposeSerializer(serializers.ModelSerializer):
    #answer_text = serializers.ListField(child=serializers.CharField(), allow_empty=True)
    answer_text = serializers.JSONField()

    class Meta:
        model = CasePurpose
        fields = ['id', 'purpose_name', 'question_text', 'answer_text', 'case_id']
        
    def validate_answer_text(self, value):
        if isinstance(value, list):
            if not all(isinstance(i, str) for i in value):
                raise serializers.ValidationError("All items in the list must be strings.")
        elif not isinstance(value, str):
            raise serializers.ValidationError("Answer text must be a string or a list of strings.")
        return value

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        answer_text = representation.get('answer_text')

        # Check if the answer_text can be deserialized to a list
        if isinstance(answer_text, list):
            representation['answer_text'] = answer_text
        elif isinstance(answer_text, str):
            representation['answer_text'] = answer_text
        else:
            # If it's neither, raise an error
            raise serializers.ValidationError("Answer text must be a string or a list of strings.")
        
        return representation

class CaseEvaluationSerializer(serializers.ModelSerializer):
    class Meta:
        model = CaseEvaluation
        fields = ['id', 'evaluator_notes', 'evaluation_status', 'latest_action_date', 'case_id', 'user_id']

class DisbursementSerializer(serializers.ModelSerializer):
    class Meta:
        model = CaseDisbursement
        fields = ["id", "case_id", "created_by","created_time", "updated_by","updated_time", "installment_amt", "planned_date","disbursed_date","disbursed_amt", "remaining_amt","tot_disbursed_amt","disbursement_status","disbursement_txn_info"]

class CustomDisbursementSerializer(serializers.ModelSerializer):
    class Meta:
        model = CaseDisbursement
        fields = ["id", "created_by","updated_by","installment_amt", "planned_date","disbursed_date","disbursed_amt", "remaining_amt","tot_disbursed_amt","disbursement_status","disbursement_txn_info"]

class RepaymentAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = CaseRepayment
        fields = ["id", "case_id", "created_by","created_time", "updated_by","updated_time", "planned_repayment_amt", "planned_date","repayment_date","actual_repayment_amt", "outstanding_amt","tot_repayed_amt","repayment_status","repayment_txn_info"]

class CustomRepaymentAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = CaseRepayment
        fields = ["id", "created_by", "updated_by","planned_repayment_amt", "planned_date","repayment_date","actual_repayment_amt", "outstanding_amt","tot_repayed_amt","repayment_status","repayment_txn_info"]


class LovSeedDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = LovSeedData
        fields = '__all__'


        