
C
global_step/initial_valueConst*
dtype0*
value	B : 
W
global_step
VariableV2*
dtype0*
	container *
shape: *
shared_name 
�
global_step/AssignAssignglobal_stepglobal_step/initial_value*
validate_shape(*
use_locking(*
T0*
_class
loc:@global_step
R
global_step/readIdentityglobal_step*
T0*
_class
loc:@global_step
;
steps_to_incrementPlaceholder*
dtype0*
shape: 
9
AddAddglobal_step/readsteps_to_increment*
T0
t
AssignAssignglobal_stepAdd*
T0*
_class
loc:@global_step*
validate_shape(*
use_locking(
5

batch_sizePlaceholder*
shape:*
dtype0
:
sequence_lengthPlaceholder*
dtype0*
shape:
;
masksPlaceholder*
shape:���������*
dtype0
;
CastCastmasks*

SrcT0*
Truncate( *

DstT0
M
#is_continuous_control/initial_valueConst*
value	B : *
dtype0
a
is_continuous_control
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
is_continuous_control/AssignAssignis_continuous_control#is_continuous_control/initial_value*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
p
is_continuous_control/readIdentityis_continuous_control*
T0*(
_class
loc:@is_continuous_control
F
version_number/initial_valueConst*
dtype0*
value	B :
Z
version_number
VariableV2*
dtype0*
	container *
shape: *
shared_name 
�
version_number/AssignAssignversion_numberversion_number/initial_value*
validate_shape(*
use_locking(*
T0*!
_class
loc:@version_number
[
version_number/readIdentityversion_number*
T0*!
_class
loc:@version_number
D
memory_size/initial_valueConst*
value
B :�*
dtype0
W
memory_size
VariableV2*
dtype0*
	container *
shape: *
shared_name 
�
memory_size/AssignAssignmemory_sizememory_size/initial_value*
T0*
_class
loc:@memory_size*
validate_shape(*
use_locking(
R
memory_size/readIdentitymemory_size*
T0*
_class
loc:@memory_size
K
!action_output_shape/initial_valueConst*
dtype0*
value	B :	
_
action_output_shape
VariableV2*
dtype0*
	container *
shape: *
shared_name 
�
action_output_shape/AssignAssignaction_output_shape!action_output_shape/initial_value*
T0*&
_class
loc:@action_output_shape*
validate_shape(*
use_locking(
j
action_output_shape/readIdentityaction_output_shape*
T0*&
_class
loc:@action_output_shape
M
vector_observationPlaceholder*
dtype0*
shape:����������
w
%normalization_steps/Initializer/zerosConst*
dtype0*&
_class
loc:@normalization_steps*
value	B : 
�
normalization_steps
VariableV2*
shared_name *&
_class
loc:@normalization_steps*
dtype0*
	container *
shape: 
�
normalization_steps/AssignAssignnormalization_steps%normalization_steps/Initializer/zeros*
T0*&
_class
loc:@normalization_steps*
validate_shape(*
use_locking(
j
normalization_steps/readIdentitynormalization_steps*
T0*&
_class
loc:@normalization_steps
q
running_mean/Initializer/zerosConst*
_class
loc:@running_mean*
valueB�*    *
dtype0
~
running_mean
VariableV2*
shared_name *
_class
loc:@running_mean*
dtype0*
	container *
shape:�
�
running_mean/AssignAssignrunning_meanrunning_mean/Initializer/zeros*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
U
running_mean/readIdentityrunning_mean*
T0*
_class
loc:@running_mean
x
!running_variance/Initializer/onesConst*#
_class
loc:@running_variance*
valueB�*  �?*
dtype0
�
running_variance
VariableV2*
shape:�*
shared_name *#
_class
loc:@running_variance*
dtype0*
	container 
�
running_variance/AssignAssignrunning_variance!running_variance/Initializer/ones*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
a
running_variance/readIdentityrunning_variance*
T0*#
_class
loc:@running_variance
;
ShapeShapevector_observation*
T0*
out_type0
A
strided_slice/stackConst*
valueB: *
dtype0
C
strided_slice/stack_1Const*
valueB:*
dtype0
C
strided_slice/stack_2Const*
valueB:*
dtype0
�
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
Index0*
T0
>
Add_1Addnormalization_steps/readstrided_slice*
T0
:
SubSubvector_observationrunning_mean/read*
T0
=
Cast_1CastAdd_1*
Truncate( *

DstT0*

SrcT0
(
truedivRealDivSubCast_1*
T0
?
Sum/reduction_indicesConst*
value	B : *
dtype0
P
SumSumtruedivSum/reduction_indices*

Tidx0*
	keep_dims( *
T0
/
add_2AddV2running_mean/readSum*
T0
0
Sub_1Subvector_observationadd_2*
T0

mulMulSub_1Sub*
T0
A
Sum_1/reduction_indicesConst*
value	B : *
dtype0
P
Sum_1SummulSum_1/reduction_indices*
T0*

Tidx0*
	keep_dims( 
5
add_3AddV2running_variance/readSum_1*
T0
z
Assign_1Assignrunning_meanadd_2*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
�
Assign_2Assignrunning_varianceadd_3*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
�
Assign_3Assignnormalization_stepsAdd_1*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
3

group_depsNoOp	^Assign_1	^Assign_2	^Assign_3
<
sub_2Subvector_observationrunning_mean/read*
T0
P
Cast_2Castnormalization_steps/read*
Truncate( *

DstT0*

SrcT0
4
add_4/yConst*
valueB
 *  �?*
dtype0
(
add_4AddV2Cast_2add_4/y*
T0
;
	truediv_1RealDivrunning_variance/readadd_4*
T0
 
SqrtSqrt	truediv_1*
T0
*
	truediv_2RealDivsub_2Sqrt*
T0
G
normalized_state/Minimum/yConst*
valueB
 *  �@*
dtype0
S
normalized_state/MinimumMinimum	truediv_2normalized_state/Minimum/y*
T0
?
normalized_state/yConst*
valueB
 *  ��*
dtype0
R
normalized_stateMaximumnormalized_state/Minimumnormalized_state/y*
T0
�
?main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shapeConst*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
valueB"�     *
dtype0
�
>main_graph_0/hidden_0/kernel/Initializer/truncated_normal/meanConst*
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
valueB
 *    
�
@main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddevConst*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
valueB
 *��Q=*
dtype0
�
Imain_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�$*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
seed2K
�
=main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
9main_graph_0/hidden_0/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
main_graph_0/hidden_0/kernel
VariableV2*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
#main_graph_0/hidden_0/kernel/AssignAssignmain_graph_0/hidden_0/kernel9main_graph_0/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(
�
!main_graph_0/hidden_0/kernel/readIdentitymain_graph_0/hidden_0/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
,main_graph_0/hidden_0/bias/Initializer/zerosConst*-
_class#
!loc:@main_graph_0/hidden_0/bias*
valueB�*    *
dtype0
�
main_graph_0/hidden_0/bias
VariableV2*-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0*
	container *
shape:�*
shared_name 
�
!main_graph_0/hidden_0/bias/AssignAssignmain_graph_0/hidden_0/bias,main_graph_0/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(

main_graph_0/hidden_0/bias/readIdentitymain_graph_0/hidden_0/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
�
main_graph_0/hidden_0/MatMulMatMulnormalized_state!main_graph_0/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b( 
�
main_graph_0/hidden_0/BiasAddBiasAddmain_graph_0/hidden_0/MatMulmain_graph_0/hidden_0/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_0/SigmoidSigmoidmain_graph_0/hidden_0/BiasAdd*
T0
g
main_graph_0/hidden_0/MulMulmain_graph_0/hidden_0/BiasAddmain_graph_0/hidden_0/Sigmoid*
T0
�
?main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shapeConst*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
valueB"      *
dtype0
�
>main_graph_0/hidden_1/kernel/Initializer/truncated_normal/meanConst*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
valueB
 *    *
dtype0
�
@main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddevConst*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
valueB
 *��M=*
dtype0
�
Imain_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�$*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
seed2\
�
=main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
9main_graph_0/hidden_1/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
main_graph_0/hidden_1/kernel
VariableV2*
shape:
��*
shared_name */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
	container 
�
#main_graph_0/hidden_1/kernel/AssignAssignmain_graph_0/hidden_1/kernel9main_graph_0/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(
�
!main_graph_0/hidden_1/kernel/readIdentitymain_graph_0/hidden_1/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
,main_graph_0/hidden_1/bias/Initializer/zerosConst*-
_class#
!loc:@main_graph_0/hidden_1/bias*
valueB�*    *
dtype0
�
main_graph_0/hidden_1/bias
VariableV2*
shared_name *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0*
	container *
shape:�
�
!main_graph_0/hidden_1/bias/AssignAssignmain_graph_0/hidden_1/bias,main_graph_0/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(

main_graph_0/hidden_1/bias/readIdentitymain_graph_0/hidden_1/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
�
main_graph_0/hidden_1/MatMulMatMulmain_graph_0/hidden_0/Mul!main_graph_0/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
main_graph_0/hidden_1/BiasAddBiasAddmain_graph_0/hidden_1/MatMulmain_graph_0/hidden_1/bias/read*
data_formatNHWC*
T0
P
main_graph_0/hidden_1/SigmoidSigmoidmain_graph_0/hidden_1/BiasAdd*
T0
g
main_graph_0/hidden_1/MulMulmain_graph_0/hidden_1/BiasAddmain_graph_0/hidden_1/Sigmoid*
T0
E
prev_actionPlaceholder*
dtype0*
shape:���������
J
strided_slice_1/stackConst*
valueB"        *
dtype0
L
strided_slice_1/stack_1Const*
dtype0*
valueB"       
L
strided_slice_1/stack_2Const*
valueB"      *
dtype0
�
strided_slice_1StridedSliceprev_actionstrided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*
Index0*
T0
=
one_hot/on_valueConst*
valueB
 *  �?*
dtype0
>
one_hot/off_valueConst*
valueB
 *    *
dtype0
7
one_hot/depthConst*
value	B :*
dtype0
~
one_hotOneHotstrided_slice_1one_hot/depthone_hot/on_valueone_hot/off_value*
T0*
TI0*
axis���������
J
strided_slice_2/stackConst*
valueB"       *
dtype0
L
strided_slice_2/stack_1Const*
valueB"       *
dtype0
L
strided_slice_2/stack_2Const*
valueB"      *
dtype0
�
strided_slice_2StridedSliceprev_actionstrided_slice_2/stackstrided_slice_2/stack_1strided_slice_2/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
?
one_hot_1/on_valueConst*
dtype0*
valueB
 *  �?
@
one_hot_1/off_valueConst*
dtype0*
valueB
 *    
9
one_hot_1/depthConst*
value	B :*
dtype0
�
	one_hot_1OneHotstrided_slice_2one_hot_1/depthone_hot_1/on_valueone_hot_1/off_value*
T0*
TI0*
axis���������
J
strided_slice_3/stackConst*
valueB"       *
dtype0
L
strided_slice_3/stack_1Const*
valueB"       *
dtype0
L
strided_slice_3/stack_2Const*
valueB"      *
dtype0
�
strided_slice_3StridedSliceprev_actionstrided_slice_3/stackstrided_slice_3/stack_1strided_slice_3/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
?
one_hot_2/on_valueConst*
valueB
 *  �?*
dtype0
@
one_hot_2/off_valueConst*
valueB
 *    *
dtype0
9
one_hot_2/depthConst*
dtype0*
value	B :
�
	one_hot_2OneHotstrided_slice_3one_hot_2/depthone_hot_2/on_valueone_hot_2/off_value*
T0*
TI0*
axis���������
5
concat/axisConst*
value	B :*
dtype0
\
concatConcatV2one_hot	one_hot_1	one_hot_2concat/axis*
T0*
N*

Tidx0
7
concat_1/axisConst*
value	B :*
dtype0
d
concat_1ConcatV2main_graph_0/hidden_1/Mulconcatconcat_1/axis*
T0*
N*

Tidx0
G
recurrent_inPlaceholder*
dtype0*
shape:����������
B
Reshape/shape/0Const*
valueB :
���������*
dtype0
:
Reshape/shape/2Const*
value
B :�*
dtype0
f
Reshape/shapePackReshape/shape/0sequence_lengthReshape/shape/2*
T0*

axis *
N
B
ReshapeReshapeconcat_1Reshape/shape*
T0*
Tshape0
J
strided_slice_4/stackConst*
valueB"        *
dtype0
L
strided_slice_4/stack_1Const*
valueB"        *
dtype0
L
strided_slice_4/stack_2Const*
valueB"      *
dtype0
�
strided_slice_4StridedSlicerecurrent_instrided_slice_4/stackstrided_slice_4/stack_1strided_slice_4/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
D
Reshape_1/shapeConst*
valueB"����   *
dtype0
M
	Reshape_1Reshapestrided_slice_4Reshape_1/shape*
T0*
Tshape0
M
lstm/strided_slice/stackConst*
valueB"        *
dtype0
O
lstm/strided_slice/stack_1Const*
valueB"    �   *
dtype0
O
lstm/strided_slice/stack_2Const*
valueB"      *
dtype0
�
lstm/strided_sliceStridedSlice	Reshape_1lstm/strided_slice/stacklstm/strided_slice/stack_1lstm/strided_slice/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
O
lstm/strided_slice_1/stackConst*
dtype0*
valueB"    �   
Q
lstm/strided_slice_1/stack_1Const*
dtype0*
valueB"        
Q
lstm/strided_slice_1/stack_2Const*
valueB"      *
dtype0
�
lstm/strided_slice_1StridedSlice	Reshape_1lstm/strided_slice_1/stacklstm/strided_slice_1/stack_1lstm/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
7
lstm/rnn/RankConst*
value	B :*
dtype0
>
lstm/rnn/range/startConst*
value	B :*
dtype0
>
lstm/rnn/range/deltaConst*
value	B :*
dtype0
^
lstm/rnn/rangeRangelstm/rnn/range/startlstm/rnn/Ranklstm/rnn/range/delta*

Tidx0
M
lstm/rnn/concat/values_0Const*
dtype0*
valueB"       
>
lstm/rnn/concat/axisConst*
value	B : *
dtype0
y
lstm/rnn/concatConcatV2lstm/rnn/concat/values_0lstm/rnn/rangelstm/rnn/concat/axis*
N*

Tidx0*
T0
O
lstm/rnn/transpose	TransposeReshapelstm/rnn/concat*
Tperm0*
T0
D
lstm/rnn/ShapeShapelstm/rnn/transpose*
T0*
out_type0
J
lstm/rnn/strided_slice/stackConst*
valueB:*
dtype0
L
lstm/rnn/strided_slice/stack_1Const*
valueB:*
dtype0
L
lstm/rnn/strided_slice/stack_2Const*
dtype0*
valueB:
�
lstm/rnn/strided_sliceStridedSlicelstm/rnn/Shapelstm/rnn/strided_slice/stacklstm/rnn/strided_slice/stack_1lstm/rnn/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
F
lstm/rnn/Shape_1Shapelstm/rnn/transpose*
T0*
out_type0
L
lstm/rnn/strided_slice_1/stackConst*
valueB: *
dtype0
N
 lstm/rnn/strided_slice_1/stack_1Const*
valueB:*
dtype0
N
 lstm/rnn/strided_slice_1/stack_2Const*
valueB:*
dtype0
�
lstm/rnn/strided_slice_1StridedSlicelstm/rnn/Shape_1lstm/rnn/strided_slice_1/stack lstm/rnn/strided_slice_1/stack_1 lstm/rnn/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
F
lstm/rnn/Shape_2Shapelstm/rnn/transpose*
T0*
out_type0
L
lstm/rnn/strided_slice_2/stackConst*
valueB:*
dtype0
N
 lstm/rnn/strided_slice_2/stack_1Const*
valueB:*
dtype0
N
 lstm/rnn/strided_slice_2/stack_2Const*
dtype0*
valueB:
�
lstm/rnn/strided_slice_2StridedSlicelstm/rnn/Shape_2lstm/rnn/strided_slice_2/stack lstm/rnn/strided_slice_2/stack_1 lstm/rnn/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
A
lstm/rnn/ExpandDims/dimConst*
dtype0*
value	B : 
i
lstm/rnn/ExpandDims
ExpandDimslstm/rnn/strided_slice_2lstm/rnn/ExpandDims/dim*

Tdim0*
T0
=
lstm/rnn/ConstConst*
valueB:�*
dtype0
@
lstm/rnn/concat_1/axisConst*
value	B : *
dtype0
x
lstm/rnn/concat_1ConcatV2lstm/rnn/ExpandDimslstm/rnn/Constlstm/rnn/concat_1/axis*

Tidx0*
T0*
N
A
lstm/rnn/zeros/ConstConst*
valueB
 *    *
dtype0
Z
lstm/rnn/zerosFilllstm/rnn/concat_1lstm/rnn/zeros/Const*
T0*

index_type0
7
lstm/rnn/timeConst*
value	B : *
dtype0
�
lstm/rnn/TensorArrayTensorArrayV3lstm/rnn/strided_slice_1*%
element_shape:����������*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*4
tensor_array_namelstm/rnn/dynamic_rnn/output_0*
dtype0
�
lstm/rnn/TensorArray_1TensorArrayV3lstm/rnn/strided_slice_1*3
tensor_array_namelstm/rnn/dynamic_rnn/input_0*
dtype0*%
element_shape:����������*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
W
!lstm/rnn/TensorArrayUnstack/ShapeShapelstm/rnn/transpose*
T0*
out_type0
]
/lstm/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0
_
1lstm/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0
_
1lstm/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0
�
)lstm/rnn/TensorArrayUnstack/strided_sliceStridedSlice!lstm/rnn/TensorArrayUnstack/Shape/lstm/rnn/TensorArrayUnstack/strided_slice/stack1lstm/rnn/TensorArrayUnstack/strided_slice/stack_11lstm/rnn/TensorArrayUnstack/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
Q
'lstm/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0
Q
'lstm/rnn/TensorArrayUnstack/range/deltaConst*
dtype0*
value	B :
�
!lstm/rnn/TensorArrayUnstack/rangeRange'lstm/rnn/TensorArrayUnstack/range/start)lstm/rnn/TensorArrayUnstack/strided_slice'lstm/rnn/TensorArrayUnstack/range/delta*

Tidx0
�
Clstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3lstm/rnn/TensorArray_1!lstm/rnn/TensorArrayUnstack/rangelstm/rnn/transposelstm/rnn/TensorArray_1:1*
T0*%
_class
loc:@lstm/rnn/transpose
<
lstm/rnn/Maximum/xConst*
value	B :*
dtype0
R
lstm/rnn/MaximumMaximumlstm/rnn/Maximum/xlstm/rnn/strided_slice_1*
T0
P
lstm/rnn/MinimumMinimumlstm/rnn/strided_slice_1lstm/rnn/Maximum*
T0
J
 lstm/rnn/while/iteration_counterConst*
value	B : *
dtype0
�
lstm/rnn/while/EnterEnter lstm/rnn/while/iteration_counter*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant( 
�
lstm/rnn/while/Enter_1Enterlstm/rnn/time*
T0*
is_constant( *
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
lstm/rnn/while/Enter_2Enterlstm/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
lstm/rnn/while/Enter_3Enterlstm/strided_slice*
T0*
is_constant( *
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
lstm/rnn/while/Enter_4Enterlstm/strided_slice_1*
T0*
is_constant( *
parallel_iterations *,

frame_namelstm/rnn/while/while_context
c
lstm/rnn/while/MergeMergelstm/rnn/while/Enterlstm/rnn/while/NextIteration*
T0*
N
i
lstm/rnn/while/Merge_1Mergelstm/rnn/while/Enter_1lstm/rnn/while/NextIteration_1*
N*
T0
i
lstm/rnn/while/Merge_2Mergelstm/rnn/while/Enter_2lstm/rnn/while/NextIteration_2*
T0*
N
i
lstm/rnn/while/Merge_3Mergelstm/rnn/while/Enter_3lstm/rnn/while/NextIteration_3*
T0*
N
i
lstm/rnn/while/Merge_4Mergelstm/rnn/while/Enter_4lstm/rnn/while/NextIteration_4*
T0*
N
U
lstm/rnn/while/LessLesslstm/rnn/while/Mergelstm/rnn/while/Less/Enter*
T0
�
lstm/rnn/while/Less/EnterEnterlstm/rnn/strided_slice_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
[
lstm/rnn/while/Less_1Lesslstm/rnn/while/Merge_1lstm/rnn/while/Less_1/Enter*
T0
�
lstm/rnn/while/Less_1/EnterEnterlstm/rnn/Minimum*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
S
lstm/rnn/while/LogicalAnd
LogicalAndlstm/rnn/while/Lesslstm/rnn/while/Less_1
>
lstm/rnn/while/LoopCondLoopCondlstm/rnn/while/LogicalAnd
�
lstm/rnn/while/SwitchSwitchlstm/rnn/while/Mergelstm/rnn/while/LoopCond*
T0*'
_class
loc:@lstm/rnn/while/Merge
�
lstm/rnn/while/Switch_1Switchlstm/rnn/while/Merge_1lstm/rnn/while/LoopCond*
T0*)
_class
loc:@lstm/rnn/while/Merge_1
�
lstm/rnn/while/Switch_2Switchlstm/rnn/while/Merge_2lstm/rnn/while/LoopCond*
T0*)
_class
loc:@lstm/rnn/while/Merge_2
�
lstm/rnn/while/Switch_3Switchlstm/rnn/while/Merge_3lstm/rnn/while/LoopCond*
T0*)
_class
loc:@lstm/rnn/while/Merge_3
�
lstm/rnn/while/Switch_4Switchlstm/rnn/while/Merge_4lstm/rnn/while/LoopCond*
T0*)
_class
loc:@lstm/rnn/while/Merge_4
E
lstm/rnn/while/IdentityIdentitylstm/rnn/while/Switch:1*
T0
I
lstm/rnn/while/Identity_1Identitylstm/rnn/while/Switch_1:1*
T0
I
lstm/rnn/while/Identity_2Identitylstm/rnn/while/Switch_2:1*
T0
I
lstm/rnn/while/Identity_3Identitylstm/rnn/while/Switch_3:1*
T0
I
lstm/rnn/while/Identity_4Identitylstm/rnn/while/Switch_4:1*
T0
X
lstm/rnn/while/add/yConst^lstm/rnn/while/Identity*
value	B :*
dtype0
S
lstm/rnn/while/addAddV2lstm/rnn/while/Identitylstm/rnn/while/add/y*
T0
�
 lstm/rnn/while/TensorArrayReadV3TensorArrayReadV3&lstm/rnn/while/TensorArrayReadV3/Enterlstm/rnn/while/Identity_1(lstm/rnn/while/TensorArrayReadV3/Enter_1*
dtype0
�
&lstm/rnn/while/TensorArrayReadV3/EnterEnterlstm/rnn/TensorArray_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
(lstm/rnn/while/TensorArrayReadV3/Enter_1EnterClstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
@lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*
dtype0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
valueB"�     
�
>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
valueB
 *I:��*
dtype0
�
>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
valueB
 *I:�=*
dtype0
�
Hlstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniform@lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
dtype0*
seed2�*
seed�$
�
>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSub>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/max>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMulHlstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniform>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
:lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAdd>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mul>lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
lstm/rnn/basic_lstm_cell/kernel
VariableV2*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
&lstm/rnn/basic_lstm_cell/kernel/AssignAssignlstm/rnn/basic_lstm_cell/kernel:lstm/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
validate_shape(
Z
$lstm/rnn/basic_lstm_cell/kernel/readIdentitylstm/rnn/basic_lstm_cell/kernel*
T0
�
/lstm/rnn/basic_lstm_cell/bias/Initializer/zerosConst*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
valueB�*    *
dtype0
�
lstm/rnn/basic_lstm_cell/bias
VariableV2*
shared_name *0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
dtype0*
	container *
shape:�
�
$lstm/rnn/basic_lstm_cell/bias/AssignAssignlstm/rnn/basic_lstm_cell/bias/lstm/rnn/basic_lstm_cell/bias/Initializer/zeros*
validate_shape(*
use_locking(*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias
V
"lstm/rnn/basic_lstm_cell/bias/readIdentitylstm/rnn/basic_lstm_cell/bias*
T0
h
$lstm/rnn/while/basic_lstm_cell/ConstConst^lstm/rnn/while/Identity*
value	B :*
dtype0
n
*lstm/rnn/while/basic_lstm_cell/concat/axisConst^lstm/rnn/while/Identity*
value	B :*
dtype0
�
%lstm/rnn/while/basic_lstm_cell/concatConcatV2 lstm/rnn/while/TensorArrayReadV3lstm/rnn/while/Identity_4*lstm/rnn/while/basic_lstm_cell/concat/axis*
N*

Tidx0*
T0
�
%lstm/rnn/while/basic_lstm_cell/MatMulMatMul%lstm/rnn/while/basic_lstm_cell/concat+lstm/rnn/while/basic_lstm_cell/MatMul/Enter*
T0*
transpose_a( *
transpose_b( 
�
+lstm/rnn/while/basic_lstm_cell/MatMul/EnterEnter$lstm/rnn/basic_lstm_cell/kernel/read*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
&lstm/rnn/while/basic_lstm_cell/BiasAddBiasAdd%lstm/rnn/while/basic_lstm_cell/MatMul,lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC
�
,lstm/rnn/while/basic_lstm_cell/BiasAdd/EnterEnter"lstm/rnn/basic_lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
j
&lstm/rnn/while/basic_lstm_cell/Const_1Const^lstm/rnn/while/Identity*
value	B :*
dtype0
�
$lstm/rnn/while/basic_lstm_cell/splitSplit$lstm/rnn/while/basic_lstm_cell/Const&lstm/rnn/while/basic_lstm_cell/BiasAdd*
	num_split*
T0
m
&lstm/rnn/while/basic_lstm_cell/Const_2Const^lstm/rnn/while/Identity*
dtype0*
valueB
 *  �?
�
"lstm/rnn/while/basic_lstm_cell/AddAdd&lstm/rnn/while/basic_lstm_cell/split:2&lstm/rnn/while/basic_lstm_cell/Const_2*
T0
^
&lstm/rnn/while/basic_lstm_cell/SigmoidSigmoid"lstm/rnn/while/basic_lstm_cell/Add*
T0
u
"lstm/rnn/while/basic_lstm_cell/MulMullstm/rnn/while/Identity_3&lstm/rnn/while/basic_lstm_cell/Sigmoid*
T0
b
(lstm/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid$lstm/rnn/while/basic_lstm_cell/split*
T0
\
#lstm/rnn/while/basic_lstm_cell/TanhTanh&lstm/rnn/while/basic_lstm_cell/split:1*
T0
�
$lstm/rnn/while/basic_lstm_cell/Mul_1Mul(lstm/rnn/while/basic_lstm_cell/Sigmoid_1#lstm/rnn/while/basic_lstm_cell/Tanh*
T0
~
$lstm/rnn/while/basic_lstm_cell/Add_1Add"lstm/rnn/while/basic_lstm_cell/Mul$lstm/rnn/while/basic_lstm_cell/Mul_1*
T0
\
%lstm/rnn/while/basic_lstm_cell/Tanh_1Tanh$lstm/rnn/while/basic_lstm_cell/Add_1*
T0
d
(lstm/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoid&lstm/rnn/while/basic_lstm_cell/split:3*
T0
�
$lstm/rnn/while/basic_lstm_cell/Mul_2Mul%lstm/rnn/while/basic_lstm_cell/Tanh_1(lstm/rnn/while/basic_lstm_cell/Sigmoid_2*
T0
�
2lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV38lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enterlstm/rnn/while/Identity_1$lstm/rnn/while/basic_lstm_cell/Mul_2lstm/rnn/while/Identity_2*
T0*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2
�
8lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterlstm/rnn/TensorArray*
T0*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
Z
lstm/rnn/while/add_1/yConst^lstm/rnn/while/Identity*
value	B :*
dtype0
Y
lstm/rnn/while/add_1AddV2lstm/rnn/while/Identity_1lstm/rnn/while/add_1/y*
T0
J
lstm/rnn/while/NextIterationNextIterationlstm/rnn/while/add*
T0
N
lstm/rnn/while/NextIteration_1NextIterationlstm/rnn/while/add_1*
T0
l
lstm/rnn/while/NextIteration_2NextIteration2lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0
^
lstm/rnn/while/NextIteration_3NextIteration$lstm/rnn/while/basic_lstm_cell/Add_1*
T0
^
lstm/rnn/while/NextIteration_4NextIteration$lstm/rnn/while/basic_lstm_cell/Mul_2*
T0
;
lstm/rnn/while/ExitExitlstm/rnn/while/Switch*
T0
?
lstm/rnn/while/Exit_1Exitlstm/rnn/while/Switch_1*
T0
?
lstm/rnn/while/Exit_2Exitlstm/rnn/while/Switch_2*
T0
?
lstm/rnn/while/Exit_3Exitlstm/rnn/while/Switch_3*
T0
?
lstm/rnn/while/Exit_4Exitlstm/rnn/while/Switch_4*
T0
�
+lstm/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3lstm/rnn/TensorArraylstm/rnn/while/Exit_2*'
_class
loc:@lstm/rnn/TensorArray
x
%lstm/rnn/TensorArrayStack/range/startConst*'
_class
loc:@lstm/rnn/TensorArray*
value	B : *
dtype0
x
%lstm/rnn/TensorArrayStack/range/deltaConst*'
_class
loc:@lstm/rnn/TensorArray*
value	B :*
dtype0
�
lstm/rnn/TensorArrayStack/rangeRange%lstm/rnn/TensorArrayStack/range/start+lstm/rnn/TensorArrayStack/TensorArraySizeV3%lstm/rnn/TensorArrayStack/range/delta*

Tidx0*'
_class
loc:@lstm/rnn/TensorArray
�
-lstm/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3lstm/rnn/TensorArraylstm/rnn/TensorArrayStack/rangelstm/rnn/while/Exit_2*%
element_shape:����������*'
_class
loc:@lstm/rnn/TensorArray*
dtype0
?
lstm/rnn/Const_1Const*
valueB:�*
dtype0
9
lstm/rnn/Rank_1Const*
value	B :*
dtype0
@
lstm/rnn/range_1/startConst*
value	B :*
dtype0
@
lstm/rnn/range_1/deltaConst*
dtype0*
value	B :
f
lstm/rnn/range_1Rangelstm/rnn/range_1/startlstm/rnn/Rank_1lstm/rnn/range_1/delta*

Tidx0
O
lstm/rnn/concat_2/values_0Const*
valueB"       *
dtype0
@
lstm/rnn/concat_2/axisConst*
value	B : *
dtype0
�
lstm/rnn/concat_2ConcatV2lstm/rnn/concat_2/values_0lstm/rnn/range_1lstm/rnn/concat_2/axis*

Tidx0*
T0*
N
y
lstm/rnn/transpose_1	Transpose-lstm/rnn/TensorArrayStack/TensorArrayGatherV3lstm/rnn/concat_2*
T0*
Tperm0
D
Reshape_2/shapeConst*
dtype0*
valueB"�����   
R
	Reshape_2Reshapelstm/rnn/transpose_1Reshape_2/shape*
T0*
Tshape0
7
concat_2/axisConst*
dtype0*
value	B :
o
concat_2ConcatV2lstm/rnn/while/Exit_3lstm/rnn/while/Exit_4concat_2/axis*

Tidx0*
T0*
N
,
recurrent_outIdentityconcat_2*
T0
�
/dense/kernel/Initializer/truncated_normal/shapeConst*
_class
loc:@dense/kernel*
valueB"�      *
dtype0
|
.dense/kernel/Initializer/truncated_normal/meanConst*
_class
loc:@dense/kernel*
valueB
 *    *
dtype0
~
0dense/kernel/Initializer/truncated_normal/stddevConst*
_class
loc:@dense/kernel*
valueB
 *�$<*
dtype0
�
9dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal/dense/kernel/Initializer/truncated_normal/shape*
T0*
_class
loc:@dense/kernel*
dtype0*
seed2�*
seed�$
�
-dense/kernel/Initializer/truncated_normal/mulMul9dense/kernel/Initializer/truncated_normal/TruncatedNormal0dense/kernel/Initializer/truncated_normal/stddev*
T0*
_class
loc:@dense/kernel
�
)dense/kernel/Initializer/truncated_normalAdd-dense/kernel/Initializer/truncated_normal/mul.dense/kernel/Initializer/truncated_normal/mean*
T0*
_class
loc:@dense/kernel
�
dense/kernel
VariableV2*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container *
shape:	�
�
dense/kernel/AssignAssigndense/kernel)dense/kernel/Initializer/truncated_normal*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
U
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel
c
dense/MatMulMatMul	Reshape_2dense/kernel/read*
transpose_a( *
transpose_b( *
T0
�
1dense_1/kernel/Initializer/truncated_normal/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"�      *
dtype0
�
0dense_1/kernel/Initializer/truncated_normal/meanConst*
dtype0*!
_class
loc:@dense_1/kernel*
valueB
 *    
�
2dense_1/kernel/Initializer/truncated_normal/stddevConst*!
_class
loc:@dense_1/kernel*
valueB
 *�$<*
dtype0
�
;dense_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal1dense_1/kernel/Initializer/truncated_normal/shape*
dtype0*
seed2�*
seed�$*
T0*!
_class
loc:@dense_1/kernel
�
/dense_1/kernel/Initializer/truncated_normal/mulMul;dense_1/kernel/Initializer/truncated_normal/TruncatedNormal2dense_1/kernel/Initializer/truncated_normal/stddev*
T0*!
_class
loc:@dense_1/kernel
�
+dense_1/kernel/Initializer/truncated_normalAdd/dense_1/kernel/Initializer/truncated_normal/mul0dense_1/kernel/Initializer/truncated_normal/mean*
T0*!
_class
loc:@dense_1/kernel
�
dense_1/kernel
VariableV2*
shape:	�*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
�
dense_1/kernel/AssignAssigndense_1/kernel+dense_1/kernel/Initializer/truncated_normal*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_1/kernel
[
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel
g
dense_1/MatMulMatMul	Reshape_2dense_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
1dense_2/kernel/Initializer/truncated_normal/shapeConst*!
_class
loc:@dense_2/kernel*
valueB"�      *
dtype0
�
0dense_2/kernel/Initializer/truncated_normal/meanConst*!
_class
loc:@dense_2/kernel*
valueB
 *    *
dtype0
�
2dense_2/kernel/Initializer/truncated_normal/stddevConst*!
_class
loc:@dense_2/kernel*
valueB
 *�$<*
dtype0
�
;dense_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal1dense_2/kernel/Initializer/truncated_normal/shape*
seed�$*
T0*!
_class
loc:@dense_2/kernel*
dtype0*
seed2�
�
/dense_2/kernel/Initializer/truncated_normal/mulMul;dense_2/kernel/Initializer/truncated_normal/TruncatedNormal2dense_2/kernel/Initializer/truncated_normal/stddev*
T0*!
_class
loc:@dense_2/kernel
�
+dense_2/kernel/Initializer/truncated_normalAdd/dense_2/kernel/Initializer/truncated_normal/mul0dense_2/kernel/Initializer/truncated_normal/mean*
T0*!
_class
loc:@dense_2/kernel
�
dense_2/kernel
VariableV2*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container *
shape:	�
�
dense_2/kernel/AssignAssigndense_2/kernel+dense_2/kernel/Initializer/truncated_normal*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(*
use_locking(
[
dense_2/kernel/readIdentitydense_2/kernel*
T0*!
_class
loc:@dense_2/kernel
g
dense_2/MatMulMatMul	Reshape_2dense_2/kernel/read*
T0*
transpose_a( *
transpose_b( 
;
action_probs/axisConst*
value	B :*
dtype0
w
action_probsConcatV2dense/MatMuldense_1/MatMuldense_2/MatMulaction_probs/axis*

Tidx0*
T0*
N
F
action_masksPlaceholder*
shape:���������	*
dtype0
J
strided_slice_5/stackConst*
dtype0*
valueB"        
L
strided_slice_5/stack_1Const*
dtype0*
valueB"       
L
strided_slice_5/stack_2Const*
valueB"      *
dtype0
�
strided_slice_5StridedSliceaction_probsstrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
J
strided_slice_6/stackConst*
valueB"       *
dtype0
L
strided_slice_6/stack_1Const*
valueB"       *
dtype0
L
strided_slice_6/stack_2Const*
dtype0*
valueB"      
�
strided_slice_6StridedSliceaction_probsstrided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
J
strided_slice_7/stackConst*
valueB"       *
dtype0
L
strided_slice_7/stack_1Const*
dtype0*
valueB"    	   
L
strided_slice_7/stack_2Const*
dtype0*
valueB"      
�
strided_slice_7StridedSliceaction_probsstrided_slice_7/stackstrided_slice_7/stack_1strided_slice_7/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
J
strided_slice_8/stackConst*
dtype0*
valueB"        
L
strided_slice_8/stack_1Const*
dtype0*
valueB"       
L
strided_slice_8/stack_2Const*
dtype0*
valueB"      
�
strided_slice_8StridedSliceaction_masksstrided_slice_8/stackstrided_slice_8/stack_1strided_slice_8/stack_2*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
J
strided_slice_9/stackConst*
valueB"       *
dtype0
L
strided_slice_9/stack_1Const*
valueB"       *
dtype0
L
strided_slice_9/stack_2Const*
valueB"      *
dtype0
�
strided_slice_9StridedSliceaction_masksstrided_slice_9/stackstrided_slice_9/stack_1strided_slice_9/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
K
strided_slice_10/stackConst*
valueB"       *
dtype0
M
strided_slice_10/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_10/stack_2Const*
valueB"      *
dtype0
�
strided_slice_10StridedSliceaction_masksstrided_slice_10/stackstrided_slice_10/stack_1strided_slice_10/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
,
SoftmaxSoftmaxstrided_slice_5*
T0
4
add_5/yConst*
dtype0*
valueB
 *���3
)
add_5AddV2Softmaxadd_5/y*
T0
-
Mul_1Muladd_5strided_slice_8*
T0
.
	Softmax_1Softmaxstrided_slice_6*
T0
4
add_6/yConst*
valueB
 *���3*
dtype0
+
add_6AddV2	Softmax_1add_6/y*
T0
-
Mul_2Muladd_6strided_slice_9*
T0
.
	Softmax_2Softmaxstrided_slice_7*
T0
4
add_7/yConst*
dtype0*
valueB
 *���3
+
add_7AddV2	Softmax_2add_7/y*
T0
.
Mul_3Muladd_7strided_slice_10*
T0
A
Sum_2/reduction_indicesConst*
dtype0*
value	B :
R
Sum_2SumMul_1Sum_2/reduction_indices*
T0*

Tidx0*
	keep_dims(
+
	truediv_3RealDivMul_1Sum_2*
T0
A
Sum_3/reduction_indicesConst*
value	B :*
dtype0
R
Sum_3SumMul_2Sum_3/reduction_indices*

Tidx0*
	keep_dims(*
T0
+
	truediv_4RealDivMul_2Sum_3*
T0
A
Sum_4/reduction_indicesConst*
value	B :*
dtype0
R
Sum_4SumMul_3Sum_4/reduction_indices*
T0*

Tidx0*
	keep_dims(
+
	truediv_5RealDivMul_3Sum_4*
T0
4
add_8/yConst*
dtype0*
valueB
 *���3
+
add_8AddV2	truediv_3add_8/y*
T0

LogLogadd_8*
T0
M
#multinomial/Multinomial/num_samplesConst*
dtype0*
value	B :
�
multinomial/MultinomialMultinomialLog#multinomial/Multinomial/num_samples*
T0*
seed2�*
seed�$*
output_dtype0	
4
add_9/yConst*
valueB
 *���3*
dtype0
+
add_9AddV2	truediv_4add_9/y*
T0

Log_1Logadd_9*
T0
O
%multinomial_1/Multinomial/num_samplesConst*
value	B :*
dtype0
�
multinomial_1/MultinomialMultinomialLog_1%multinomial_1/Multinomial/num_samples*
seed�$*
output_dtype0	*
T0*
seed2�
5
add_10/yConst*
valueB
 *���3*
dtype0
-
add_10AddV2	truediv_5add_10/y*
T0

Log_2Logadd_10*
T0
O
%multinomial_2/Multinomial/num_samplesConst*
value	B :*
dtype0
�
multinomial_2/MultinomialMultinomialLog_2%multinomial_2/Multinomial/num_samples*
T0*
seed2�*
seed�$*
output_dtype0	
7
concat_3/axisConst*
value	B :*
dtype0
�
concat_3ConcatV2multinomial/Multinomialmultinomial_1/Multinomialmultinomial_2/Multinomialconcat_3/axis*

Tidx0*
T0	*
N
7
concat_4/axisConst*
value	B :*
dtype0
b
concat_4ConcatV2	truediv_3	truediv_4	truediv_5concat_4/axis*
T0*
N*

Tidx0
5
add_11/yConst*
valueB
 *���3*
dtype0
-
add_11AddV2	truediv_3add_11/y*
T0

Log_3Logadd_11*
T0
5
add_12/yConst*
valueB
 *���3*
dtype0
-
add_12AddV2	truediv_4add_12/y*
T0

Log_4Logadd_12*
T0
5
add_13/yConst*
dtype0*
valueB
 *���3
-
add_13AddV2	truediv_5add_13/y*
T0

Log_5Logadd_13*
T0
7
concat_5/axisConst*
value	B :*
dtype0
V
concat_5ConcatV2Log_3Log_4Log_5concat_5/axis*
T0*
N*

Tidx0
'
IdentityIdentityconcat_3*
T0	
%
actionIdentityconcat_5*
T0
�
7extrinsic_value/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@extrinsic_value/kernel*
valueB"�      *
dtype0
�
5extrinsic_value/kernel/Initializer/random_uniform/minConst*)
_class
loc:@extrinsic_value/kernel*
valueB
 *n�\�*
dtype0
�
5extrinsic_value/kernel/Initializer/random_uniform/maxConst*
dtype0*)
_class
loc:@extrinsic_value/kernel*
valueB
 *n�\>
�
?extrinsic_value/kernel/Initializer/random_uniform/RandomUniformRandomUniform7extrinsic_value/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@extrinsic_value/kernel*
dtype0*
seed2�*
seed�$
�
5extrinsic_value/kernel/Initializer/random_uniform/subSub5extrinsic_value/kernel/Initializer/random_uniform/max5extrinsic_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@extrinsic_value/kernel
�
5extrinsic_value/kernel/Initializer/random_uniform/mulMul?extrinsic_value/kernel/Initializer/random_uniform/RandomUniform5extrinsic_value/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@extrinsic_value/kernel
�
1extrinsic_value/kernel/Initializer/random_uniformAdd5extrinsic_value/kernel/Initializer/random_uniform/mul5extrinsic_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@extrinsic_value/kernel
�
extrinsic_value/kernel
VariableV2*
shape:	�*
shared_name *)
_class
loc:@extrinsic_value/kernel*
dtype0*
	container 
�
extrinsic_value/kernel/AssignAssignextrinsic_value/kernel1extrinsic_value/kernel/Initializer/random_uniform*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
s
extrinsic_value/kernel/readIdentityextrinsic_value/kernel*
T0*)
_class
loc:@extrinsic_value/kernel
�
&extrinsic_value/bias/Initializer/zerosConst*'
_class
loc:@extrinsic_value/bias*
valueB*    *
dtype0
�
extrinsic_value/bias
VariableV2*
shape:*
shared_name *'
_class
loc:@extrinsic_value/bias*
dtype0*
	container 
�
extrinsic_value/bias/AssignAssignextrinsic_value/bias&extrinsic_value/bias/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
m
extrinsic_value/bias/readIdentityextrinsic_value/bias*
T0*'
_class
loc:@extrinsic_value/bias
w
extrinsic_value/MatMulMatMul	Reshape_2extrinsic_value/kernel/read*
transpose_a( *
transpose_b( *
T0
u
extrinsic_value/BiasAddBiasAddextrinsic_value/MatMulextrinsic_value/bias/read*
T0*
data_formatNHWC
�
7curiosity_value/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@curiosity_value/kernel*
valueB"�      *
dtype0
�
5curiosity_value/kernel/Initializer/random_uniform/minConst*
dtype0*)
_class
loc:@curiosity_value/kernel*
valueB
 *n�\�
�
5curiosity_value/kernel/Initializer/random_uniform/maxConst*
dtype0*)
_class
loc:@curiosity_value/kernel*
valueB
 *n�\>
�
?curiosity_value/kernel/Initializer/random_uniform/RandomUniformRandomUniform7curiosity_value/kernel/Initializer/random_uniform/shape*
seed�$*
T0*)
_class
loc:@curiosity_value/kernel*
dtype0*
seed2�
�
5curiosity_value/kernel/Initializer/random_uniform/subSub5curiosity_value/kernel/Initializer/random_uniform/max5curiosity_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@curiosity_value/kernel
�
5curiosity_value/kernel/Initializer/random_uniform/mulMul?curiosity_value/kernel/Initializer/random_uniform/RandomUniform5curiosity_value/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@curiosity_value/kernel
�
1curiosity_value/kernel/Initializer/random_uniformAdd5curiosity_value/kernel/Initializer/random_uniform/mul5curiosity_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@curiosity_value/kernel
�
curiosity_value/kernel
VariableV2*)
_class
loc:@curiosity_value/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
curiosity_value/kernel/AssignAssigncuriosity_value/kernel1curiosity_value/kernel/Initializer/random_uniform*
validate_shape(*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel
s
curiosity_value/kernel/readIdentitycuriosity_value/kernel*
T0*)
_class
loc:@curiosity_value/kernel
�
&curiosity_value/bias/Initializer/zerosConst*'
_class
loc:@curiosity_value/bias*
valueB*    *
dtype0
�
curiosity_value/bias
VariableV2*'
_class
loc:@curiosity_value/bias*
dtype0*
	container *
shape:*
shared_name 
�
curiosity_value/bias/AssignAssigncuriosity_value/bias&curiosity_value/bias/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
m
curiosity_value/bias/readIdentitycuriosity_value/bias*
T0*'
_class
loc:@curiosity_value/bias
w
curiosity_value/MatMulMatMul	Reshape_2curiosity_value/kernel/read*
transpose_a( *
transpose_b( *
T0
u
curiosity_value/BiasAddBiasAddcuriosity_value/MatMulcuriosity_value/bias/read*
T0*
data_formatNHWC
b

Mean/inputPackextrinsic_value/BiasAddcuriosity_value/BiasAdd*
T0*

axis *
N
@
Mean/reduction_indicesConst*
value	B : *
dtype0
V
MeanMean
Mean/inputMean/reduction_indices*
T0*

Tidx0*
	keep_dims( 
G
action_holderPlaceholder*
dtype0*
shape:���������
K
strided_slice_11/stackConst*
dtype0*
valueB"        
M
strided_slice_11/stack_1Const*
valueB"       *
dtype0
M
strided_slice_11/stack_2Const*
valueB"      *
dtype0
�
strided_slice_11StridedSliceaction_holderstrided_slice_11/stackstrided_slice_11/stack_1strided_slice_11/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask
?
one_hot_3/on_valueConst*
valueB
 *  �?*
dtype0
@
one_hot_3/off_valueConst*
dtype0*
valueB
 *    
9
one_hot_3/depthConst*
value	B :*
dtype0
�
	one_hot_3OneHotstrided_slice_11one_hot_3/depthone_hot_3/on_valueone_hot_3/off_value*
T0*
TI0*
axis���������
K
strided_slice_12/stackConst*
valueB"       *
dtype0
M
strided_slice_12/stack_1Const*
dtype0*
valueB"       
M
strided_slice_12/stack_2Const*
valueB"      *
dtype0
�
strided_slice_12StridedSliceaction_holderstrided_slice_12/stackstrided_slice_12/stack_1strided_slice_12/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
?
one_hot_4/on_valueConst*
valueB
 *  �?*
dtype0
@
one_hot_4/off_valueConst*
valueB
 *    *
dtype0
9
one_hot_4/depthConst*
value	B :*
dtype0
�
	one_hot_4OneHotstrided_slice_12one_hot_4/depthone_hot_4/on_valueone_hot_4/off_value*
T0*
TI0*
axis���������
K
strided_slice_13/stackConst*
dtype0*
valueB"       
M
strided_slice_13/stack_1Const*
valueB"       *
dtype0
M
strided_slice_13/stack_2Const*
valueB"      *
dtype0
�
strided_slice_13StridedSliceaction_holderstrided_slice_13/stackstrided_slice_13/stack_1strided_slice_13/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
?
one_hot_5/on_valueConst*
dtype0*
valueB
 *  �?
@
one_hot_5/off_valueConst*
valueB
 *    *
dtype0
9
one_hot_5/depthConst*
dtype0*
value	B :
�
	one_hot_5OneHotstrided_slice_13one_hot_5/depthone_hot_5/on_valueone_hot_5/off_value*
T0*
TI0*
axis���������
7
concat_6/axisConst*
value	B :*
dtype0
b
concat_6ConcatV2	one_hot_3	one_hot_4	one_hot_5concat_6/axis*
T0*
N*

Tidx0
/
StopGradientStopGradientconcat_6*
T0
K
old_probabilitiesPlaceholder*
dtype0*
shape:���������	
K
strided_slice_14/stackConst*
valueB"        *
dtype0
M
strided_slice_14/stack_1Const*
valueB"       *
dtype0
M
strided_slice_14/stack_2Const*
dtype0*
valueB"      
�
strided_slice_14StridedSliceold_probabilitiesstrided_slice_14/stackstrided_slice_14/stack_1strided_slice_14/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
K
strided_slice_15/stackConst*
valueB"       *
dtype0
M
strided_slice_15/stack_1Const*
valueB"       *
dtype0
M
strided_slice_15/stack_2Const*
valueB"      *
dtype0
�
strided_slice_15StridedSliceold_probabilitiesstrided_slice_15/stackstrided_slice_15/stack_1strided_slice_15/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
K
strided_slice_16/stackConst*
dtype0*
valueB"       
M
strided_slice_16/stack_1Const*
dtype0*
valueB"    	   
M
strided_slice_16/stack_2Const*
valueB"      *
dtype0
�
strided_slice_16StridedSliceold_probabilitiesstrided_slice_16/stackstrided_slice_16/stack_1strided_slice_16/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
K
strided_slice_17/stackConst*
valueB"        *
dtype0
M
strided_slice_17/stack_1Const*
valueB"       *
dtype0
M
strided_slice_17/stack_2Const*
valueB"      *
dtype0
�
strided_slice_17StridedSliceaction_masksstrided_slice_17/stackstrided_slice_17/stack_1strided_slice_17/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
K
strided_slice_18/stackConst*
valueB"       *
dtype0
M
strided_slice_18/stack_1Const*
dtype0*
valueB"       
M
strided_slice_18/stack_2Const*
dtype0*
valueB"      
�
strided_slice_18StridedSliceaction_masksstrided_slice_18/stackstrided_slice_18/stack_1strided_slice_18/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
K
strided_slice_19/stackConst*
valueB"       *
dtype0
M
strided_slice_19/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_19/stack_2Const*
valueB"      *
dtype0
�
strided_slice_19StridedSliceaction_masksstrided_slice_19/stackstrided_slice_19/stack_1strided_slice_19/stack_2*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
/
	Softmax_3Softmaxstrided_slice_14*
T0
5
add_14/yConst*
dtype0*
valueB
 *���3
-
add_14AddV2	Softmax_3add_14/y*
T0
/
Mul_4Muladd_14strided_slice_17*
T0
/
	Softmax_4Softmaxstrided_slice_15*
T0
5
add_15/yConst*
valueB
 *���3*
dtype0
-
add_15AddV2	Softmax_4add_15/y*
T0
/
Mul_5Muladd_15strided_slice_18*
T0
/
	Softmax_5Softmaxstrided_slice_16*
T0
5
add_16/yConst*
valueB
 *���3*
dtype0
-
add_16AddV2	Softmax_5add_16/y*
T0
/
Mul_6Muladd_16strided_slice_19*
T0
A
Sum_5/reduction_indicesConst*
value	B :*
dtype0
R
Sum_5SumMul_4Sum_5/reduction_indices*
T0*

Tidx0*
	keep_dims(
+
	truediv_6RealDivMul_4Sum_5*
T0
A
Sum_6/reduction_indicesConst*
value	B :*
dtype0
R
Sum_6SumMul_5Sum_6/reduction_indices*
T0*

Tidx0*
	keep_dims(
+
	truediv_7RealDivMul_5Sum_6*
T0
A
Sum_7/reduction_indicesConst*
value	B :*
dtype0
R
Sum_7SumMul_6Sum_7/reduction_indices*
T0*

Tidx0*
	keep_dims(
+
	truediv_8RealDivMul_6Sum_7*
T0
5
add_17/yConst*
valueB
 *���3*
dtype0
-
add_17AddV2	truediv_6add_17/y*
T0

Log_6Logadd_17*
T0
O
%multinomial_3/Multinomial/num_samplesConst*
value	B :*
dtype0
�
multinomial_3/MultinomialMultinomialLog_6%multinomial_3/Multinomial/num_samples*
T0*
seed2�*
seed�$*
output_dtype0	
5
add_18/yConst*
dtype0*
valueB
 *���3
-
add_18AddV2	truediv_7add_18/y*
T0

Log_7Logadd_18*
T0
O
%multinomial_4/Multinomial/num_samplesConst*
value	B :*
dtype0
�
multinomial_4/MultinomialMultinomialLog_7%multinomial_4/Multinomial/num_samples*
seed2�*
seed�$*
output_dtype0	*
T0
5
add_19/yConst*
valueB
 *���3*
dtype0
-
add_19AddV2	truediv_8add_19/y*
T0

Log_8Logadd_19*
T0
O
%multinomial_5/Multinomial/num_samplesConst*
value	B :*
dtype0
�
multinomial_5/MultinomialMultinomialLog_8%multinomial_5/Multinomial/num_samples*
T0*
seed2�*
seed�$*
output_dtype0	
7
concat_7/axisConst*
value	B :*
dtype0
�
concat_7ConcatV2multinomial_3/Multinomialmultinomial_4/Multinomialmultinomial_5/Multinomialconcat_7/axis*
T0	*
N*

Tidx0
7
concat_8/axisConst*
value	B :*
dtype0
b
concat_8ConcatV2	truediv_6	truediv_7	truediv_8concat_8/axis*
T0*
N*

Tidx0
5
add_20/yConst*
dtype0*
valueB
 *���3
-
add_20AddV2	truediv_6add_20/y*
T0

Log_9Logadd_20*
T0
5
add_21/yConst*
valueB
 *���3*
dtype0
-
add_21AddV2	truediv_7add_21/y*
T0

Log_10Logadd_21*
T0
5
add_22/yConst*
valueB
 *���3*
dtype0
-
add_22AddV2	truediv_8add_22/y*
T0

Log_11Logadd_22*
T0
7
concat_9/axisConst*
dtype0*
value	B :
X
concat_9ConcatV2Log_9Log_10Log_11concat_9/axis*
N*

Tidx0*
T0
K
strided_slice_20/stackConst*
valueB"        *
dtype0
M
strided_slice_20/stack_1Const*
valueB"       *
dtype0
M
strided_slice_20/stack_2Const*
valueB"      *
dtype0
�
strided_slice_20StridedSliceaction_probsstrided_slice_20/stackstrided_slice_20/stack_1strided_slice_20/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
/
	Softmax_6Softmaxstrided_slice_20*
T0
K
strided_slice_21/stackConst*
valueB"        *
dtype0
M
strided_slice_21/stack_1Const*
valueB"       *
dtype0
M
strided_slice_21/stack_2Const*
dtype0*
valueB"      
�
strided_slice_21StridedSliceaction_probsstrided_slice_21/stackstrided_slice_21/stack_1strided_slice_21/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*
Index0*
T0
P
&softmax_cross_entropy_with_logits/RankConst*
value	B :*
dtype0
[
'softmax_cross_entropy_with_logits/ShapeShapestrided_slice_21*
T0*
out_type0
R
(softmax_cross_entropy_with_logits/Rank_1Const*
dtype0*
value	B :
]
)softmax_cross_entropy_with_logits/Shape_1Shapestrided_slice_21*
T0*
out_type0
Q
'softmax_cross_entropy_with_logits/Sub/yConst*
value	B :*
dtype0
�
%softmax_cross_entropy_with_logits/SubSub(softmax_cross_entropy_with_logits/Rank_1'softmax_cross_entropy_with_logits/Sub/y*
T0
z
-softmax_cross_entropy_with_logits/Slice/beginPack%softmax_cross_entropy_with_logits/Sub*
N*
T0*

axis 
Z
,softmax_cross_entropy_with_logits/Slice/sizeConst*
valueB:*
dtype0
�
'softmax_cross_entropy_with_logits/SliceSlice)softmax_cross_entropy_with_logits/Shape_1-softmax_cross_entropy_with_logits/Slice/begin,softmax_cross_entropy_with_logits/Slice/size*
T0*
Index0
h
1softmax_cross_entropy_with_logits/concat/values_0Const*
valueB:
���������*
dtype0
W
-softmax_cross_entropy_with_logits/concat/axisConst*
value	B : *
dtype0
�
(softmax_cross_entropy_with_logits/concatConcatV21softmax_cross_entropy_with_logits/concat/values_0'softmax_cross_entropy_with_logits/Slice-softmax_cross_entropy_with_logits/concat/axis*

Tidx0*
T0*
N
�
)softmax_cross_entropy_with_logits/ReshapeReshapestrided_slice_21(softmax_cross_entropy_with_logits/concat*
T0*
Tshape0
R
(softmax_cross_entropy_with_logits/Rank_2Const*
value	B :*
dtype0
V
)softmax_cross_entropy_with_logits/Shape_2Shape	Softmax_6*
T0*
out_type0
S
)softmax_cross_entropy_with_logits/Sub_1/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits/Sub_1Sub(softmax_cross_entropy_with_logits/Rank_2)softmax_cross_entropy_with_logits/Sub_1/y*
T0
~
/softmax_cross_entropy_with_logits/Slice_1/beginPack'softmax_cross_entropy_with_logits/Sub_1*
N*
T0*

axis 
\
.softmax_cross_entropy_with_logits/Slice_1/sizeConst*
dtype0*
valueB:
�
)softmax_cross_entropy_with_logits/Slice_1Slice)softmax_cross_entropy_with_logits/Shape_2/softmax_cross_entropy_with_logits/Slice_1/begin.softmax_cross_entropy_with_logits/Slice_1/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits/concat_1/values_0Const*
dtype0*
valueB:
���������
Y
/softmax_cross_entropy_with_logits/concat_1/axisConst*
value	B : *
dtype0
�
*softmax_cross_entropy_with_logits/concat_1ConcatV23softmax_cross_entropy_with_logits/concat_1/values_0)softmax_cross_entropy_with_logits/Slice_1/softmax_cross_entropy_with_logits/concat_1/axis*

Tidx0*
T0*
N
�
+softmax_cross_entropy_with_logits/Reshape_1Reshape	Softmax_6*softmax_cross_entropy_with_logits/concat_1*
T0*
Tshape0
�
!softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits)softmax_cross_entropy_with_logits/Reshape+softmax_cross_entropy_with_logits/Reshape_1*
T0
S
)softmax_cross_entropy_with_logits/Sub_2/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits/Sub_2Sub&softmax_cross_entropy_with_logits/Rank)softmax_cross_entropy_with_logits/Sub_2/y*
T0
]
/softmax_cross_entropy_with_logits/Slice_2/beginConst*
valueB: *
dtype0
}
.softmax_cross_entropy_with_logits/Slice_2/sizePack'softmax_cross_entropy_with_logits/Sub_2*
N*
T0*

axis 
�
)softmax_cross_entropy_with_logits/Slice_2Slice'softmax_cross_entropy_with_logits/Shape/softmax_cross_entropy_with_logits/Slice_2/begin.softmax_cross_entropy_with_logits/Slice_2/size*
T0*
Index0
�
+softmax_cross_entropy_with_logits/Reshape_2Reshape!softmax_cross_entropy_with_logits)softmax_cross_entropy_with_logits/Slice_2*
T0*
Tshape0
K
strided_slice_22/stackConst*
valueB"       *
dtype0
M
strided_slice_22/stack_1Const*
valueB"       *
dtype0
M
strided_slice_22/stack_2Const*
dtype0*
valueB"      
�
strided_slice_22StridedSliceaction_probsstrided_slice_22/stackstrided_slice_22/stack_1strided_slice_22/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
/
	Softmax_7Softmaxstrided_slice_22*
T0
K
strided_slice_23/stackConst*
dtype0*
valueB"       
M
strided_slice_23/stack_1Const*
dtype0*
valueB"       
M
strided_slice_23/stack_2Const*
valueB"      *
dtype0
�
strided_slice_23StridedSliceaction_probsstrided_slice_23/stackstrided_slice_23/stack_1strided_slice_23/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
R
(softmax_cross_entropy_with_logits_1/RankConst*
dtype0*
value	B :
]
)softmax_cross_entropy_with_logits_1/ShapeShapestrided_slice_23*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_1/Rank_1Const*
dtype0*
value	B :
_
+softmax_cross_entropy_with_logits_1/Shape_1Shapestrided_slice_23*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_1/Sub/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits_1/SubSub*softmax_cross_entropy_with_logits_1/Rank_1)softmax_cross_entropy_with_logits_1/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_1/Slice/beginPack'softmax_cross_entropy_with_logits_1/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_1/Slice/sizeConst*
valueB:*
dtype0
�
)softmax_cross_entropy_with_logits_1/SliceSlice+softmax_cross_entropy_with_logits_1/Shape_1/softmax_cross_entropy_with_logits_1/Slice/begin.softmax_cross_entropy_with_logits_1/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_1/concat/values_0Const*
dtype0*
valueB:
���������
Y
/softmax_cross_entropy_with_logits_1/concat/axisConst*
dtype0*
value	B : 
�
*softmax_cross_entropy_with_logits_1/concatConcatV23softmax_cross_entropy_with_logits_1/concat/values_0)softmax_cross_entropy_with_logits_1/Slice/softmax_cross_entropy_with_logits_1/concat/axis*
T0*
N*

Tidx0
�
+softmax_cross_entropy_with_logits_1/ReshapeReshapestrided_slice_23*softmax_cross_entropy_with_logits_1/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_1/Rank_2Const*
value	B :*
dtype0
X
+softmax_cross_entropy_with_logits_1/Shape_2Shape	Softmax_7*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_1/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_1/Sub_1Sub*softmax_cross_entropy_with_logits_1/Rank_2+softmax_cross_entropy_with_logits_1/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_1/Slice_1/beginPack)softmax_cross_entropy_with_logits_1/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_1/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_1/Slice_1Slice+softmax_cross_entropy_with_logits_1/Shape_21softmax_cross_entropy_with_logits_1/Slice_1/begin0softmax_cross_entropy_with_logits_1/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_1/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_1/concat_1/axisConst*
value	B : *
dtype0
�
,softmax_cross_entropy_with_logits_1/concat_1ConcatV25softmax_cross_entropy_with_logits_1/concat_1/values_0+softmax_cross_entropy_with_logits_1/Slice_11softmax_cross_entropy_with_logits_1/concat_1/axis*
N*

Tidx0*
T0
�
-softmax_cross_entropy_with_logits_1/Reshape_1Reshape	Softmax_7,softmax_cross_entropy_with_logits_1/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_1SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_1/Reshape-softmax_cross_entropy_with_logits_1/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_1/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_1/Sub_2Sub(softmax_cross_entropy_with_logits_1/Rank+softmax_cross_entropy_with_logits_1/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_1/Slice_2/beginConst*
valueB: *
dtype0
�
0softmax_cross_entropy_with_logits_1/Slice_2/sizePack)softmax_cross_entropy_with_logits_1/Sub_2*
N*
T0*

axis 
�
+softmax_cross_entropy_with_logits_1/Slice_2Slice)softmax_cross_entropy_with_logits_1/Shape1softmax_cross_entropy_with_logits_1/Slice_2/begin0softmax_cross_entropy_with_logits_1/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_1/Reshape_2Reshape#softmax_cross_entropy_with_logits_1+softmax_cross_entropy_with_logits_1/Slice_2*
T0*
Tshape0
K
strided_slice_24/stackConst*
dtype0*
valueB"       
M
strided_slice_24/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_24/stack_2Const*
dtype0*
valueB"      
�
strided_slice_24StridedSliceaction_probsstrided_slice_24/stackstrided_slice_24/stack_1strided_slice_24/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
/
	Softmax_8Softmaxstrided_slice_24*
T0
K
strided_slice_25/stackConst*
valueB"       *
dtype0
M
strided_slice_25/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_25/stack_2Const*
valueB"      *
dtype0
�
strided_slice_25StridedSliceaction_probsstrided_slice_25/stackstrided_slice_25/stack_1strided_slice_25/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
R
(softmax_cross_entropy_with_logits_2/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_2/ShapeShapestrided_slice_25*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_2/Rank_1Const*
dtype0*
value	B :
_
+softmax_cross_entropy_with_logits_2/Shape_1Shapestrided_slice_25*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_2/Sub/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits_2/SubSub*softmax_cross_entropy_with_logits_2/Rank_1)softmax_cross_entropy_with_logits_2/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_2/Slice/beginPack'softmax_cross_entropy_with_logits_2/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_2/Slice/sizeConst*
valueB:*
dtype0
�
)softmax_cross_entropy_with_logits_2/SliceSlice+softmax_cross_entropy_with_logits_2/Shape_1/softmax_cross_entropy_with_logits_2/Slice/begin.softmax_cross_entropy_with_logits_2/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_2/concat/values_0Const*
dtype0*
valueB:
���������
Y
/softmax_cross_entropy_with_logits_2/concat/axisConst*
value	B : *
dtype0
�
*softmax_cross_entropy_with_logits_2/concatConcatV23softmax_cross_entropy_with_logits_2/concat/values_0)softmax_cross_entropy_with_logits_2/Slice/softmax_cross_entropy_with_logits_2/concat/axis*
N*

Tidx0*
T0
�
+softmax_cross_entropy_with_logits_2/ReshapeReshapestrided_slice_25*softmax_cross_entropy_with_logits_2/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_2/Rank_2Const*
value	B :*
dtype0
X
+softmax_cross_entropy_with_logits_2/Shape_2Shape	Softmax_8*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_2/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_2/Sub_1Sub*softmax_cross_entropy_with_logits_2/Rank_2+softmax_cross_entropy_with_logits_2/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_2/Slice_1/beginPack)softmax_cross_entropy_with_logits_2/Sub_1*
N*
T0*

axis 
^
0softmax_cross_entropy_with_logits_2/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_2/Slice_1Slice+softmax_cross_entropy_with_logits_2/Shape_21softmax_cross_entropy_with_logits_2/Slice_1/begin0softmax_cross_entropy_with_logits_2/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_2/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_2/concat_1/axisConst*
dtype0*
value	B : 
�
,softmax_cross_entropy_with_logits_2/concat_1ConcatV25softmax_cross_entropy_with_logits_2/concat_1/values_0+softmax_cross_entropy_with_logits_2/Slice_11softmax_cross_entropy_with_logits_2/concat_1/axis*

Tidx0*
T0*
N
�
-softmax_cross_entropy_with_logits_2/Reshape_1Reshape	Softmax_8,softmax_cross_entropy_with_logits_2/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_2SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_2/Reshape-softmax_cross_entropy_with_logits_2/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_2/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_2/Sub_2Sub(softmax_cross_entropy_with_logits_2/Rank+softmax_cross_entropy_with_logits_2/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_2/Slice_2/beginConst*
dtype0*
valueB: 
�
0softmax_cross_entropy_with_logits_2/Slice_2/sizePack)softmax_cross_entropy_with_logits_2/Sub_2*
N*
T0*

axis 
�
+softmax_cross_entropy_with_logits_2/Slice_2Slice)softmax_cross_entropy_with_logits_2/Shape1softmax_cross_entropy_with_logits_2/Slice_2/begin0softmax_cross_entropy_with_logits_2/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_2/Reshape_2Reshape#softmax_cross_entropy_with_logits_2+softmax_cross_entropy_with_logits_2/Slice_2*
T0*
Tshape0
�
stackPack+softmax_cross_entropy_with_logits/Reshape_2-softmax_cross_entropy_with_logits_1/Reshape_2-softmax_cross_entropy_with_logits_2/Reshape_2*
N*
T0*

axis
A
Sum_8/reduction_indicesConst*
dtype0*
value	B :
R
Sum_8SumstackSum_8/reduction_indices*

Tidx0*
	keep_dims( *
T0
K
strided_slice_26/stackConst*
valueB"        *
dtype0
M
strided_slice_26/stack_1Const*
valueB"       *
dtype0
M
strided_slice_26/stack_2Const*
valueB"      *
dtype0
�
strided_slice_26StridedSliceconcat_6strided_slice_26/stackstrided_slice_26/stack_1strided_slice_26/stack_2*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
K
strided_slice_27/stackConst*
valueB"        *
dtype0
M
strided_slice_27/stack_1Const*
valueB"       *
dtype0
M
strided_slice_27/stack_2Const*
valueB"      *
dtype0
�
strided_slice_27StridedSliceconcat_5strided_slice_27/stackstrided_slice_27/stack_1strided_slice_27/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
R
(softmax_cross_entropy_with_logits_3/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_3/ShapeShapestrided_slice_27*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_3/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_3/Shape_1Shapestrided_slice_27*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_3/Sub/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits_3/SubSub*softmax_cross_entropy_with_logits_3/Rank_1)softmax_cross_entropy_with_logits_3/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_3/Slice/beginPack'softmax_cross_entropy_with_logits_3/Sub*
N*
T0*

axis 
\
.softmax_cross_entropy_with_logits_3/Slice/sizeConst*
valueB:*
dtype0
�
)softmax_cross_entropy_with_logits_3/SliceSlice+softmax_cross_entropy_with_logits_3/Shape_1/softmax_cross_entropy_with_logits_3/Slice/begin.softmax_cross_entropy_with_logits_3/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_3/concat/values_0Const*
valueB:
���������*
dtype0
Y
/softmax_cross_entropy_with_logits_3/concat/axisConst*
dtype0*
value	B : 
�
*softmax_cross_entropy_with_logits_3/concatConcatV23softmax_cross_entropy_with_logits_3/concat/values_0)softmax_cross_entropy_with_logits_3/Slice/softmax_cross_entropy_with_logits_3/concat/axis*
T0*
N*

Tidx0
�
+softmax_cross_entropy_with_logits_3/ReshapeReshapestrided_slice_27*softmax_cross_entropy_with_logits_3/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_3/Rank_2Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_3/Shape_2Shapestrided_slice_26*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_3/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_3/Sub_1Sub*softmax_cross_entropy_with_logits_3/Rank_2+softmax_cross_entropy_with_logits_3/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_3/Slice_1/beginPack)softmax_cross_entropy_with_logits_3/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_3/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_3/Slice_1Slice+softmax_cross_entropy_with_logits_3/Shape_21softmax_cross_entropy_with_logits_3/Slice_1/begin0softmax_cross_entropy_with_logits_3/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_3/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_3/concat_1/axisConst*
dtype0*
value	B : 
�
,softmax_cross_entropy_with_logits_3/concat_1ConcatV25softmax_cross_entropy_with_logits_3/concat_1/values_0+softmax_cross_entropy_with_logits_3/Slice_11softmax_cross_entropy_with_logits_3/concat_1/axis*
N*

Tidx0*
T0
�
-softmax_cross_entropy_with_logits_3/Reshape_1Reshapestrided_slice_26,softmax_cross_entropy_with_logits_3/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_3SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_3/Reshape-softmax_cross_entropy_with_logits_3/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_3/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_3/Sub_2Sub(softmax_cross_entropy_with_logits_3/Rank+softmax_cross_entropy_with_logits_3/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_3/Slice_2/beginConst*
dtype0*
valueB: 
�
0softmax_cross_entropy_with_logits_3/Slice_2/sizePack)softmax_cross_entropy_with_logits_3/Sub_2*
T0*

axis *
N
�
+softmax_cross_entropy_with_logits_3/Slice_2Slice)softmax_cross_entropy_with_logits_3/Shape1softmax_cross_entropy_with_logits_3/Slice_2/begin0softmax_cross_entropy_with_logits_3/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_3/Reshape_2Reshape#softmax_cross_entropy_with_logits_3+softmax_cross_entropy_with_logits_3/Slice_2*
T0*
Tshape0
B
NegNeg-softmax_cross_entropy_with_logits_3/Reshape_2*
T0
K
strided_slice_28/stackConst*
valueB"       *
dtype0
M
strided_slice_28/stack_1Const*
valueB"       *
dtype0
M
strided_slice_28/stack_2Const*
valueB"      *
dtype0
�
strided_slice_28StridedSliceconcat_6strided_slice_28/stackstrided_slice_28/stack_1strided_slice_28/stack_2*
end_mask*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
K
strided_slice_29/stackConst*
valueB"       *
dtype0
M
strided_slice_29/stack_1Const*
valueB"       *
dtype0
M
strided_slice_29/stack_2Const*
dtype0*
valueB"      
�
strided_slice_29StridedSliceconcat_5strided_slice_29/stackstrided_slice_29/stack_1strided_slice_29/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
R
(softmax_cross_entropy_with_logits_4/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_4/ShapeShapestrided_slice_29*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_4/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_4/Shape_1Shapestrided_slice_29*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_4/Sub/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits_4/SubSub*softmax_cross_entropy_with_logits_4/Rank_1)softmax_cross_entropy_with_logits_4/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_4/Slice/beginPack'softmax_cross_entropy_with_logits_4/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_4/Slice/sizeConst*
dtype0*
valueB:
�
)softmax_cross_entropy_with_logits_4/SliceSlice+softmax_cross_entropy_with_logits_4/Shape_1/softmax_cross_entropy_with_logits_4/Slice/begin.softmax_cross_entropy_with_logits_4/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_4/concat/values_0Const*
valueB:
���������*
dtype0
Y
/softmax_cross_entropy_with_logits_4/concat/axisConst*
dtype0*
value	B : 
�
*softmax_cross_entropy_with_logits_4/concatConcatV23softmax_cross_entropy_with_logits_4/concat/values_0)softmax_cross_entropy_with_logits_4/Slice/softmax_cross_entropy_with_logits_4/concat/axis*
N*

Tidx0*
T0
�
+softmax_cross_entropy_with_logits_4/ReshapeReshapestrided_slice_29*softmax_cross_entropy_with_logits_4/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_4/Rank_2Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_4/Shape_2Shapestrided_slice_28*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_4/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_4/Sub_1Sub*softmax_cross_entropy_with_logits_4/Rank_2+softmax_cross_entropy_with_logits_4/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_4/Slice_1/beginPack)softmax_cross_entropy_with_logits_4/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_4/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_4/Slice_1Slice+softmax_cross_entropy_with_logits_4/Shape_21softmax_cross_entropy_with_logits_4/Slice_1/begin0softmax_cross_entropy_with_logits_4/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_4/concat_1/values_0Const*
dtype0*
valueB:
���������
[
1softmax_cross_entropy_with_logits_4/concat_1/axisConst*
value	B : *
dtype0
�
,softmax_cross_entropy_with_logits_4/concat_1ConcatV25softmax_cross_entropy_with_logits_4/concat_1/values_0+softmax_cross_entropy_with_logits_4/Slice_11softmax_cross_entropy_with_logits_4/concat_1/axis*
N*

Tidx0*
T0
�
-softmax_cross_entropy_with_logits_4/Reshape_1Reshapestrided_slice_28,softmax_cross_entropy_with_logits_4/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_4SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_4/Reshape-softmax_cross_entropy_with_logits_4/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_4/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_4/Sub_2Sub(softmax_cross_entropy_with_logits_4/Rank+softmax_cross_entropy_with_logits_4/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_4/Slice_2/beginConst*
valueB: *
dtype0
�
0softmax_cross_entropy_with_logits_4/Slice_2/sizePack)softmax_cross_entropy_with_logits_4/Sub_2*
T0*

axis *
N
�
+softmax_cross_entropy_with_logits_4/Slice_2Slice)softmax_cross_entropy_with_logits_4/Shape1softmax_cross_entropy_with_logits_4/Slice_2/begin0softmax_cross_entropy_with_logits_4/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_4/Reshape_2Reshape#softmax_cross_entropy_with_logits_4+softmax_cross_entropy_with_logits_4/Slice_2*
T0*
Tshape0
D
Neg_1Neg-softmax_cross_entropy_with_logits_4/Reshape_2*
T0
K
strided_slice_30/stackConst*
valueB"       *
dtype0
M
strided_slice_30/stack_1Const*
dtype0*
valueB"    	   
M
strided_slice_30/stack_2Const*
valueB"      *
dtype0
�
strided_slice_30StridedSliceconcat_6strided_slice_30/stackstrided_slice_30/stack_1strided_slice_30/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
K
strided_slice_31/stackConst*
valueB"       *
dtype0
M
strided_slice_31/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_31/stack_2Const*
dtype0*
valueB"      
�
strided_slice_31StridedSliceconcat_5strided_slice_31/stackstrided_slice_31/stack_1strided_slice_31/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
R
(softmax_cross_entropy_with_logits_5/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_5/ShapeShapestrided_slice_31*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_5/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_5/Shape_1Shapestrided_slice_31*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_5/Sub/yConst*
dtype0*
value	B :
�
'softmax_cross_entropy_with_logits_5/SubSub*softmax_cross_entropy_with_logits_5/Rank_1)softmax_cross_entropy_with_logits_5/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_5/Slice/beginPack'softmax_cross_entropy_with_logits_5/Sub*
N*
T0*

axis 
\
.softmax_cross_entropy_with_logits_5/Slice/sizeConst*
dtype0*
valueB:
�
)softmax_cross_entropy_with_logits_5/SliceSlice+softmax_cross_entropy_with_logits_5/Shape_1/softmax_cross_entropy_with_logits_5/Slice/begin.softmax_cross_entropy_with_logits_5/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_5/concat/values_0Const*
dtype0*
valueB:
���������
Y
/softmax_cross_entropy_with_logits_5/concat/axisConst*
dtype0*
value	B : 
�
*softmax_cross_entropy_with_logits_5/concatConcatV23softmax_cross_entropy_with_logits_5/concat/values_0)softmax_cross_entropy_with_logits_5/Slice/softmax_cross_entropy_with_logits_5/concat/axis*
T0*
N*

Tidx0
�
+softmax_cross_entropy_with_logits_5/ReshapeReshapestrided_slice_31*softmax_cross_entropy_with_logits_5/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_5/Rank_2Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_5/Shape_2Shapestrided_slice_30*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_5/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_5/Sub_1Sub*softmax_cross_entropy_with_logits_5/Rank_2+softmax_cross_entropy_with_logits_5/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_5/Slice_1/beginPack)softmax_cross_entropy_with_logits_5/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_5/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_5/Slice_1Slice+softmax_cross_entropy_with_logits_5/Shape_21softmax_cross_entropy_with_logits_5/Slice_1/begin0softmax_cross_entropy_with_logits_5/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_5/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_5/concat_1/axisConst*
value	B : *
dtype0
�
,softmax_cross_entropy_with_logits_5/concat_1ConcatV25softmax_cross_entropy_with_logits_5/concat_1/values_0+softmax_cross_entropy_with_logits_5/Slice_11softmax_cross_entropy_with_logits_5/concat_1/axis*
N*

Tidx0*
T0
�
-softmax_cross_entropy_with_logits_5/Reshape_1Reshapestrided_slice_30,softmax_cross_entropy_with_logits_5/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_5SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_5/Reshape-softmax_cross_entropy_with_logits_5/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_5/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_5/Sub_2Sub(softmax_cross_entropy_with_logits_5/Rank+softmax_cross_entropy_with_logits_5/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_5/Slice_2/beginConst*
valueB: *
dtype0
�
0softmax_cross_entropy_with_logits_5/Slice_2/sizePack)softmax_cross_entropy_with_logits_5/Sub_2*
T0*

axis *
N
�
+softmax_cross_entropy_with_logits_5/Slice_2Slice)softmax_cross_entropy_with_logits_5/Shape1softmax_cross_entropy_with_logits_5/Slice_2/begin0softmax_cross_entropy_with_logits_5/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_5/Reshape_2Reshape#softmax_cross_entropy_with_logits_5+softmax_cross_entropy_with_logits_5/Slice_2*
T0*
Tshape0
D
Neg_2Neg-softmax_cross_entropy_with_logits_5/Reshape_2*
T0
@
stack_1PackNegNeg_1Neg_2*
N*
T0*

axis
A
Sum_9/reduction_indicesConst*
dtype0*
value	B :
T
Sum_9Sumstack_1Sum_9/reduction_indices*

Tidx0*
	keep_dims(*
T0
K
strided_slice_32/stackConst*
valueB"        *
dtype0
M
strided_slice_32/stack_1Const*
valueB"       *
dtype0
M
strided_slice_32/stack_2Const*
valueB"      *
dtype0
�
strided_slice_32StridedSliceconcat_6strided_slice_32/stackstrided_slice_32/stack_1strided_slice_32/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
K
strided_slice_33/stackConst*
dtype0*
valueB"        
M
strided_slice_33/stack_1Const*
dtype0*
valueB"       
M
strided_slice_33/stack_2Const*
valueB"      *
dtype0
�
strided_slice_33StridedSliceconcat_9strided_slice_33/stackstrided_slice_33/stack_1strided_slice_33/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
R
(softmax_cross_entropy_with_logits_6/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_6/ShapeShapestrided_slice_33*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_6/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_6/Shape_1Shapestrided_slice_33*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_6/Sub/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits_6/SubSub*softmax_cross_entropy_with_logits_6/Rank_1)softmax_cross_entropy_with_logits_6/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_6/Slice/beginPack'softmax_cross_entropy_with_logits_6/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_6/Slice/sizeConst*
valueB:*
dtype0
�
)softmax_cross_entropy_with_logits_6/SliceSlice+softmax_cross_entropy_with_logits_6/Shape_1/softmax_cross_entropy_with_logits_6/Slice/begin.softmax_cross_entropy_with_logits_6/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_6/concat/values_0Const*
valueB:
���������*
dtype0
Y
/softmax_cross_entropy_with_logits_6/concat/axisConst*
dtype0*
value	B : 
�
*softmax_cross_entropy_with_logits_6/concatConcatV23softmax_cross_entropy_with_logits_6/concat/values_0)softmax_cross_entropy_with_logits_6/Slice/softmax_cross_entropy_with_logits_6/concat/axis*

Tidx0*
T0*
N
�
+softmax_cross_entropy_with_logits_6/ReshapeReshapestrided_slice_33*softmax_cross_entropy_with_logits_6/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_6/Rank_2Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_6/Shape_2Shapestrided_slice_32*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_6/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_6/Sub_1Sub*softmax_cross_entropy_with_logits_6/Rank_2+softmax_cross_entropy_with_logits_6/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_6/Slice_1/beginPack)softmax_cross_entropy_with_logits_6/Sub_1*
N*
T0*

axis 
^
0softmax_cross_entropy_with_logits_6/Slice_1/sizeConst*
dtype0*
valueB:
�
+softmax_cross_entropy_with_logits_6/Slice_1Slice+softmax_cross_entropy_with_logits_6/Shape_21softmax_cross_entropy_with_logits_6/Slice_1/begin0softmax_cross_entropy_with_logits_6/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_6/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_6/concat_1/axisConst*
value	B : *
dtype0
�
,softmax_cross_entropy_with_logits_6/concat_1ConcatV25softmax_cross_entropy_with_logits_6/concat_1/values_0+softmax_cross_entropy_with_logits_6/Slice_11softmax_cross_entropy_with_logits_6/concat_1/axis*

Tidx0*
T0*
N
�
-softmax_cross_entropy_with_logits_6/Reshape_1Reshapestrided_slice_32,softmax_cross_entropy_with_logits_6/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_6SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_6/Reshape-softmax_cross_entropy_with_logits_6/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_6/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_6/Sub_2Sub(softmax_cross_entropy_with_logits_6/Rank+softmax_cross_entropy_with_logits_6/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_6/Slice_2/beginConst*
valueB: *
dtype0
�
0softmax_cross_entropy_with_logits_6/Slice_2/sizePack)softmax_cross_entropy_with_logits_6/Sub_2*
T0*

axis *
N
�
+softmax_cross_entropy_with_logits_6/Slice_2Slice)softmax_cross_entropy_with_logits_6/Shape1softmax_cross_entropy_with_logits_6/Slice_2/begin0softmax_cross_entropy_with_logits_6/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_6/Reshape_2Reshape#softmax_cross_entropy_with_logits_6+softmax_cross_entropy_with_logits_6/Slice_2*
T0*
Tshape0
D
Neg_3Neg-softmax_cross_entropy_with_logits_6/Reshape_2*
T0
K
strided_slice_34/stackConst*
valueB"       *
dtype0
M
strided_slice_34/stack_1Const*
valueB"       *
dtype0
M
strided_slice_34/stack_2Const*
valueB"      *
dtype0
�
strided_slice_34StridedSliceconcat_6strided_slice_34/stackstrided_slice_34/stack_1strided_slice_34/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0*
shrink_axis_mask 
K
strided_slice_35/stackConst*
dtype0*
valueB"       
M
strided_slice_35/stack_1Const*
valueB"       *
dtype0
M
strided_slice_35/stack_2Const*
valueB"      *
dtype0
�
strided_slice_35StridedSliceconcat_9strided_slice_35/stackstrided_slice_35/stack_1strided_slice_35/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
R
(softmax_cross_entropy_with_logits_7/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_7/ShapeShapestrided_slice_35*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_7/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_7/Shape_1Shapestrided_slice_35*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_7/Sub/yConst*
value	B :*
dtype0
�
'softmax_cross_entropy_with_logits_7/SubSub*softmax_cross_entropy_with_logits_7/Rank_1)softmax_cross_entropy_with_logits_7/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_7/Slice/beginPack'softmax_cross_entropy_with_logits_7/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_7/Slice/sizeConst*
valueB:*
dtype0
�
)softmax_cross_entropy_with_logits_7/SliceSlice+softmax_cross_entropy_with_logits_7/Shape_1/softmax_cross_entropy_with_logits_7/Slice/begin.softmax_cross_entropy_with_logits_7/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_7/concat/values_0Const*
valueB:
���������*
dtype0
Y
/softmax_cross_entropy_with_logits_7/concat/axisConst*
value	B : *
dtype0
�
*softmax_cross_entropy_with_logits_7/concatConcatV23softmax_cross_entropy_with_logits_7/concat/values_0)softmax_cross_entropy_with_logits_7/Slice/softmax_cross_entropy_with_logits_7/concat/axis*
T0*
N*

Tidx0
�
+softmax_cross_entropy_with_logits_7/ReshapeReshapestrided_slice_35*softmax_cross_entropy_with_logits_7/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_7/Rank_2Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_7/Shape_2Shapestrided_slice_34*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_7/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_7/Sub_1Sub*softmax_cross_entropy_with_logits_7/Rank_2+softmax_cross_entropy_with_logits_7/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_7/Slice_1/beginPack)softmax_cross_entropy_with_logits_7/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_7/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_7/Slice_1Slice+softmax_cross_entropy_with_logits_7/Shape_21softmax_cross_entropy_with_logits_7/Slice_1/begin0softmax_cross_entropy_with_logits_7/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_7/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_7/concat_1/axisConst*
value	B : *
dtype0
�
,softmax_cross_entropy_with_logits_7/concat_1ConcatV25softmax_cross_entropy_with_logits_7/concat_1/values_0+softmax_cross_entropy_with_logits_7/Slice_11softmax_cross_entropy_with_logits_7/concat_1/axis*
T0*
N*

Tidx0
�
-softmax_cross_entropy_with_logits_7/Reshape_1Reshapestrided_slice_34,softmax_cross_entropy_with_logits_7/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_7SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_7/Reshape-softmax_cross_entropy_with_logits_7/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_7/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_7/Sub_2Sub(softmax_cross_entropy_with_logits_7/Rank+softmax_cross_entropy_with_logits_7/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_7/Slice_2/beginConst*
valueB: *
dtype0
�
0softmax_cross_entropy_with_logits_7/Slice_2/sizePack)softmax_cross_entropy_with_logits_7/Sub_2*
N*
T0*

axis 
�
+softmax_cross_entropy_with_logits_7/Slice_2Slice)softmax_cross_entropy_with_logits_7/Shape1softmax_cross_entropy_with_logits_7/Slice_2/begin0softmax_cross_entropy_with_logits_7/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_7/Reshape_2Reshape#softmax_cross_entropy_with_logits_7+softmax_cross_entropy_with_logits_7/Slice_2*
T0*
Tshape0
D
Neg_4Neg-softmax_cross_entropy_with_logits_7/Reshape_2*
T0
K
strided_slice_36/stackConst*
valueB"       *
dtype0
M
strided_slice_36/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_36/stack_2Const*
valueB"      *
dtype0
�
strided_slice_36StridedSliceconcat_6strided_slice_36/stackstrided_slice_36/stack_1strided_slice_36/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
K
strided_slice_37/stackConst*
valueB"       *
dtype0
M
strided_slice_37/stack_1Const*
valueB"    	   *
dtype0
M
strided_slice_37/stack_2Const*
dtype0*
valueB"      
�
strided_slice_37StridedSliceconcat_9strided_slice_37/stackstrided_slice_37/stack_1strided_slice_37/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
R
(softmax_cross_entropy_with_logits_8/RankConst*
dtype0*
value	B :
]
)softmax_cross_entropy_with_logits_8/ShapeShapestrided_slice_37*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_8/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_8/Shape_1Shapestrided_slice_37*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_8/Sub/yConst*
dtype0*
value	B :
�
'softmax_cross_entropy_with_logits_8/SubSub*softmax_cross_entropy_with_logits_8/Rank_1)softmax_cross_entropy_with_logits_8/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_8/Slice/beginPack'softmax_cross_entropy_with_logits_8/Sub*
N*
T0*

axis 
\
.softmax_cross_entropy_with_logits_8/Slice/sizeConst*
valueB:*
dtype0
�
)softmax_cross_entropy_with_logits_8/SliceSlice+softmax_cross_entropy_with_logits_8/Shape_1/softmax_cross_entropy_with_logits_8/Slice/begin.softmax_cross_entropy_with_logits_8/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_8/concat/values_0Const*
valueB:
���������*
dtype0
Y
/softmax_cross_entropy_with_logits_8/concat/axisConst*
dtype0*
value	B : 
�
*softmax_cross_entropy_with_logits_8/concatConcatV23softmax_cross_entropy_with_logits_8/concat/values_0)softmax_cross_entropy_with_logits_8/Slice/softmax_cross_entropy_with_logits_8/concat/axis*
N*

Tidx0*
T0
�
+softmax_cross_entropy_with_logits_8/ReshapeReshapestrided_slice_37*softmax_cross_entropy_with_logits_8/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_8/Rank_2Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_8/Shape_2Shapestrided_slice_36*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_8/Sub_1/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_8/Sub_1Sub*softmax_cross_entropy_with_logits_8/Rank_2+softmax_cross_entropy_with_logits_8/Sub_1/y*
T0
�
1softmax_cross_entropy_with_logits_8/Slice_1/beginPack)softmax_cross_entropy_with_logits_8/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_8/Slice_1/sizeConst*
valueB:*
dtype0
�
+softmax_cross_entropy_with_logits_8/Slice_1Slice+softmax_cross_entropy_with_logits_8/Shape_21softmax_cross_entropy_with_logits_8/Slice_1/begin0softmax_cross_entropy_with_logits_8/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_8/concat_1/values_0Const*
valueB:
���������*
dtype0
[
1softmax_cross_entropy_with_logits_8/concat_1/axisConst*
value	B : *
dtype0
�
,softmax_cross_entropy_with_logits_8/concat_1ConcatV25softmax_cross_entropy_with_logits_8/concat_1/values_0+softmax_cross_entropy_with_logits_8/Slice_11softmax_cross_entropy_with_logits_8/concat_1/axis*
T0*
N*

Tidx0
�
-softmax_cross_entropy_with_logits_8/Reshape_1Reshapestrided_slice_36,softmax_cross_entropy_with_logits_8/concat_1*
T0*
Tshape0
�
#softmax_cross_entropy_with_logits_8SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_8/Reshape-softmax_cross_entropy_with_logits_8/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_8/Sub_2/yConst*
value	B :*
dtype0
�
)softmax_cross_entropy_with_logits_8/Sub_2Sub(softmax_cross_entropy_with_logits_8/Rank+softmax_cross_entropy_with_logits_8/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_8/Slice_2/beginConst*
dtype0*
valueB: 
�
0softmax_cross_entropy_with_logits_8/Slice_2/sizePack)softmax_cross_entropy_with_logits_8/Sub_2*
T0*

axis *
N
�
+softmax_cross_entropy_with_logits_8/Slice_2Slice)softmax_cross_entropy_with_logits_8/Shape1softmax_cross_entropy_with_logits_8/Slice_2/begin0softmax_cross_entropy_with_logits_8/Slice_2/size*
T0*
Index0
�
-softmax_cross_entropy_with_logits_8/Reshape_2Reshape#softmax_cross_entropy_with_logits_8+softmax_cross_entropy_with_logits_8/Slice_2*
T0*
Tshape0
D
Neg_5Neg-softmax_cross_entropy_with_logits_8/Reshape_2*
T0
B
stack_2PackNeg_3Neg_4Neg_5*
N*
T0*

axis
B
Sum_10/reduction_indicesConst*
dtype0*
value	B :
V
Sum_10Sumstack_2Sum_10/reduction_indices*
T0*

Tidx0*
	keep_dims(
C
Variable/initial_valueConst*
valueB
 *��8*
dtype0
T
Variable
VariableV2*
dtype0*
	container *
shape: *
shared_name 
�
Variable/AssignAssignVariableVariable/initial_value*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(
I
Variable/readIdentityVariable*
T0*
_class
loc:@Variable
G
extrinsic_returnsPlaceholder*
shape:���������*
dtype0
N
extrinsic_value_estimatePlaceholder*
dtype0*
shape:���������
G
curiosity_returnsPlaceholder*
shape:���������*
dtype0
N
curiosity_value_estimatePlaceholder*
dtype0*
shape:���������
@

advantagesPlaceholder*
dtype0*
shape:���������
A
ExpandDims/dimConst*
valueB :
���������*
dtype0
I

ExpandDims
ExpandDims
advantagesExpandDims/dim*

Tdim0*
T0
R
%PolynomialDecay/initial_learning_rateConst*
valueB
 *��L>*
dtype0
C
PolynomialDecay/Cast/xConst*
valueB
 *���=*
dtype0
E
PolynomialDecay/Cast_1/xConst*
valueB
 *  �?*
dtype0
X
PolynomialDecay/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
E
PolynomialDecay/Cast_3/xConst*
dtype0*
valueB
 * �>L
F
PolynomialDecay/Minimum/yConst*
valueB
 * �>L*
dtype0
^
PolynomialDecay/MinimumMinimumPolynomialDecay/Cast_2PolynomialDecay/Minimum/y*
T0
^
PolynomialDecay/truedivRealDivPolynomialDecay/MinimumPolynomialDecay/Cast_3/x*
T0
b
PolynomialDecay/subSub%PolynomialDecay/initial_learning_ratePolynomialDecay/Cast/x*
T0
D
PolynomialDecay/sub_1/xConst*
dtype0*
valueB
 *  �?
W
PolynomialDecay/sub_1SubPolynomialDecay/sub_1/xPolynomialDecay/truediv*
T0
T
PolynomialDecay/PowPowPolynomialDecay/sub_1PolynomialDecay/Cast_1/x*
T0
M
PolynomialDecay/MulMulPolynomialDecay/subPolynomialDecay/Pow*
T0
L
PolynomialDecayAddPolynomialDecay/MulPolynomialDecay/Cast/x*
T0
T
'PolynomialDecay_1/initial_learning_rateConst*
valueB
 *
�#<*
dtype0
E
PolynomialDecay_1/Cast/xConst*
valueB
 *��'7*
dtype0
G
PolynomialDecay_1/Cast_1/xConst*
valueB
 *  �?*
dtype0
Z
PolynomialDecay_1/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
G
PolynomialDecay_1/Cast_3/xConst*
valueB
 * �>L*
dtype0
H
PolynomialDecay_1/Minimum/yConst*
valueB
 * �>L*
dtype0
d
PolynomialDecay_1/MinimumMinimumPolynomialDecay_1/Cast_2PolynomialDecay_1/Minimum/y*
T0
d
PolynomialDecay_1/truedivRealDivPolynomialDecay_1/MinimumPolynomialDecay_1/Cast_3/x*
T0
h
PolynomialDecay_1/subSub'PolynomialDecay_1/initial_learning_ratePolynomialDecay_1/Cast/x*
T0
F
PolynomialDecay_1/sub_1/xConst*
valueB
 *  �?*
dtype0
]
PolynomialDecay_1/sub_1SubPolynomialDecay_1/sub_1/xPolynomialDecay_1/truediv*
T0
Z
PolynomialDecay_1/PowPowPolynomialDecay_1/sub_1PolynomialDecay_1/Cast_1/x*
T0
S
PolynomialDecay_1/MulMulPolynomialDecay_1/subPolynomialDecay_1/Pow*
T0
R
PolynomialDecay_1AddPolynomialDecay_1/MulPolynomialDecay_1/Cast/x*
T0
B
Sum_11/reduction_indicesConst*
value	B :*
dtype0
f
Sum_11Sumextrinsic_value/BiasAddSum_11/reduction_indices*
T0*

Tidx0*
	keep_dims( 
7
sub_3SubSum_11extrinsic_value_estimate*
T0
&
Neg_6NegPolynomialDecay*
T0
A
clip_by_value/MinimumMinimumsub_3PolynomialDecay*
T0
?
clip_by_valueMaximumclip_by_value/MinimumNeg_6*
T0
A
add_23AddV2extrinsic_value_estimateclip_by_value*
T0
B
Sum_12/reduction_indicesConst*
value	B :*
dtype0
f
Sum_12Sumextrinsic_value/BiasAddSum_12/reduction_indices*

Tidx0*
	keep_dims( *
T0
J
SquaredDifferenceSquaredDifferenceextrinsic_returnsSum_12*
T0
L
SquaredDifference_1SquaredDifferenceextrinsic_returnsadd_23*
T0
C
MaximumMaximumSquaredDifferenceSquaredDifference_1*
T0
R
DynamicPartitionDynamicPartitionMaximumCast*
num_partitions*
T0
3
ConstConst*
valueB: *
dtype0
O
Mean_1MeanDynamicPartition:1Const*

Tidx0*
	keep_dims( *
T0
B
Sum_13/reduction_indicesConst*
value	B :*
dtype0
f
Sum_13Sumcuriosity_value/BiasAddSum_13/reduction_indices*

Tidx0*
	keep_dims( *
T0
7
sub_4SubSum_13curiosity_value_estimate*
T0
&
Neg_7NegPolynomialDecay*
T0
C
clip_by_value_1/MinimumMinimumsub_4PolynomialDecay*
T0
C
clip_by_value_1Maximumclip_by_value_1/MinimumNeg_7*
T0
C
add_24AddV2curiosity_value_estimateclip_by_value_1*
T0
B
Sum_14/reduction_indicesConst*
value	B :*
dtype0
f
Sum_14Sumcuriosity_value/BiasAddSum_14/reduction_indices*

Tidx0*
	keep_dims( *
T0
L
SquaredDifference_2SquaredDifferencecuriosity_returnsSum_14*
T0
L
SquaredDifference_3SquaredDifferencecuriosity_returnsadd_24*
T0
G
	Maximum_1MaximumSquaredDifference_2SquaredDifference_3*
T0
V
DynamicPartition_1DynamicPartition	Maximum_1Cast*
T0*
num_partitions
5
Const_1Const*
valueB: *
dtype0
S
Mean_2MeanDynamicPartition_1:1Const_1*
T0*

Tidx0*
	keep_dims( 
A
Rank/packedPackMean_1Mean_2*
T0*

axis *
N
.
RankConst*
dtype0*
value	B :
5
range/startConst*
value	B : *
dtype0
5
range/deltaConst*
value	B :*
dtype0
:
rangeRangerange/startRankrange/delta*

Tidx0
B
Mean_3/inputPackMean_1Mean_2*
T0*

axis *
N
I
Mean_3MeanMean_3/inputrange*

Tidx0*
	keep_dims( *
T0
$
sub_5SubSum_9Sum_10*
T0

ExpExpsub_5*
T0
&
mul_7MulExp
ExpandDims*
T0
4
sub_6/xConst*
valueB
 *  �?*
dtype0
/
sub_6Subsub_6/xPolynomialDecay*
T0
5
add_25/xConst*
valueB
 *  �?*
dtype0
3
add_25AddV2add_25/xPolynomialDecay*
T0
8
clip_by_value_2/MinimumMinimumExpadd_25*
T0
C
clip_by_value_2Maximumclip_by_value_2/Minimumsub_6*
T0
2
mul_8Mulclip_by_value_2
ExpandDims*
T0
)
MinimumMinimummul_7mul_8*
T0
T
DynamicPartition_2DynamicPartitionMinimumCast*
T0*
num_partitions
<
Const_2Const*
dtype0*
valueB"       
S
Mean_4MeanDynamicPartition_2:1Const_2*

Tidx0*
	keep_dims( *
T0

Neg_8NegMean_4*
T0

AbsAbsNeg_8*
T0
4
mul_9/xConst*
dtype0*
valueB
 *   ?
&
mul_9Mulmul_9/xMean_3*
T0
&
add_26AddV2Neg_8mul_9*
T0
R
DynamicPartition_3DynamicPartitionSum_8Cast*
T0*
num_partitions
5
Const_3Const*
valueB: *
dtype0
S
Mean_5MeanDynamicPartition_3:1Const_3*

Tidx0*
	keep_dims( *
T0
1
mul_10MulPolynomialDecay_1Mean_5*
T0
%
sub_7Subadd_26mul_10*
T0
8
gradients/ShapeConst*
valueB *
dtype0
@
gradients/grad_ys_0Const*
valueB
 *  �?*
dtype0
W
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0
;
gradients/f_countConst*
value	B : *
dtype0
�
gradients/f_count_1Entergradients/f_count*
T0*
is_constant( *
parallel_iterations *,

frame_namelstm/rnn/while/while_context
X
gradients/MergeMergegradients/f_count_1gradients/NextIteration*
T0*
N
M
gradients/SwitchSwitchgradients/Mergelstm/rnn/while/LoopCond*
T0
S
gradients/Add/yConst^lstm/rnn/while/Identity*
value	B :*
dtype0
B
gradients/AddAddgradients/Switch:1gradients/Add/y*
T0
�
gradients/NextIterationNextIterationgradients/Add`^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPushV2V^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2X^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2_1T^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2V^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2_1J^gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPushV2V^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2X^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2_1D^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPushV2F^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPushV2V^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2X^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2_1D^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPushV2F^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPushV2T^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2V^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2_1B^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPushV2D^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPushV2H^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2J^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2_1*
T0
6
gradients/f_count_2Exitgradients/Switch*
T0
;
gradients/b_countConst*
value	B :*
dtype0
�
gradients/b_count_1Entergradients/f_count_2*
T0*
is_constant( *
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
\
gradients/Merge_1Mergegradients/b_count_1gradients/NextIteration_1*
T0*
N
`
gradients/GreaterEqualGreaterEqualgradients/Merge_1gradients/GreaterEqual/Enter*
T0
�
gradients/GreaterEqual/EnterEntergradients/b_count*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant(
7
gradients/b_count_2LoopCondgradients/GreaterEqual
M
gradients/Switch_1Switchgradients/Merge_1gradients/b_count_2*
T0
Q
gradients/SubSubgradients/Switch_1:1gradients/GreaterEqual/Enter*
T0
�
gradients/NextIteration_1NextIterationgradients/Sub[^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/b_sync*
T0
8
gradients/b_count_3Exitgradients/Switch_1*
T0
8
gradients/sub_7_grad/NegNeggradients/Fill*
T0
Y
%gradients/sub_7_grad/tuple/group_depsNoOp^gradients/Fill^gradients/sub_7_grad/Neg
�
-gradients/sub_7_grad/tuple/control_dependencyIdentitygradients/Fill&^gradients/sub_7_grad/tuple/group_deps*
T0*!
_class
loc:@gradients/Fill
�
/gradients/sub_7_grad/tuple/control_dependency_1Identitygradients/sub_7_grad/Neg&^gradients/sub_7_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/sub_7_grad/Neg
^
&gradients/add_26_grad/tuple/group_depsNoOp.^gradients/sub_7_grad/tuple/control_dependency
�
.gradients/add_26_grad/tuple/control_dependencyIdentity-gradients/sub_7_grad/tuple/control_dependency'^gradients/add_26_grad/tuple/group_deps*
T0*!
_class
loc:@gradients/Fill
�
0gradients/add_26_grad/tuple/control_dependency_1Identity-gradients/sub_7_grad/tuple/control_dependency'^gradients/add_26_grad/tuple/group_deps*
T0*!
_class
loc:@gradients/Fill
b
gradients/mul_10_grad/MulMul/gradients/sub_7_grad/tuple/control_dependency_1Mean_5*
T0
o
gradients/mul_10_grad/Mul_1Mul/gradients/sub_7_grad/tuple/control_dependency_1PolynomialDecay_1*
T0
h
&gradients/mul_10_grad/tuple/group_depsNoOp^gradients/mul_10_grad/Mul^gradients/mul_10_grad/Mul_1
�
.gradients/mul_10_grad/tuple/control_dependencyIdentitygradients/mul_10_grad/Mul'^gradients/mul_10_grad/tuple/group_deps*
T0*,
_class"
 loc:@gradients/mul_10_grad/Mul
�
0gradients/mul_10_grad/tuple/control_dependency_1Identitygradients/mul_10_grad/Mul_1'^gradients/mul_10_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients/mul_10_grad/Mul_1
X
gradients/Neg_8_grad/NegNeg.gradients/add_26_grad/tuple/control_dependency*
T0
b
gradients/mul_9_grad/MulMul0gradients/add_26_grad/tuple/control_dependency_1Mean_3*
T0
e
gradients/mul_9_grad/Mul_1Mul0gradients/add_26_grad/tuple/control_dependency_1mul_9/x*
T0
e
%gradients/mul_9_grad/tuple/group_depsNoOp^gradients/mul_9_grad/Mul^gradients/mul_9_grad/Mul_1
�
-gradients/mul_9_grad/tuple/control_dependencyIdentitygradients/mul_9_grad/Mul&^gradients/mul_9_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/mul_9_grad/Mul
�
/gradients/mul_9_grad/tuple/control_dependency_1Identitygradients/mul_9_grad/Mul_1&^gradients/mul_9_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_9_grad/Mul_1
Q
#gradients/Mean_5_grad/Reshape/shapeConst*
dtype0*
valueB:
�
gradients/Mean_5_grad/ReshapeReshape0gradients/mul_10_grad/tuple/control_dependency_1#gradients/Mean_5_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_5_grad/ShapeShapeDynamicPartition_3:1*
T0*
out_type0
y
gradients/Mean_5_grad/TileTilegradients/Mean_5_grad/Reshapegradients/Mean_5_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_5_grad/Shape_1ShapeDynamicPartition_3:1*
T0*
out_type0
F
gradients/Mean_5_grad/Shape_2Const*
dtype0*
valueB 
I
gradients/Mean_5_grad/ConstConst*
valueB: *
dtype0
�
gradients/Mean_5_grad/ProdProdgradients/Mean_5_grad/Shape_1gradients/Mean_5_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_5_grad/Const_1Const*
valueB: *
dtype0
�
gradients/Mean_5_grad/Prod_1Prodgradients/Mean_5_grad/Shape_2gradients/Mean_5_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_5_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_5_grad/MaximumMaximumgradients/Mean_5_grad/Prod_1gradients/Mean_5_grad/Maximum/y*
T0
n
gradients/Mean_5_grad/floordivFloorDivgradients/Mean_5_grad/Prodgradients/Mean_5_grad/Maximum*
T0
j
gradients/Mean_5_grad/CastCastgradients/Mean_5_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_5_grad/truedivRealDivgradients/Mean_5_grad/Tilegradients/Mean_5_grad/Cast*
T0
X
#gradients/Mean_4_grad/Reshape/shapeConst*
valueB"      *
dtype0
~
gradients/Mean_4_grad/ReshapeReshapegradients/Neg_8_grad/Neg#gradients/Mean_4_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_4_grad/ShapeShapeDynamicPartition_2:1*
T0*
out_type0
y
gradients/Mean_4_grad/TileTilegradients/Mean_4_grad/Reshapegradients/Mean_4_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_4_grad/Shape_1ShapeDynamicPartition_2:1*
T0*
out_type0
F
gradients/Mean_4_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_4_grad/ConstConst*
valueB: *
dtype0
�
gradients/Mean_4_grad/ProdProdgradients/Mean_4_grad/Shape_1gradients/Mean_4_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_4_grad/Const_1Const*
valueB: *
dtype0
�
gradients/Mean_4_grad/Prod_1Prodgradients/Mean_4_grad/Shape_2gradients/Mean_4_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
I
gradients/Mean_4_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_4_grad/MaximumMaximumgradients/Mean_4_grad/Prod_1gradients/Mean_4_grad/Maximum/y*
T0
n
gradients/Mean_4_grad/floordivFloorDivgradients/Mean_4_grad/Prodgradients/Mean_4_grad/Maximum*
T0
j
gradients/Mean_4_grad/CastCastgradients/Mean_4_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_4_grad/truedivRealDivgradients/Mean_4_grad/Tilegradients/Mean_4_grad/Cast*
T0
Q
#gradients/Mean_3_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients/Mean_3_grad/ReshapeReshape/gradients/mul_9_grad/tuple/control_dependency_1#gradients/Mean_3_grad/Reshape/shape*
T0*
Tshape0
I
gradients/Mean_3_grad/ConstConst*
valueB:*
dtype0
y
gradients/Mean_3_grad/TileTilegradients/Mean_3_grad/Reshapegradients/Mean_3_grad/Const*

Tmultiples0*
T0
J
gradients/Mean_3_grad/Const_1Const*
valueB
 *   @*
dtype0
l
gradients/Mean_3_grad/truedivRealDivgradients/Mean_3_grad/Tilegradients/Mean_3_grad/Const_1*
T0
>
gradients/zeros_like	ZerosLikeDynamicPartition_3*
T0
O
'gradients/DynamicPartition_3_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients/DynamicPartition_3_grad/ConstConst*
valueB: *
dtype0
�
&gradients/DynamicPartition_3_grad/ProdProd'gradients/DynamicPartition_3_grad/Shape'gradients/DynamicPartition_3_grad/Const*
T0*

Tidx0*
	keep_dims( 
W
-gradients/DynamicPartition_3_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_3_grad/range/deltaConst*
value	B :*
dtype0
�
'gradients/DynamicPartition_3_grad/rangeRange-gradients/DynamicPartition_3_grad/range/start&gradients/DynamicPartition_3_grad/Prod-gradients/DynamicPartition_3_grad/range/delta*

Tidx0
�
)gradients/DynamicPartition_3_grad/ReshapeReshape'gradients/DynamicPartition_3_grad/range'gradients/DynamicPartition_3_grad/Shape*
T0*
Tshape0
�
2gradients/DynamicPartition_3_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_3_grad/ReshapeCast*
T0*
num_partitions
�
/gradients/DynamicPartition_3_grad/DynamicStitchDynamicStitch2gradients/DynamicPartition_3_grad/DynamicPartition4gradients/DynamicPartition_3_grad/DynamicPartition:1gradients/zeros_likegradients/Mean_5_grad/truediv*
T0*
N
R
)gradients/DynamicPartition_3_grad/Shape_1ShapeSum_8*
T0*
out_type0
�
+gradients/DynamicPartition_3_grad/Reshape_1Reshape/gradients/DynamicPartition_3_grad/DynamicStitch)gradients/DynamicPartition_3_grad/Shape_1*
T0*
Tshape0
@
gradients/zeros_like_1	ZerosLikeDynamicPartition_2*
T0
O
'gradients/DynamicPartition_2_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients/DynamicPartition_2_grad/ConstConst*
valueB: *
dtype0
�
&gradients/DynamicPartition_2_grad/ProdProd'gradients/DynamicPartition_2_grad/Shape'gradients/DynamicPartition_2_grad/Const*

Tidx0*
	keep_dims( *
T0
W
-gradients/DynamicPartition_2_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_2_grad/range/deltaConst*
dtype0*
value	B :
�
'gradients/DynamicPartition_2_grad/rangeRange-gradients/DynamicPartition_2_grad/range/start&gradients/DynamicPartition_2_grad/Prod-gradients/DynamicPartition_2_grad/range/delta*

Tidx0
�
)gradients/DynamicPartition_2_grad/ReshapeReshape'gradients/DynamicPartition_2_grad/range'gradients/DynamicPartition_2_grad/Shape*
T0*
Tshape0
�
2gradients/DynamicPartition_2_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_2_grad/ReshapeCast*
T0*
num_partitions
�
/gradients/DynamicPartition_2_grad/DynamicStitchDynamicStitch2gradients/DynamicPartition_2_grad/DynamicPartition4gradients/DynamicPartition_2_grad/DynamicPartition:1gradients/zeros_like_1gradients/Mean_4_grad/truediv*
T0*
N
T
)gradients/DynamicPartition_2_grad/Shape_1ShapeMinimum*
T0*
out_type0
�
+gradients/DynamicPartition_2_grad/Reshape_1Reshape/gradients/DynamicPartition_2_grad/DynamicStitch)gradients/DynamicPartition_2_grad/Shape_1*
T0*
Tshape0
l
#gradients/Mean_3/input_grad/unstackUnpackgradients/Mean_3_grad/truediv*
T0*	
num*

axis 
Z
,gradients/Mean_3/input_grad/tuple/group_depsNoOp$^gradients/Mean_3/input_grad/unstack
�
4gradients/Mean_3/input_grad/tuple/control_dependencyIdentity#gradients/Mean_3/input_grad/unstack-^gradients/Mean_3/input_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/Mean_3/input_grad/unstack
�
6gradients/Mean_3/input_grad/tuple/control_dependency_1Identity%gradients/Mean_3/input_grad/unstack:1-^gradients/Mean_3/input_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/Mean_3/input_grad/unstack
C
gradients/Sum_8_grad/ShapeShapestack*
T0*
out_type0
r
gradients/Sum_8_grad/SizeConst*
dtype0*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :
�
gradients/Sum_8_grad/addAddV2Sum_8/reduction_indicesgradients/Sum_8_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
�
gradients/Sum_8_grad/modFloorModgradients/Sum_8_grad/addgradients/Sum_8_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
t
gradients/Sum_8_grad/Shape_1Const*
dtype0*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
valueB 
y
 gradients/Sum_8_grad/range/startConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_8_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_8_grad/rangeRange gradients/Sum_8_grad/range/startgradients/Sum_8_grad/Size gradients/Sum_8_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
x
gradients/Sum_8_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_8_grad/FillFillgradients/Sum_8_grad/Shape_1gradients/Sum_8_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape*

index_type0
�
"gradients/Sum_8_grad/DynamicStitchDynamicStitchgradients/Sum_8_grad/rangegradients/Sum_8_grad/modgradients/Sum_8_grad/Shapegradients/Sum_8_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
N
w
gradients/Sum_8_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_8_grad/MaximumMaximum"gradients/Sum_8_grad/DynamicStitchgradients/Sum_8_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
�
gradients/Sum_8_grad/floordivFloorDivgradients/Sum_8_grad/Shapegradients/Sum_8_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
�
gradients/Sum_8_grad/ReshapeReshape+gradients/DynamicPartition_3_grad/Reshape_1"gradients/Sum_8_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_8_grad/TileTilegradients/Sum_8_grad/Reshapegradients/Sum_8_grad/floordiv*

Tmultiples0*
T0
E
gradients/Minimum_grad/ShapeShapemul_7*
T0*
out_type0
G
gradients/Minimum_grad/Shape_1Shapemul_8*
T0*
out_type0
m
gradients/Minimum_grad/Shape_2Shape+gradients/DynamicPartition_2_grad/Reshape_1*
T0*
out_type0
O
"gradients/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
gradients/Minimum_grad/zerosFillgradients/Minimum_grad/Shape_2"gradients/Minimum_grad/zeros/Const*
T0*

index_type0
D
 gradients/Minimum_grad/LessEqual	LessEqualmul_7mul_8*
T0
�
,gradients/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Minimum_grad/Shapegradients/Minimum_grad/Shape_1*
T0
�
gradients/Minimum_grad/SelectSelect gradients/Minimum_grad/LessEqual+gradients/DynamicPartition_2_grad/Reshape_1gradients/Minimum_grad/zeros*
T0
�
gradients/Minimum_grad/SumSumgradients/Minimum_grad/Select,gradients/Minimum_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients/Minimum_grad/ReshapeReshapegradients/Minimum_grad/Sumgradients/Minimum_grad/Shape*
T0*
Tshape0
�
gradients/Minimum_grad/Select_1Select gradients/Minimum_grad/LessEqualgradients/Minimum_grad/zeros+gradients/DynamicPartition_2_grad/Reshape_1*
T0
�
gradients/Minimum_grad/Sum_1Sumgradients/Minimum_grad/Select_1.gradients/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients/Minimum_grad/Reshape_1Reshapegradients/Minimum_grad/Sum_1gradients/Minimum_grad/Shape_1*
T0*
Tshape0
s
'gradients/Minimum_grad/tuple/group_depsNoOp^gradients/Minimum_grad/Reshape!^gradients/Minimum_grad/Reshape_1
�
/gradients/Minimum_grad/tuple/control_dependencyIdentitygradients/Minimum_grad/Reshape(^gradients/Minimum_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Minimum_grad/Reshape
�
1gradients/Minimum_grad/tuple/control_dependency_1Identity gradients/Minimum_grad/Reshape_1(^gradients/Minimum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/Minimum_grad/Reshape_1
Q
#gradients/Mean_1_grad/Reshape/shapeConst*
dtype0*
valueB:
�
gradients/Mean_1_grad/ReshapeReshape4gradients/Mean_3/input_grad/tuple/control_dependency#gradients/Mean_1_grad/Reshape/shape*
T0*
Tshape0
Q
gradients/Mean_1_grad/ShapeShapeDynamicPartition:1*
T0*
out_type0
y
gradients/Mean_1_grad/TileTilegradients/Mean_1_grad/Reshapegradients/Mean_1_grad/Shape*

Tmultiples0*
T0
S
gradients/Mean_1_grad/Shape_1ShapeDynamicPartition:1*
T0*
out_type0
F
gradients/Mean_1_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_1_grad/ConstConst*
dtype0*
valueB: 
�
gradients/Mean_1_grad/ProdProdgradients/Mean_1_grad/Shape_1gradients/Mean_1_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_1_grad/Const_1Const*
dtype0*
valueB: 
�
gradients/Mean_1_grad/Prod_1Prodgradients/Mean_1_grad/Shape_2gradients/Mean_1_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_1_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_1_grad/MaximumMaximumgradients/Mean_1_grad/Prod_1gradients/Mean_1_grad/Maximum/y*
T0
n
gradients/Mean_1_grad/floordivFloorDivgradients/Mean_1_grad/Prodgradients/Mean_1_grad/Maximum*
T0
j
gradients/Mean_1_grad/CastCastgradients/Mean_1_grad/floordiv*
Truncate( *

DstT0*

SrcT0
i
gradients/Mean_1_grad/truedivRealDivgradients/Mean_1_grad/Tilegradients/Mean_1_grad/Cast*
T0
Q
#gradients/Mean_2_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients/Mean_2_grad/ReshapeReshape6gradients/Mean_3/input_grad/tuple/control_dependency_1#gradients/Mean_2_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_2_grad/ShapeShapeDynamicPartition_1:1*
T0*
out_type0
y
gradients/Mean_2_grad/TileTilegradients/Mean_2_grad/Reshapegradients/Mean_2_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_2_grad/Shape_1ShapeDynamicPartition_1:1*
T0*
out_type0
F
gradients/Mean_2_grad/Shape_2Const*
dtype0*
valueB 
I
gradients/Mean_2_grad/ConstConst*
valueB: *
dtype0
�
gradients/Mean_2_grad/ProdProdgradients/Mean_2_grad/Shape_1gradients/Mean_2_grad/Const*
T0*

Tidx0*
	keep_dims( 
K
gradients/Mean_2_grad/Const_1Const*
valueB: *
dtype0
�
gradients/Mean_2_grad/Prod_1Prodgradients/Mean_2_grad/Shape_2gradients/Mean_2_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_2_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_2_grad/MaximumMaximumgradients/Mean_2_grad/Prod_1gradients/Mean_2_grad/Maximum/y*
T0
n
gradients/Mean_2_grad/floordivFloorDivgradients/Mean_2_grad/Prodgradients/Mean_2_grad/Maximum*
T0
j
gradients/Mean_2_grad/CastCastgradients/Mean_2_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_2_grad/truedivRealDivgradients/Mean_2_grad/Tilegradients/Mean_2_grad/Cast*
T0
a
gradients/stack_grad/unstackUnpackgradients/Sum_8_grad/Tile*
T0*	
num*

axis
L
%gradients/stack_grad/tuple/group_depsNoOp^gradients/stack_grad/unstack
�
-gradients/stack_grad/tuple/control_dependencyIdentitygradients/stack_grad/unstack&^gradients/stack_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/stack_grad/unstack
�
/gradients/stack_grad/tuple/control_dependency_1Identitygradients/stack_grad/unstack:1&^gradients/stack_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/stack_grad/unstack
�
/gradients/stack_grad/tuple/control_dependency_2Identitygradients/stack_grad/unstack:2&^gradients/stack_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/stack_grad/unstack
A
gradients/mul_7_grad/ShapeShapeExp*
T0*
out_type0
J
gradients/mul_7_grad/Shape_1Shape
ExpandDims*
T0*
out_type0
�
*gradients/mul_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_7_grad/Shapegradients/mul_7_grad/Shape_1*
T0
e
gradients/mul_7_grad/MulMul/gradients/Minimum_grad/tuple/control_dependency
ExpandDims*
T0
�
gradients/mul_7_grad/SumSumgradients/mul_7_grad/Mul*gradients/mul_7_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/mul_7_grad/ReshapeReshapegradients/mul_7_grad/Sumgradients/mul_7_grad/Shape*
T0*
Tshape0
`
gradients/mul_7_grad/Mul_1MulExp/gradients/Minimum_grad/tuple/control_dependency*
T0
�
gradients/mul_7_grad/Sum_1Sumgradients/mul_7_grad/Mul_1,gradients/mul_7_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/mul_7_grad/Reshape_1Reshapegradients/mul_7_grad/Sum_1gradients/mul_7_grad/Shape_1*
T0*
Tshape0
m
%gradients/mul_7_grad/tuple/group_depsNoOp^gradients/mul_7_grad/Reshape^gradients/mul_7_grad/Reshape_1
�
-gradients/mul_7_grad/tuple/control_dependencyIdentitygradients/mul_7_grad/Reshape&^gradients/mul_7_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_7_grad/Reshape
�
/gradients/mul_7_grad/tuple/control_dependency_1Identitygradients/mul_7_grad/Reshape_1&^gradients/mul_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_7_grad/Reshape_1
M
gradients/mul_8_grad/ShapeShapeclip_by_value_2*
T0*
out_type0
J
gradients/mul_8_grad/Shape_1Shape
ExpandDims*
T0*
out_type0
�
*gradients/mul_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_8_grad/Shapegradients/mul_8_grad/Shape_1*
T0
g
gradients/mul_8_grad/MulMul1gradients/Minimum_grad/tuple/control_dependency_1
ExpandDims*
T0
�
gradients/mul_8_grad/SumSumgradients/mul_8_grad/Mul*gradients/mul_8_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/mul_8_grad/ReshapeReshapegradients/mul_8_grad/Sumgradients/mul_8_grad/Shape*
T0*
Tshape0
n
gradients/mul_8_grad/Mul_1Mulclip_by_value_21gradients/Minimum_grad/tuple/control_dependency_1*
T0
�
gradients/mul_8_grad/Sum_1Sumgradients/mul_8_grad/Mul_1,gradients/mul_8_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/mul_8_grad/Reshape_1Reshapegradients/mul_8_grad/Sum_1gradients/mul_8_grad/Shape_1*
T0*
Tshape0
m
%gradients/mul_8_grad/tuple/group_depsNoOp^gradients/mul_8_grad/Reshape^gradients/mul_8_grad/Reshape_1
�
-gradients/mul_8_grad/tuple/control_dependencyIdentitygradients/mul_8_grad/Reshape&^gradients/mul_8_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_8_grad/Reshape
�
/gradients/mul_8_grad/tuple/control_dependency_1Identitygradients/mul_8_grad/Reshape_1&^gradients/mul_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_8_grad/Reshape_1
>
gradients/zeros_like_2	ZerosLikeDynamicPartition*
T0
M
%gradients/DynamicPartition_grad/ShapeShapeCast*
T0*
out_type0
S
%gradients/DynamicPartition_grad/ConstConst*
valueB: *
dtype0
�
$gradients/DynamicPartition_grad/ProdProd%gradients/DynamicPartition_grad/Shape%gradients/DynamicPartition_grad/Const*

Tidx0*
	keep_dims( *
T0
U
+gradients/DynamicPartition_grad/range/startConst*
value	B : *
dtype0
U
+gradients/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0
�
%gradients/DynamicPartition_grad/rangeRange+gradients/DynamicPartition_grad/range/start$gradients/DynamicPartition_grad/Prod+gradients/DynamicPartition_grad/range/delta*

Tidx0
�
'gradients/DynamicPartition_grad/ReshapeReshape%gradients/DynamicPartition_grad/range%gradients/DynamicPartition_grad/Shape*
T0*
Tshape0
�
0gradients/DynamicPartition_grad/DynamicPartitionDynamicPartition'gradients/DynamicPartition_grad/ReshapeCast*
T0*
num_partitions
�
-gradients/DynamicPartition_grad/DynamicStitchDynamicStitch0gradients/DynamicPartition_grad/DynamicPartition2gradients/DynamicPartition_grad/DynamicPartition:1gradients/zeros_like_2gradients/Mean_1_grad/truediv*
T0*
N
R
'gradients/DynamicPartition_grad/Shape_1ShapeMaximum*
T0*
out_type0
�
)gradients/DynamicPartition_grad/Reshape_1Reshape-gradients/DynamicPartition_grad/DynamicStitch'gradients/DynamicPartition_grad/Shape_1*
T0*
Tshape0
@
gradients/zeros_like_3	ZerosLikeDynamicPartition_1*
T0
O
'gradients/DynamicPartition_1_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients/DynamicPartition_1_grad/ConstConst*
valueB: *
dtype0
�
&gradients/DynamicPartition_1_grad/ProdProd'gradients/DynamicPartition_1_grad/Shape'gradients/DynamicPartition_1_grad/Const*
T0*

Tidx0*
	keep_dims( 
W
-gradients/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_1_grad/range/deltaConst*
dtype0*
value	B :
�
'gradients/DynamicPartition_1_grad/rangeRange-gradients/DynamicPartition_1_grad/range/start&gradients/DynamicPartition_1_grad/Prod-gradients/DynamicPartition_1_grad/range/delta*

Tidx0
�
)gradients/DynamicPartition_1_grad/ReshapeReshape'gradients/DynamicPartition_1_grad/range'gradients/DynamicPartition_1_grad/Shape*
T0*
Tshape0
�
2gradients/DynamicPartition_1_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_1_grad/ReshapeCast*
num_partitions*
T0
�
/gradients/DynamicPartition_1_grad/DynamicStitchDynamicStitch2gradients/DynamicPartition_1_grad/DynamicPartition4gradients/DynamicPartition_1_grad/DynamicPartition:1gradients/zeros_like_3gradients/Mean_2_grad/truediv*
T0*
N
V
)gradients/DynamicPartition_1_grad/Shape_1Shape	Maximum_1*
T0*
out_type0
�
+gradients/DynamicPartition_1_grad/Reshape_1Reshape/gradients/DynamicPartition_1_grad/DynamicStitch)gradients/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0
�
@gradients/softmax_cross_entropy_with_logits/Reshape_2_grad/ShapeShape!softmax_cross_entropy_with_logits*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeReshape-gradients/stack_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits/Reshape_2_grad/Shape*
T0*
Tshape0
�
Bgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_1*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeReshape/gradients/stack_grad/tuple/control_dependency_1Bgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/Shape*
T0*
Tshape0
�
Bgradients/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_2*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ReshapeReshape/gradients/stack_grad/tuple/control_dependency_2Bgradients/softmax_cross_entropy_with_logits_2/Reshape_2_grad/Shape*
T0*
Tshape0
_
$gradients/clip_by_value_2_grad/ShapeShapeclip_by_value_2/Minimum*
T0*
out_type0
O
&gradients/clip_by_value_2_grad/Shape_1Const*
valueB *
dtype0
w
&gradients/clip_by_value_2_grad/Shape_2Shape-gradients/mul_8_grad/tuple/control_dependency*
T0*
out_type0
W
*gradients/clip_by_value_2_grad/zeros/ConstConst*
dtype0*
valueB
 *    
�
$gradients/clip_by_value_2_grad/zerosFill&gradients/clip_by_value_2_grad/Shape_2*gradients/clip_by_value_2_grad/zeros/Const*
T0*

index_type0
d
+gradients/clip_by_value_2_grad/GreaterEqualGreaterEqualclip_by_value_2/Minimumsub_6*
T0
�
4gradients/clip_by_value_2_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients/clip_by_value_2_grad/Shape&gradients/clip_by_value_2_grad/Shape_1*
T0
�
%gradients/clip_by_value_2_grad/SelectSelect+gradients/clip_by_value_2_grad/GreaterEqual-gradients/mul_8_grad/tuple/control_dependency$gradients/clip_by_value_2_grad/zeros*
T0
�
"gradients/clip_by_value_2_grad/SumSum%gradients/clip_by_value_2_grad/Select4gradients/clip_by_value_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
&gradients/clip_by_value_2_grad/ReshapeReshape"gradients/clip_by_value_2_grad/Sum$gradients/clip_by_value_2_grad/Shape*
T0*
Tshape0
�
'gradients/clip_by_value_2_grad/Select_1Select+gradients/clip_by_value_2_grad/GreaterEqual$gradients/clip_by_value_2_grad/zeros-gradients/mul_8_grad/tuple/control_dependency*
T0
�
$gradients/clip_by_value_2_grad/Sum_1Sum'gradients/clip_by_value_2_grad/Select_16gradients/clip_by_value_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
(gradients/clip_by_value_2_grad/Reshape_1Reshape$gradients/clip_by_value_2_grad/Sum_1&gradients/clip_by_value_2_grad/Shape_1*
T0*
Tshape0
�
/gradients/clip_by_value_2_grad/tuple/group_depsNoOp'^gradients/clip_by_value_2_grad/Reshape)^gradients/clip_by_value_2_grad/Reshape_1
�
7gradients/clip_by_value_2_grad/tuple/control_dependencyIdentity&gradients/clip_by_value_2_grad/Reshape0^gradients/clip_by_value_2_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_2_grad/Reshape
�
9gradients/clip_by_value_2_grad/tuple/control_dependency_1Identity(gradients/clip_by_value_2_grad/Reshape_10^gradients/clip_by_value_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/clip_by_value_2_grad/Reshape_1
Q
gradients/Maximum_grad/ShapeShapeSquaredDifference*
T0*
out_type0
U
gradients/Maximum_grad/Shape_1ShapeSquaredDifference_1*
T0*
out_type0
k
gradients/Maximum_grad/Shape_2Shape)gradients/DynamicPartition_grad/Reshape_1*
T0*
out_type0
O
"gradients/Maximum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
gradients/Maximum_grad/zerosFillgradients/Maximum_grad/Shape_2"gradients/Maximum_grad/zeros/Const*
T0*

index_type0
d
#gradients/Maximum_grad/GreaterEqualGreaterEqualSquaredDifferenceSquaredDifference_1*
T0
�
,gradients/Maximum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Maximum_grad/Shapegradients/Maximum_grad/Shape_1*
T0
�
gradients/Maximum_grad/SelectSelect#gradients/Maximum_grad/GreaterEqual)gradients/DynamicPartition_grad/Reshape_1gradients/Maximum_grad/zeros*
T0
�
gradients/Maximum_grad/SumSumgradients/Maximum_grad/Select,gradients/Maximum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients/Maximum_grad/ReshapeReshapegradients/Maximum_grad/Sumgradients/Maximum_grad/Shape*
T0*
Tshape0
�
gradients/Maximum_grad/Select_1Select#gradients/Maximum_grad/GreaterEqualgradients/Maximum_grad/zeros)gradients/DynamicPartition_grad/Reshape_1*
T0
�
gradients/Maximum_grad/Sum_1Sumgradients/Maximum_grad/Select_1.gradients/Maximum_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
 gradients/Maximum_grad/Reshape_1Reshapegradients/Maximum_grad/Sum_1gradients/Maximum_grad/Shape_1*
T0*
Tshape0
s
'gradients/Maximum_grad/tuple/group_depsNoOp^gradients/Maximum_grad/Reshape!^gradients/Maximum_grad/Reshape_1
�
/gradients/Maximum_grad/tuple/control_dependencyIdentitygradients/Maximum_grad/Reshape(^gradients/Maximum_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Maximum_grad/Reshape
�
1gradients/Maximum_grad/tuple/control_dependency_1Identity gradients/Maximum_grad/Reshape_1(^gradients/Maximum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/Maximum_grad/Reshape_1
U
gradients/Maximum_1_grad/ShapeShapeSquaredDifference_2*
T0*
out_type0
W
 gradients/Maximum_1_grad/Shape_1ShapeSquaredDifference_3*
T0*
out_type0
o
 gradients/Maximum_1_grad/Shape_2Shape+gradients/DynamicPartition_1_grad/Reshape_1*
T0*
out_type0
Q
$gradients/Maximum_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
gradients/Maximum_1_grad/zerosFill gradients/Maximum_1_grad/Shape_2$gradients/Maximum_1_grad/zeros/Const*
T0*

index_type0
h
%gradients/Maximum_1_grad/GreaterEqualGreaterEqualSquaredDifference_2SquaredDifference_3*
T0
�
.gradients/Maximum_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Maximum_1_grad/Shape gradients/Maximum_1_grad/Shape_1*
T0
�
gradients/Maximum_1_grad/SelectSelect%gradients/Maximum_1_grad/GreaterEqual+gradients/DynamicPartition_1_grad/Reshape_1gradients/Maximum_1_grad/zeros*
T0
�
gradients/Maximum_1_grad/SumSumgradients/Maximum_1_grad/Select.gradients/Maximum_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
 gradients/Maximum_1_grad/ReshapeReshapegradients/Maximum_1_grad/Sumgradients/Maximum_1_grad/Shape*
T0*
Tshape0
�
!gradients/Maximum_1_grad/Select_1Select%gradients/Maximum_1_grad/GreaterEqualgradients/Maximum_1_grad/zeros+gradients/DynamicPartition_1_grad/Reshape_1*
T0
�
gradients/Maximum_1_grad/Sum_1Sum!gradients/Maximum_1_grad/Select_10gradients/Maximum_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
"gradients/Maximum_1_grad/Reshape_1Reshapegradients/Maximum_1_grad/Sum_1 gradients/Maximum_1_grad/Shape_1*
T0*
Tshape0
y
)gradients/Maximum_1_grad/tuple/group_depsNoOp!^gradients/Maximum_1_grad/Reshape#^gradients/Maximum_1_grad/Reshape_1
�
1gradients/Maximum_1_grad/tuple/control_dependencyIdentity gradients/Maximum_1_grad/Reshape*^gradients/Maximum_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/Maximum_1_grad/Reshape
�
3gradients/Maximum_1_grad/tuple/control_dependency_1Identity"gradients/Maximum_1_grad/Reshape_1*^gradients/Maximum_1_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/Maximum_1_grad/Reshape_1
Q
gradients/zeros_like_4	ZerosLike#softmax_cross_entropy_with_logits:1*
T0
r
?gradients/softmax_cross_entropy_with_logits_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
;gradients/softmax_cross_entropy_with_logits_grad/ExpandDims
ExpandDimsBgradients/softmax_cross_entropy_with_logits/Reshape_2_grad/Reshape?gradients/softmax_cross_entropy_with_logits_grad/ExpandDims/dim*

Tdim0*
T0
�
4gradients/softmax_cross_entropy_with_logits_grad/mulMul;gradients/softmax_cross_entropy_with_logits_grad/ExpandDims#softmax_cross_entropy_with_logits:1*
T0
}
;gradients/softmax_cross_entropy_with_logits_grad/LogSoftmax
LogSoftmax)softmax_cross_entropy_with_logits/Reshape*
T0
�
4gradients/softmax_cross_entropy_with_logits_grad/NegNeg;gradients/softmax_cross_entropy_with_logits_grad/LogSoftmax*
T0
t
Agradients/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
=gradients/softmax_cross_entropy_with_logits_grad/ExpandDims_1
ExpandDimsBgradients/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dim*

Tdim0*
T0
�
6gradients/softmax_cross_entropy_with_logits_grad/mul_1Mul=gradients/softmax_cross_entropy_with_logits_grad/ExpandDims_14gradients/softmax_cross_entropy_with_logits_grad/Neg*
T0
�
Agradients/softmax_cross_entropy_with_logits_grad/tuple/group_depsNoOp5^gradients/softmax_cross_entropy_with_logits_grad/mul7^gradients/softmax_cross_entropy_with_logits_grad/mul_1
�
Igradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyIdentity4gradients/softmax_cross_entropy_with_logits_grad/mulB^gradients/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/softmax_cross_entropy_with_logits_grad/mul
�
Kgradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Identity6gradients/softmax_cross_entropy_with_logits_grad/mul_1B^gradients/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_grad/mul_1
S
gradients/zeros_like_5	ZerosLike%softmax_cross_entropy_with_logits_1:1*
T0
t
Agradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
=gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims
ExpandDimsDgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dim*

Tdim0*
T0
�
6gradients/softmax_cross_entropy_with_logits_1_grad/mulMul=gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims%softmax_cross_entropy_with_logits_1:1*
T0
�
=gradients/softmax_cross_entropy_with_logits_1_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_1/Reshape*
T0
�
6gradients/softmax_cross_entropy_with_logits_1_grad/NegNeg=gradients/softmax_cross_entropy_with_logits_1_grad/LogSoftmax*
T0
v
Cgradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dimConst*
dtype0*
valueB :
���������
�
?gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1
ExpandDimsDgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeCgradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dim*

Tdim0*
T0
�
8gradients/softmax_cross_entropy_with_logits_1_grad/mul_1Mul?gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_16gradients/softmax_cross_entropy_with_logits_1_grad/Neg*
T0
�
Cgradients/softmax_cross_entropy_with_logits_1_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_with_logits_1_grad/mul9^gradients/softmax_cross_entropy_with_logits_1_grad/mul_1
�
Kgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_with_logits_1_grad/mulD^gradients/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_1_grad/mul
�
Mgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_with_logits_1_grad/mul_1D^gradients/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/softmax_cross_entropy_with_logits_1_grad/mul_1
S
gradients/zeros_like_6	ZerosLike%softmax_cross_entropy_with_logits_2:1*
T0
t
Agradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
=gradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims
ExpandDimsDgradients/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims/dim*
T0*

Tdim0
�
6gradients/softmax_cross_entropy_with_logits_2_grad/mulMul=gradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims%softmax_cross_entropy_with_logits_2:1*
T0
�
=gradients/softmax_cross_entropy_with_logits_2_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_2/Reshape*
T0
�
6gradients/softmax_cross_entropy_with_logits_2_grad/NegNeg=gradients/softmax_cross_entropy_with_logits_2_grad/LogSoftmax*
T0
v
Cgradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
?gradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims_1
ExpandDimsDgradients/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ReshapeCgradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims_1/dim*

Tdim0*
T0
�
8gradients/softmax_cross_entropy_with_logits_2_grad/mul_1Mul?gradients/softmax_cross_entropy_with_logits_2_grad/ExpandDims_16gradients/softmax_cross_entropy_with_logits_2_grad/Neg*
T0
�
Cgradients/softmax_cross_entropy_with_logits_2_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_with_logits_2_grad/mul9^gradients/softmax_cross_entropy_with_logits_2_grad/mul_1
�
Kgradients/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_with_logits_2_grad/mulD^gradients/softmax_cross_entropy_with_logits_2_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_2_grad/mul
�
Mgradients/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_with_logits_2_grad/mul_1D^gradients/softmax_cross_entropy_with_logits_2_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/softmax_cross_entropy_with_logits_2_grad/mul_1
S
,gradients/clip_by_value_2/Minimum_grad/ShapeShapeExp*
T0*
out_type0
W
.gradients/clip_by_value_2/Minimum_grad/Shape_1Const*
valueB *
dtype0
�
.gradients/clip_by_value_2/Minimum_grad/Shape_2Shape7gradients/clip_by_value_2_grad/tuple/control_dependency*
T0*
out_type0
_
2gradients/clip_by_value_2/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
,gradients/clip_by_value_2/Minimum_grad/zerosFill.gradients/clip_by_value_2/Minimum_grad/Shape_22gradients/clip_by_value_2/Minimum_grad/zeros/Const*
T0*

index_type0
S
0gradients/clip_by_value_2/Minimum_grad/LessEqual	LessEqualExpadd_25*
T0
�
<gradients/clip_by_value_2/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/clip_by_value_2/Minimum_grad/Shape.gradients/clip_by_value_2/Minimum_grad/Shape_1*
T0
�
-gradients/clip_by_value_2/Minimum_grad/SelectSelect0gradients/clip_by_value_2/Minimum_grad/LessEqual7gradients/clip_by_value_2_grad/tuple/control_dependency,gradients/clip_by_value_2/Minimum_grad/zeros*
T0
�
*gradients/clip_by_value_2/Minimum_grad/SumSum-gradients/clip_by_value_2/Minimum_grad/Select<gradients/clip_by_value_2/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
.gradients/clip_by_value_2/Minimum_grad/ReshapeReshape*gradients/clip_by_value_2/Minimum_grad/Sum,gradients/clip_by_value_2/Minimum_grad/Shape*
T0*
Tshape0
�
/gradients/clip_by_value_2/Minimum_grad/Select_1Select0gradients/clip_by_value_2/Minimum_grad/LessEqual,gradients/clip_by_value_2/Minimum_grad/zeros7gradients/clip_by_value_2_grad/tuple/control_dependency*
T0
�
,gradients/clip_by_value_2/Minimum_grad/Sum_1Sum/gradients/clip_by_value_2/Minimum_grad/Select_1>gradients/clip_by_value_2/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
0gradients/clip_by_value_2/Minimum_grad/Reshape_1Reshape,gradients/clip_by_value_2/Minimum_grad/Sum_1.gradients/clip_by_value_2/Minimum_grad/Shape_1*
T0*
Tshape0
�
7gradients/clip_by_value_2/Minimum_grad/tuple/group_depsNoOp/^gradients/clip_by_value_2/Minimum_grad/Reshape1^gradients/clip_by_value_2/Minimum_grad/Reshape_1
�
?gradients/clip_by_value_2/Minimum_grad/tuple/control_dependencyIdentity.gradients/clip_by_value_2/Minimum_grad/Reshape8^gradients/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value_2/Minimum_grad/Reshape
�
Agradients/clip_by_value_2/Minimum_grad/tuple/control_dependency_1Identity0gradients/clip_by_value_2/Minimum_grad/Reshape_18^gradients/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/clip_by_value_2/Minimum_grad/Reshape_1
�
'gradients/SquaredDifference_grad/scalarConst0^gradients/Maximum_grad/tuple/control_dependency*
valueB
 *   @*
dtype0
�
$gradients/SquaredDifference_grad/MulMul'gradients/SquaredDifference_grad/scalar/gradients/Maximum_grad/tuple/control_dependency*
T0
�
$gradients/SquaredDifference_grad/subSubextrinsic_returnsSum_120^gradients/Maximum_grad/tuple/control_dependency*
T0
�
&gradients/SquaredDifference_grad/mul_1Mul$gradients/SquaredDifference_grad/Mul$gradients/SquaredDifference_grad/sub*
T0
[
&gradients/SquaredDifference_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
R
(gradients/SquaredDifference_grad/Shape_1ShapeSum_12*
T0*
out_type0
�
6gradients/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/SquaredDifference_grad/Shape(gradients/SquaredDifference_grad/Shape_1*
T0
�
$gradients/SquaredDifference_grad/SumSum&gradients/SquaredDifference_grad/mul_16gradients/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
(gradients/SquaredDifference_grad/ReshapeReshape$gradients/SquaredDifference_grad/Sum&gradients/SquaredDifference_grad/Shape*
T0*
Tshape0
�
&gradients/SquaredDifference_grad/Sum_1Sum&gradients/SquaredDifference_grad/mul_18gradients/SquaredDifference_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
*gradients/SquaredDifference_grad/Reshape_1Reshape&gradients/SquaredDifference_grad/Sum_1(gradients/SquaredDifference_grad/Shape_1*
T0*
Tshape0
`
$gradients/SquaredDifference_grad/NegNeg*gradients/SquaredDifference_grad/Reshape_1*
T0
�
1gradients/SquaredDifference_grad/tuple/group_depsNoOp%^gradients/SquaredDifference_grad/Neg)^gradients/SquaredDifference_grad/Reshape
�
9gradients/SquaredDifference_grad/tuple/control_dependencyIdentity(gradients/SquaredDifference_grad/Reshape2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/SquaredDifference_grad/Reshape
�
;gradients/SquaredDifference_grad/tuple/control_dependency_1Identity$gradients/SquaredDifference_grad/Neg2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/SquaredDifference_grad/Neg
�
)gradients/SquaredDifference_1_grad/scalarConst2^gradients/Maximum_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0
�
&gradients/SquaredDifference_1_grad/MulMul)gradients/SquaredDifference_1_grad/scalar1gradients/Maximum_grad/tuple/control_dependency_1*
T0
�
&gradients/SquaredDifference_1_grad/subSubextrinsic_returnsadd_232^gradients/Maximum_grad/tuple/control_dependency_1*
T0
�
(gradients/SquaredDifference_1_grad/mul_1Mul&gradients/SquaredDifference_1_grad/Mul&gradients/SquaredDifference_1_grad/sub*
T0
]
(gradients/SquaredDifference_1_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
T
*gradients/SquaredDifference_1_grad/Shape_1Shapeadd_23*
T0*
out_type0
�
8gradients/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_1_grad/Shape*gradients/SquaredDifference_1_grad/Shape_1*
T0
�
&gradients/SquaredDifference_1_grad/SumSum(gradients/SquaredDifference_1_grad/mul_18gradients/SquaredDifference_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
*gradients/SquaredDifference_1_grad/ReshapeReshape&gradients/SquaredDifference_1_grad/Sum(gradients/SquaredDifference_1_grad/Shape*
T0*
Tshape0
�
(gradients/SquaredDifference_1_grad/Sum_1Sum(gradients/SquaredDifference_1_grad/mul_1:gradients/SquaredDifference_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
,gradients/SquaredDifference_1_grad/Reshape_1Reshape(gradients/SquaredDifference_1_grad/Sum_1*gradients/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_1_grad/NegNeg,gradients/SquaredDifference_1_grad/Reshape_1*
T0
�
3gradients/SquaredDifference_1_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_1_grad/Neg+^gradients/SquaredDifference_1_grad/Reshape
�
;gradients/SquaredDifference_1_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_1_grad/Reshape4^gradients/SquaredDifference_1_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_1_grad/Reshape
�
=gradients/SquaredDifference_1_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_1_grad/Neg4^gradients/SquaredDifference_1_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_1_grad/Neg
�
)gradients/SquaredDifference_2_grad/scalarConst2^gradients/Maximum_1_grad/tuple/control_dependency*
valueB
 *   @*
dtype0
�
&gradients/SquaredDifference_2_grad/MulMul)gradients/SquaredDifference_2_grad/scalar1gradients/Maximum_1_grad/tuple/control_dependency*
T0
�
&gradients/SquaredDifference_2_grad/subSubcuriosity_returnsSum_142^gradients/Maximum_1_grad/tuple/control_dependency*
T0
�
(gradients/SquaredDifference_2_grad/mul_1Mul&gradients/SquaredDifference_2_grad/Mul&gradients/SquaredDifference_2_grad/sub*
T0
]
(gradients/SquaredDifference_2_grad/ShapeShapecuriosity_returns*
T0*
out_type0
T
*gradients/SquaredDifference_2_grad/Shape_1ShapeSum_14*
T0*
out_type0
�
8gradients/SquaredDifference_2_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_2_grad/Shape*gradients/SquaredDifference_2_grad/Shape_1*
T0
�
&gradients/SquaredDifference_2_grad/SumSum(gradients/SquaredDifference_2_grad/mul_18gradients/SquaredDifference_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
*gradients/SquaredDifference_2_grad/ReshapeReshape&gradients/SquaredDifference_2_grad/Sum(gradients/SquaredDifference_2_grad/Shape*
T0*
Tshape0
�
(gradients/SquaredDifference_2_grad/Sum_1Sum(gradients/SquaredDifference_2_grad/mul_1:gradients/SquaredDifference_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
,gradients/SquaredDifference_2_grad/Reshape_1Reshape(gradients/SquaredDifference_2_grad/Sum_1*gradients/SquaredDifference_2_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_2_grad/NegNeg,gradients/SquaredDifference_2_grad/Reshape_1*
T0
�
3gradients/SquaredDifference_2_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_2_grad/Neg+^gradients/SquaredDifference_2_grad/Reshape
�
;gradients/SquaredDifference_2_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_2_grad/Reshape4^gradients/SquaredDifference_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_2_grad/Reshape
�
=gradients/SquaredDifference_2_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_2_grad/Neg4^gradients/SquaredDifference_2_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_2_grad/Neg
�
)gradients/SquaredDifference_3_grad/scalarConst4^gradients/Maximum_1_grad/tuple/control_dependency_1*
dtype0*
valueB
 *   @
�
&gradients/SquaredDifference_3_grad/MulMul)gradients/SquaredDifference_3_grad/scalar3gradients/Maximum_1_grad/tuple/control_dependency_1*
T0
�
&gradients/SquaredDifference_3_grad/subSubcuriosity_returnsadd_244^gradients/Maximum_1_grad/tuple/control_dependency_1*
T0
�
(gradients/SquaredDifference_3_grad/mul_1Mul&gradients/SquaredDifference_3_grad/Mul&gradients/SquaredDifference_3_grad/sub*
T0
]
(gradients/SquaredDifference_3_grad/ShapeShapecuriosity_returns*
T0*
out_type0
T
*gradients/SquaredDifference_3_grad/Shape_1Shapeadd_24*
T0*
out_type0
�
8gradients/SquaredDifference_3_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_3_grad/Shape*gradients/SquaredDifference_3_grad/Shape_1*
T0
�
&gradients/SquaredDifference_3_grad/SumSum(gradients/SquaredDifference_3_grad/mul_18gradients/SquaredDifference_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
*gradients/SquaredDifference_3_grad/ReshapeReshape&gradients/SquaredDifference_3_grad/Sum(gradients/SquaredDifference_3_grad/Shape*
T0*
Tshape0
�
(gradients/SquaredDifference_3_grad/Sum_1Sum(gradients/SquaredDifference_3_grad/mul_1:gradients/SquaredDifference_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
,gradients/SquaredDifference_3_grad/Reshape_1Reshape(gradients/SquaredDifference_3_grad/Sum_1*gradients/SquaredDifference_3_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_3_grad/NegNeg,gradients/SquaredDifference_3_grad/Reshape_1*
T0
�
3gradients/SquaredDifference_3_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_3_grad/Neg+^gradients/SquaredDifference_3_grad/Reshape
�
;gradients/SquaredDifference_3_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_3_grad/Reshape4^gradients/SquaredDifference_3_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_3_grad/Reshape
�
=gradients/SquaredDifference_3_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_3_grad/Neg4^gradients/SquaredDifference_3_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_3_grad/Neg
r
>gradients/softmax_cross_entropy_with_logits/Reshape_grad/ShapeShapestrided_slice_21*
T0*
out_type0
�
@gradients/softmax_cross_entropy_with_logits/Reshape_grad/ReshapeReshapeIgradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependency>gradients/softmax_cross_entropy_with_logits/Reshape_grad/Shape*
T0*
Tshape0
m
@gradients/softmax_cross_entropy_with_logits/Reshape_1_grad/ShapeShape	Softmax_6*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits/Reshape_1_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1@gradients/softmax_cross_entropy_with_logits/Reshape_1_grad/Shape*
T0*
Tshape0
t
@gradients/softmax_cross_entropy_with_logits_1/Reshape_grad/ShapeShapestrided_slice_23*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits_1/Reshape_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits_1/Reshape_grad/Shape*
T0*
Tshape0
o
Bgradients/softmax_cross_entropy_with_logits_1/Reshape_1_grad/ShapeShape	Softmax_7*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_1/Reshape_1_grad/ReshapeReshapeMgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1Bgradients/softmax_cross_entropy_with_logits_1/Reshape_1_grad/Shape*
T0*
Tshape0
t
@gradients/softmax_cross_entropy_with_logits_2/Reshape_grad/ShapeShapestrided_slice_25*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits_2/Reshape_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits_2/Reshape_grad/Shape*
T0*
Tshape0
o
Bgradients/softmax_cross_entropy_with_logits_2/Reshape_1_grad/ShapeShape	Softmax_8*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_2/Reshape_1_grad/ReshapeReshapeMgradients/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependency_1Bgradients/softmax_cross_entropy_with_logits_2/Reshape_1_grad/Shape*
T0*
Tshape0
�
gradients/AddNAddN-gradients/mul_7_grad/tuple/control_dependency?gradients/clip_by_value_2/Minimum_grad/tuple/control_dependency*
T0*/
_class%
#!loc:@gradients/mul_7_grad/Reshape*
N
;
gradients/Exp_grad/mulMulgradients/AddNExp*
T0
V
gradients/Sum_12_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
t
gradients/Sum_12_grad/SizeConst*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_12_grad/addAddV2Sum_12/reduction_indicesgradients/Sum_12_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_12_grad/Shape
�
gradients/Sum_12_grad/modFloorModgradients/Sum_12_grad/addgradients/Sum_12_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_12_grad/Shape
v
gradients/Sum_12_grad/Shape_1Const*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
valueB *
dtype0
{
!gradients/Sum_12_grad/range/startConst*
dtype0*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
value	B : 
{
!gradients/Sum_12_grad/range/deltaConst*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_12_grad/rangeRange!gradients/Sum_12_grad/range/startgradients/Sum_12_grad/Size!gradients/Sum_12_grad/range/delta*

Tidx0*.
_class$
" loc:@gradients/Sum_12_grad/Shape
z
 gradients/Sum_12_grad/Fill/valueConst*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_12_grad/FillFillgradients/Sum_12_grad/Shape_1 gradients/Sum_12_grad/Fill/value*
T0*.
_class$
" loc:@gradients/Sum_12_grad/Shape*

index_type0
�
#gradients/Sum_12_grad/DynamicStitchDynamicStitchgradients/Sum_12_grad/rangegradients/Sum_12_grad/modgradients/Sum_12_grad/Shapegradients/Sum_12_grad/Fill*
T0*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
N
y
gradients/Sum_12_grad/Maximum/yConst*
dtype0*.
_class$
" loc:@gradients/Sum_12_grad/Shape*
value	B :
�
gradients/Sum_12_grad/MaximumMaximum#gradients/Sum_12_grad/DynamicStitchgradients/Sum_12_grad/Maximum/y*
T0*.
_class$
" loc:@gradients/Sum_12_grad/Shape
�
gradients/Sum_12_grad/floordivFloorDivgradients/Sum_12_grad/Shapegradients/Sum_12_grad/Maximum*
T0*.
_class$
" loc:@gradients/Sum_12_grad/Shape
�
gradients/Sum_12_grad/ReshapeReshape;gradients/SquaredDifference_grad/tuple/control_dependency_1#gradients/Sum_12_grad/DynamicStitch*
T0*
Tshape0
|
gradients/Sum_12_grad/TileTilegradients/Sum_12_grad/Reshapegradients/Sum_12_grad/floordiv*

Tmultiples0*
T0
W
gradients/add_23_grad/ShapeShapeextrinsic_value_estimate*
T0*
out_type0
N
gradients/add_23_grad/Shape_1Shapeclip_by_value*
T0*
out_type0
�
+gradients/add_23_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_23_grad/Shapegradients/add_23_grad/Shape_1*
T0
�
gradients/add_23_grad/SumSum=gradients/SquaredDifference_1_grad/tuple/control_dependency_1+gradients/add_23_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
w
gradients/add_23_grad/ReshapeReshapegradients/add_23_grad/Sumgradients/add_23_grad/Shape*
T0*
Tshape0
�
gradients/add_23_grad/Sum_1Sum=gradients/SquaredDifference_1_grad/tuple/control_dependency_1-gradients/add_23_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
}
gradients/add_23_grad/Reshape_1Reshapegradients/add_23_grad/Sum_1gradients/add_23_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_23_grad/tuple/group_depsNoOp^gradients/add_23_grad/Reshape ^gradients/add_23_grad/Reshape_1
�
.gradients/add_23_grad/tuple/control_dependencyIdentitygradients/add_23_grad/Reshape'^gradients/add_23_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_23_grad/Reshape
�
0gradients/add_23_grad/tuple/control_dependency_1Identitygradients/add_23_grad/Reshape_1'^gradients/add_23_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_23_grad/Reshape_1
V
gradients/Sum_14_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
t
gradients/Sum_14_grad/SizeConst*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_14_grad/addAddV2Sum_14/reduction_indicesgradients/Sum_14_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_14_grad/Shape
�
gradients/Sum_14_grad/modFloorModgradients/Sum_14_grad/addgradients/Sum_14_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_14_grad/Shape
v
gradients/Sum_14_grad/Shape_1Const*
dtype0*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
valueB 
{
!gradients/Sum_14_grad/range/startConst*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
value	B : *
dtype0
{
!gradients/Sum_14_grad/range/deltaConst*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_14_grad/rangeRange!gradients/Sum_14_grad/range/startgradients/Sum_14_grad/Size!gradients/Sum_14_grad/range/delta*.
_class$
" loc:@gradients/Sum_14_grad/Shape*

Tidx0
z
 gradients/Sum_14_grad/Fill/valueConst*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_14_grad/FillFillgradients/Sum_14_grad/Shape_1 gradients/Sum_14_grad/Fill/value*
T0*.
_class$
" loc:@gradients/Sum_14_grad/Shape*

index_type0
�
#gradients/Sum_14_grad/DynamicStitchDynamicStitchgradients/Sum_14_grad/rangegradients/Sum_14_grad/modgradients/Sum_14_grad/Shapegradients/Sum_14_grad/Fill*
T0*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
N
y
gradients/Sum_14_grad/Maximum/yConst*.
_class$
" loc:@gradients/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_14_grad/MaximumMaximum#gradients/Sum_14_grad/DynamicStitchgradients/Sum_14_grad/Maximum/y*
T0*.
_class$
" loc:@gradients/Sum_14_grad/Shape
�
gradients/Sum_14_grad/floordivFloorDivgradients/Sum_14_grad/Shapegradients/Sum_14_grad/Maximum*
T0*.
_class$
" loc:@gradients/Sum_14_grad/Shape
�
gradients/Sum_14_grad/ReshapeReshape=gradients/SquaredDifference_2_grad/tuple/control_dependency_1#gradients/Sum_14_grad/DynamicStitch*
T0*
Tshape0
|
gradients/Sum_14_grad/TileTilegradients/Sum_14_grad/Reshapegradients/Sum_14_grad/floordiv*

Tmultiples0*
T0
W
gradients/add_24_grad/ShapeShapecuriosity_value_estimate*
T0*
out_type0
P
gradients/add_24_grad/Shape_1Shapeclip_by_value_1*
T0*
out_type0
�
+gradients/add_24_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_24_grad/Shapegradients/add_24_grad/Shape_1*
T0
�
gradients/add_24_grad/SumSum=gradients/SquaredDifference_3_grad/tuple/control_dependency_1+gradients/add_24_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
w
gradients/add_24_grad/ReshapeReshapegradients/add_24_grad/Sumgradients/add_24_grad/Shape*
T0*
Tshape0
�
gradients/add_24_grad/Sum_1Sum=gradients/SquaredDifference_3_grad/tuple/control_dependency_1-gradients/add_24_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
}
gradients/add_24_grad/Reshape_1Reshapegradients/add_24_grad/Sum_1gradients/add_24_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_24_grad/tuple/group_depsNoOp^gradients/add_24_grad/Reshape ^gradients/add_24_grad/Reshape_1
�
.gradients/add_24_grad/tuple/control_dependencyIdentitygradients/add_24_grad/Reshape'^gradients/add_24_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_24_grad/Reshape
�
0gradients/add_24_grad/tuple/control_dependency_1Identitygradients/add_24_grad/Reshape_1'^gradients/add_24_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_24_grad/Reshape_1
U
%gradients/strided_slice_21_grad/ShapeShapeaction_probs*
T0*
out_type0
�
0gradients/strided_slice_21_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_21_grad/Shapestrided_slice_21/stackstrided_slice_21/stack_1strided_slice_21/stack_2@gradients/softmax_cross_entropy_with_logits/Reshape_grad/Reshape*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
{
gradients/Softmax_6_grad/mulMulBgradients/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshape	Softmax_6*
T0
a
.gradients/Softmax_6_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients/Softmax_6_grad/SumSumgradients/Softmax_6_grad/mul.gradients/Softmax_6_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
gradients/Softmax_6_grad/subSubBgradients/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshapegradients/Softmax_6_grad/Sum*
T0
W
gradients/Softmax_6_grad/mul_1Mulgradients/Softmax_6_grad/sub	Softmax_6*
T0
U
%gradients/strided_slice_23_grad/ShapeShapeaction_probs*
T0*
out_type0
�
0gradients/strided_slice_23_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_23_grad/Shapestrided_slice_23/stackstrided_slice_23/stack_1strided_slice_23/stack_2Bgradients/softmax_cross_entropy_with_logits_1/Reshape_grad/Reshape*
end_mask*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
}
gradients/Softmax_7_grad/mulMulDgradients/softmax_cross_entropy_with_logits_1/Reshape_1_grad/Reshape	Softmax_7*
T0
a
.gradients/Softmax_7_grad/Sum/reduction_indicesConst*
dtype0*
valueB :
���������
�
gradients/Softmax_7_grad/SumSumgradients/Softmax_7_grad/mul.gradients/Softmax_7_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
�
gradients/Softmax_7_grad/subSubDgradients/softmax_cross_entropy_with_logits_1/Reshape_1_grad/Reshapegradients/Softmax_7_grad/Sum*
T0
W
gradients/Softmax_7_grad/mul_1Mulgradients/Softmax_7_grad/sub	Softmax_7*
T0
U
%gradients/strided_slice_25_grad/ShapeShapeaction_probs*
T0*
out_type0
�
0gradients/strided_slice_25_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_25_grad/Shapestrided_slice_25/stackstrided_slice_25/stack_1strided_slice_25/stack_2Bgradients/softmax_cross_entropy_with_logits_2/Reshape_grad/Reshape*
end_mask*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
}
gradients/Softmax_8_grad/mulMulDgradients/softmax_cross_entropy_with_logits_2/Reshape_1_grad/Reshape	Softmax_8*
T0
a
.gradients/Softmax_8_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients/Softmax_8_grad/SumSumgradients/Softmax_8_grad/mul.gradients/Softmax_8_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
gradients/Softmax_8_grad/subSubDgradients/softmax_cross_entropy_with_logits_2/Reshape_1_grad/Reshapegradients/Softmax_8_grad/Sum*
T0
W
gradients/Softmax_8_grad/mul_1Mulgradients/Softmax_8_grad/sub	Softmax_8*
T0
C
gradients/sub_5_grad/ShapeShapeSum_9*
T0*
out_type0
F
gradients/sub_5_grad/Shape_1ShapeSum_10*
T0*
out_type0
�
*gradients/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_5_grad/Shapegradients/sub_5_grad/Shape_1*
T0
�
gradients/sub_5_grad/SumSumgradients/Exp_grad/mul*gradients/sub_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/sub_5_grad/ReshapeReshapegradients/sub_5_grad/Sumgradients/sub_5_grad/Shape*
T0*
Tshape0
@
gradients/sub_5_grad/NegNeggradients/Exp_grad/mul*
T0
�
gradients/sub_5_grad/Sum_1Sumgradients/sub_5_grad/Neg,gradients/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/sub_5_grad/Reshape_1Reshapegradients/sub_5_grad/Sum_1gradients/sub_5_grad/Shape_1*
T0*
Tshape0
m
%gradients/sub_5_grad/tuple/group_depsNoOp^gradients/sub_5_grad/Reshape^gradients/sub_5_grad/Reshape_1
�
-gradients/sub_5_grad/tuple/control_dependencyIdentitygradients/sub_5_grad/Reshape&^gradients/sub_5_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_5_grad/Reshape
�
/gradients/sub_5_grad/tuple/control_dependency_1Identitygradients/sub_5_grad/Reshape_1&^gradients/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_5_grad/Reshape_1
[
"gradients/clip_by_value_grad/ShapeShapeclip_by_value/Minimum*
T0*
out_type0
M
$gradients/clip_by_value_grad/Shape_1Const*
valueB *
dtype0
x
$gradients/clip_by_value_grad/Shape_2Shape0gradients/add_23_grad/tuple/control_dependency_1*
T0*
out_type0
U
(gradients/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
"gradients/clip_by_value_grad/zerosFill$gradients/clip_by_value_grad/Shape_2(gradients/clip_by_value_grad/zeros/Const*
T0*

index_type0
`
)gradients/clip_by_value_grad/GreaterEqualGreaterEqualclip_by_value/MinimumNeg_6*
T0
�
2gradients/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/clip_by_value_grad/Shape$gradients/clip_by_value_grad/Shape_1*
T0
�
#gradients/clip_by_value_grad/SelectSelect)gradients/clip_by_value_grad/GreaterEqual0gradients/add_23_grad/tuple/control_dependency_1"gradients/clip_by_value_grad/zeros*
T0
�
 gradients/clip_by_value_grad/SumSum#gradients/clip_by_value_grad/Select2gradients/clip_by_value_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
$gradients/clip_by_value_grad/ReshapeReshape gradients/clip_by_value_grad/Sum"gradients/clip_by_value_grad/Shape*
T0*
Tshape0
�
%gradients/clip_by_value_grad/Select_1Select)gradients/clip_by_value_grad/GreaterEqual"gradients/clip_by_value_grad/zeros0gradients/add_23_grad/tuple/control_dependency_1*
T0
�
"gradients/clip_by_value_grad/Sum_1Sum%gradients/clip_by_value_grad/Select_14gradients/clip_by_value_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
&gradients/clip_by_value_grad/Reshape_1Reshape"gradients/clip_by_value_grad/Sum_1$gradients/clip_by_value_grad/Shape_1*
T0*
Tshape0
�
-gradients/clip_by_value_grad/tuple/group_depsNoOp%^gradients/clip_by_value_grad/Reshape'^gradients/clip_by_value_grad/Reshape_1
�
5gradients/clip_by_value_grad/tuple/control_dependencyIdentity$gradients/clip_by_value_grad/Reshape.^gradients/clip_by_value_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/clip_by_value_grad/Reshape
�
7gradients/clip_by_value_grad/tuple/control_dependency_1Identity&gradients/clip_by_value_grad/Reshape_1.^gradients/clip_by_value_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_grad/Reshape_1
_
$gradients/clip_by_value_1_grad/ShapeShapeclip_by_value_1/Minimum*
T0*
out_type0
O
&gradients/clip_by_value_1_grad/Shape_1Const*
valueB *
dtype0
z
&gradients/clip_by_value_1_grad/Shape_2Shape0gradients/add_24_grad/tuple/control_dependency_1*
T0*
out_type0
W
*gradients/clip_by_value_1_grad/zeros/ConstConst*
dtype0*
valueB
 *    
�
$gradients/clip_by_value_1_grad/zerosFill&gradients/clip_by_value_1_grad/Shape_2*gradients/clip_by_value_1_grad/zeros/Const*
T0*

index_type0
d
+gradients/clip_by_value_1_grad/GreaterEqualGreaterEqualclip_by_value_1/MinimumNeg_7*
T0
�
4gradients/clip_by_value_1_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients/clip_by_value_1_grad/Shape&gradients/clip_by_value_1_grad/Shape_1*
T0
�
%gradients/clip_by_value_1_grad/SelectSelect+gradients/clip_by_value_1_grad/GreaterEqual0gradients/add_24_grad/tuple/control_dependency_1$gradients/clip_by_value_1_grad/zeros*
T0
�
"gradients/clip_by_value_1_grad/SumSum%gradients/clip_by_value_1_grad/Select4gradients/clip_by_value_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
&gradients/clip_by_value_1_grad/ReshapeReshape"gradients/clip_by_value_1_grad/Sum$gradients/clip_by_value_1_grad/Shape*
T0*
Tshape0
�
'gradients/clip_by_value_1_grad/Select_1Select+gradients/clip_by_value_1_grad/GreaterEqual$gradients/clip_by_value_1_grad/zeros0gradients/add_24_grad/tuple/control_dependency_1*
T0
�
$gradients/clip_by_value_1_grad/Sum_1Sum'gradients/clip_by_value_1_grad/Select_16gradients/clip_by_value_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
(gradients/clip_by_value_1_grad/Reshape_1Reshape$gradients/clip_by_value_1_grad/Sum_1&gradients/clip_by_value_1_grad/Shape_1*
T0*
Tshape0
�
/gradients/clip_by_value_1_grad/tuple/group_depsNoOp'^gradients/clip_by_value_1_grad/Reshape)^gradients/clip_by_value_1_grad/Reshape_1
�
7gradients/clip_by_value_1_grad/tuple/control_dependencyIdentity&gradients/clip_by_value_1_grad/Reshape0^gradients/clip_by_value_1_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_1_grad/Reshape
�
9gradients/clip_by_value_1_grad/tuple/control_dependency_1Identity(gradients/clip_by_value_1_grad/Reshape_10^gradients/clip_by_value_1_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/clip_by_value_1_grad/Reshape_1
U
%gradients/strided_slice_20_grad/ShapeShapeaction_probs*
T0*
out_type0
�
0gradients/strided_slice_20_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_20_grad/Shapestrided_slice_20/stackstrided_slice_20/stack_1strided_slice_20/stack_2gradients/Softmax_6_grad/mul_1*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*
Index0*
T0
U
%gradients/strided_slice_22_grad/ShapeShapeaction_probs*
T0*
out_type0
�
0gradients/strided_slice_22_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_22_grad/Shapestrided_slice_22/stackstrided_slice_22/stack_1strided_slice_22/stack_2gradients/Softmax_7_grad/mul_1*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
U
%gradients/strided_slice_24_grad/ShapeShapeaction_probs*
T0*
out_type0
�
0gradients/strided_slice_24_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_24_grad/Shapestrided_slice_24/stackstrided_slice_24/stack_1strided_slice_24/stack_2gradients/Softmax_8_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
E
gradients/Sum_9_grad/ShapeShapestack_1*
T0*
out_type0
r
gradients/Sum_9_grad/SizeConst*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_9_grad/addAddV2Sum_9/reduction_indicesgradients/Sum_9_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_9_grad/Shape
�
gradients/Sum_9_grad/modFloorModgradients/Sum_9_grad/addgradients/Sum_9_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_9_grad/Shape
t
gradients/Sum_9_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_9_grad/range/startConst*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_9_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_9_grad/rangeRange gradients/Sum_9_grad/range/startgradients/Sum_9_grad/Size gradients/Sum_9_grad/range/delta*-
_class#
!loc:@gradients/Sum_9_grad/Shape*

Tidx0
x
gradients/Sum_9_grad/Fill/valueConst*
dtype0*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
value	B :
�
gradients/Sum_9_grad/FillFillgradients/Sum_9_grad/Shape_1gradients/Sum_9_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_9_grad/Shape*

index_type0
�
"gradients/Sum_9_grad/DynamicStitchDynamicStitchgradients/Sum_9_grad/rangegradients/Sum_9_grad/modgradients/Sum_9_grad/Shapegradients/Sum_9_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
N
w
gradients/Sum_9_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_9_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_9_grad/MaximumMaximum"gradients/Sum_9_grad/DynamicStitchgradients/Sum_9_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_9_grad/Shape
�
gradients/Sum_9_grad/floordivFloorDivgradients/Sum_9_grad/Shapegradients/Sum_9_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_9_grad/Shape
�
gradients/Sum_9_grad/ReshapeReshape-gradients/sub_5_grad/tuple/control_dependency"gradients/Sum_9_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_9_grad/TileTilegradients/Sum_9_grad/Reshapegradients/Sum_9_grad/floordiv*

Tmultiples0*
T0
S
*gradients/clip_by_value/Minimum_grad/ShapeShapesub_3*
T0*
out_type0
U
,gradients/clip_by_value/Minimum_grad/Shape_1Const*
dtype0*
valueB 
�
,gradients/clip_by_value/Minimum_grad/Shape_2Shape5gradients/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
]
0gradients/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
*gradients/clip_by_value/Minimum_grad/zerosFill,gradients/clip_by_value/Minimum_grad/Shape_20gradients/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0
\
.gradients/clip_by_value/Minimum_grad/LessEqual	LessEqualsub_3PolynomialDecay*
T0
�
:gradients/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients/clip_by_value/Minimum_grad/Shape,gradients/clip_by_value/Minimum_grad/Shape_1*
T0
�
+gradients/clip_by_value/Minimum_grad/SelectSelect.gradients/clip_by_value/Minimum_grad/LessEqual5gradients/clip_by_value_grad/tuple/control_dependency*gradients/clip_by_value/Minimum_grad/zeros*
T0
�
(gradients/clip_by_value/Minimum_grad/SumSum+gradients/clip_by_value/Minimum_grad/Select:gradients/clip_by_value/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients/clip_by_value/Minimum_grad/ReshapeReshape(gradients/clip_by_value/Minimum_grad/Sum*gradients/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
�
-gradients/clip_by_value/Minimum_grad/Select_1Select.gradients/clip_by_value/Minimum_grad/LessEqual*gradients/clip_by_value/Minimum_grad/zeros5gradients/clip_by_value_grad/tuple/control_dependency*
T0
�
*gradients/clip_by_value/Minimum_grad/Sum_1Sum-gradients/clip_by_value/Minimum_grad/Select_1<gradients/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients/clip_by_value/Minimum_grad/Reshape_1Reshape*gradients/clip_by_value/Minimum_grad/Sum_1,gradients/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0
�
5gradients/clip_by_value/Minimum_grad/tuple/group_depsNoOp-^gradients/clip_by_value/Minimum_grad/Reshape/^gradients/clip_by_value/Minimum_grad/Reshape_1
�
=gradients/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity,gradients/clip_by_value/Minimum_grad/Reshape6^gradients/clip_by_value/Minimum_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/clip_by_value/Minimum_grad/Reshape
�
?gradients/clip_by_value/Minimum_grad/tuple/control_dependency_1Identity.gradients/clip_by_value/Minimum_grad/Reshape_16^gradients/clip_by_value/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value/Minimum_grad/Reshape_1
U
,gradients/clip_by_value_1/Minimum_grad/ShapeShapesub_4*
T0*
out_type0
W
.gradients/clip_by_value_1/Minimum_grad/Shape_1Const*
valueB *
dtype0
�
.gradients/clip_by_value_1/Minimum_grad/Shape_2Shape7gradients/clip_by_value_1_grad/tuple/control_dependency*
T0*
out_type0
_
2gradients/clip_by_value_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
,gradients/clip_by_value_1/Minimum_grad/zerosFill.gradients/clip_by_value_1/Minimum_grad/Shape_22gradients/clip_by_value_1/Minimum_grad/zeros/Const*
T0*

index_type0
^
0gradients/clip_by_value_1/Minimum_grad/LessEqual	LessEqualsub_4PolynomialDecay*
T0
�
<gradients/clip_by_value_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/clip_by_value_1/Minimum_grad/Shape.gradients/clip_by_value_1/Minimum_grad/Shape_1*
T0
�
-gradients/clip_by_value_1/Minimum_grad/SelectSelect0gradients/clip_by_value_1/Minimum_grad/LessEqual7gradients/clip_by_value_1_grad/tuple/control_dependency,gradients/clip_by_value_1/Minimum_grad/zeros*
T0
�
*gradients/clip_by_value_1/Minimum_grad/SumSum-gradients/clip_by_value_1/Minimum_grad/Select<gradients/clip_by_value_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
.gradients/clip_by_value_1/Minimum_grad/ReshapeReshape*gradients/clip_by_value_1/Minimum_grad/Sum,gradients/clip_by_value_1/Minimum_grad/Shape*
T0*
Tshape0
�
/gradients/clip_by_value_1/Minimum_grad/Select_1Select0gradients/clip_by_value_1/Minimum_grad/LessEqual,gradients/clip_by_value_1/Minimum_grad/zeros7gradients/clip_by_value_1_grad/tuple/control_dependency*
T0
�
,gradients/clip_by_value_1/Minimum_grad/Sum_1Sum/gradients/clip_by_value_1/Minimum_grad/Select_1>gradients/clip_by_value_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
0gradients/clip_by_value_1/Minimum_grad/Reshape_1Reshape,gradients/clip_by_value_1/Minimum_grad/Sum_1.gradients/clip_by_value_1/Minimum_grad/Shape_1*
T0*
Tshape0
�
7gradients/clip_by_value_1/Minimum_grad/tuple/group_depsNoOp/^gradients/clip_by_value_1/Minimum_grad/Reshape1^gradients/clip_by_value_1/Minimum_grad/Reshape_1
�
?gradients/clip_by_value_1/Minimum_grad/tuple/control_dependencyIdentity.gradients/clip_by_value_1/Minimum_grad/Reshape8^gradients/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value_1/Minimum_grad/Reshape
�
Agradients/clip_by_value_1/Minimum_grad/tuple/control_dependency_1Identity0gradients/clip_by_value_1/Minimum_grad/Reshape_18^gradients/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/clip_by_value_1/Minimum_grad/Reshape_1
c
gradients/stack_1_grad/unstackUnpackgradients/Sum_9_grad/Tile*
T0*	
num*

axis
P
'gradients/stack_1_grad/tuple/group_depsNoOp^gradients/stack_1_grad/unstack
�
/gradients/stack_1_grad/tuple/control_dependencyIdentitygradients/stack_1_grad/unstack(^gradients/stack_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/stack_1_grad/unstack
�
1gradients/stack_1_grad/tuple/control_dependency_1Identity gradients/stack_1_grad/unstack:1(^gradients/stack_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/stack_1_grad/unstack
�
1gradients/stack_1_grad/tuple/control_dependency_2Identity gradients/stack_1_grad/unstack:2(^gradients/stack_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/stack_1_grad/unstack
D
gradients/sub_3_grad/ShapeShapeSum_11*
T0*
out_type0
X
gradients/sub_3_grad/Shape_1Shapeextrinsic_value_estimate*
T0*
out_type0
�
*gradients/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_3_grad/Shapegradients/sub_3_grad/Shape_1*
T0
�
gradients/sub_3_grad/SumSum=gradients/clip_by_value/Minimum_grad/tuple/control_dependency*gradients/sub_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
t
gradients/sub_3_grad/ReshapeReshapegradients/sub_3_grad/Sumgradients/sub_3_grad/Shape*
T0*
Tshape0
g
gradients/sub_3_grad/NegNeg=gradients/clip_by_value/Minimum_grad/tuple/control_dependency*
T0
�
gradients/sub_3_grad/Sum_1Sumgradients/sub_3_grad/Neg,gradients/sub_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/sub_3_grad/Reshape_1Reshapegradients/sub_3_grad/Sum_1gradients/sub_3_grad/Shape_1*
T0*
Tshape0
m
%gradients/sub_3_grad/tuple/group_depsNoOp^gradients/sub_3_grad/Reshape^gradients/sub_3_grad/Reshape_1
�
-gradients/sub_3_grad/tuple/control_dependencyIdentitygradients/sub_3_grad/Reshape&^gradients/sub_3_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_3_grad/Reshape
�
/gradients/sub_3_grad/tuple/control_dependency_1Identitygradients/sub_3_grad/Reshape_1&^gradients/sub_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_3_grad/Reshape_1
D
gradients/sub_4_grad/ShapeShapeSum_13*
T0*
out_type0
X
gradients/sub_4_grad/Shape_1Shapecuriosity_value_estimate*
T0*
out_type0
�
*gradients/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_4_grad/Shapegradients/sub_4_grad/Shape_1*
T0
�
gradients/sub_4_grad/SumSum?gradients/clip_by_value_1/Minimum_grad/tuple/control_dependency*gradients/sub_4_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
t
gradients/sub_4_grad/ReshapeReshapegradients/sub_4_grad/Sumgradients/sub_4_grad/Shape*
T0*
Tshape0
i
gradients/sub_4_grad/NegNeg?gradients/clip_by_value_1/Minimum_grad/tuple/control_dependency*
T0
�
gradients/sub_4_grad/Sum_1Sumgradients/sub_4_grad/Neg,gradients/sub_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/sub_4_grad/Reshape_1Reshapegradients/sub_4_grad/Sum_1gradients/sub_4_grad/Shape_1*
T0*
Tshape0
m
%gradients/sub_4_grad/tuple/group_depsNoOp^gradients/sub_4_grad/Reshape^gradients/sub_4_grad/Reshape_1
�
-gradients/sub_4_grad/tuple/control_dependencyIdentitygradients/sub_4_grad/Reshape&^gradients/sub_4_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_4_grad/Reshape
�
/gradients/sub_4_grad/tuple/control_dependency_1Identitygradients/sub_4_grad/Reshape_1&^gradients/sub_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_4_grad/Reshape_1
W
gradients/Neg_grad/NegNeg/gradients/stack_1_grad/tuple/control_dependency*
T0
[
gradients/Neg_1_grad/NegNeg1gradients/stack_1_grad/tuple/control_dependency_1*
T0
[
gradients/Neg_2_grad/NegNeg1gradients/stack_1_grad/tuple/control_dependency_2*
T0
V
gradients/Sum_11_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
t
gradients/Sum_11_grad/SizeConst*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_11_grad/addAddV2Sum_11/reduction_indicesgradients/Sum_11_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_11_grad/Shape
�
gradients/Sum_11_grad/modFloorModgradients/Sum_11_grad/addgradients/Sum_11_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_11_grad/Shape
v
gradients/Sum_11_grad/Shape_1Const*
dtype0*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
valueB 
{
!gradients/Sum_11_grad/range/startConst*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
value	B : *
dtype0
{
!gradients/Sum_11_grad/range/deltaConst*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_11_grad/rangeRange!gradients/Sum_11_grad/range/startgradients/Sum_11_grad/Size!gradients/Sum_11_grad/range/delta*.
_class$
" loc:@gradients/Sum_11_grad/Shape*

Tidx0
z
 gradients/Sum_11_grad/Fill/valueConst*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_11_grad/FillFillgradients/Sum_11_grad/Shape_1 gradients/Sum_11_grad/Fill/value*
T0*.
_class$
" loc:@gradients/Sum_11_grad/Shape*

index_type0
�
#gradients/Sum_11_grad/DynamicStitchDynamicStitchgradients/Sum_11_grad/rangegradients/Sum_11_grad/modgradients/Sum_11_grad/Shapegradients/Sum_11_grad/Fill*
T0*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
N
y
gradients/Sum_11_grad/Maximum/yConst*.
_class$
" loc:@gradients/Sum_11_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_11_grad/MaximumMaximum#gradients/Sum_11_grad/DynamicStitchgradients/Sum_11_grad/Maximum/y*
T0*.
_class$
" loc:@gradients/Sum_11_grad/Shape
�
gradients/Sum_11_grad/floordivFloorDivgradients/Sum_11_grad/Shapegradients/Sum_11_grad/Maximum*
T0*.
_class$
" loc:@gradients/Sum_11_grad/Shape
�
gradients/Sum_11_grad/ReshapeReshape-gradients/sub_3_grad/tuple/control_dependency#gradients/Sum_11_grad/DynamicStitch*
T0*
Tshape0
|
gradients/Sum_11_grad/TileTilegradients/Sum_11_grad/Reshapegradients/Sum_11_grad/floordiv*

Tmultiples0*
T0
V
gradients/Sum_13_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
t
gradients/Sum_13_grad/SizeConst*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_13_grad/addAddV2Sum_13/reduction_indicesgradients/Sum_13_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_13_grad/Shape
�
gradients/Sum_13_grad/modFloorModgradients/Sum_13_grad/addgradients/Sum_13_grad/Size*
T0*.
_class$
" loc:@gradients/Sum_13_grad/Shape
v
gradients/Sum_13_grad/Shape_1Const*
dtype0*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
valueB 
{
!gradients/Sum_13_grad/range/startConst*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
value	B : *
dtype0
{
!gradients/Sum_13_grad/range/deltaConst*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_13_grad/rangeRange!gradients/Sum_13_grad/range/startgradients/Sum_13_grad/Size!gradients/Sum_13_grad/range/delta*.
_class$
" loc:@gradients/Sum_13_grad/Shape*

Tidx0
z
 gradients/Sum_13_grad/Fill/valueConst*
dtype0*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
value	B :
�
gradients/Sum_13_grad/FillFillgradients/Sum_13_grad/Shape_1 gradients/Sum_13_grad/Fill/value*
T0*.
_class$
" loc:@gradients/Sum_13_grad/Shape*

index_type0
�
#gradients/Sum_13_grad/DynamicStitchDynamicStitchgradients/Sum_13_grad/rangegradients/Sum_13_grad/modgradients/Sum_13_grad/Shapegradients/Sum_13_grad/Fill*
T0*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
N
y
gradients/Sum_13_grad/Maximum/yConst*.
_class$
" loc:@gradients/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_13_grad/MaximumMaximum#gradients/Sum_13_grad/DynamicStitchgradients/Sum_13_grad/Maximum/y*
T0*.
_class$
" loc:@gradients/Sum_13_grad/Shape
�
gradients/Sum_13_grad/floordivFloorDivgradients/Sum_13_grad/Shapegradients/Sum_13_grad/Maximum*
T0*.
_class$
" loc:@gradients/Sum_13_grad/Shape
�
gradients/Sum_13_grad/ReshapeReshape-gradients/sub_4_grad/tuple/control_dependency#gradients/Sum_13_grad/DynamicStitch*
T0*
Tshape0
|
gradients/Sum_13_grad/TileTilegradients/Sum_13_grad/Reshapegradients/Sum_13_grad/floordiv*
T0*

Tmultiples0
�
Bgradients/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_3*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ReshapeReshapegradients/Neg_grad/NegBgradients/softmax_cross_entropy_with_logits_3/Reshape_2_grad/Shape*
T0*
Tshape0
�
Bgradients/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_4*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ReshapeReshapegradients/Neg_1_grad/NegBgradients/softmax_cross_entropy_with_logits_4/Reshape_2_grad/Shape*
T0*
Tshape0
�
Bgradients/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_5*
T0*
out_type0
�
Dgradients/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ReshapeReshapegradients/Neg_2_grad/NegBgradients/softmax_cross_entropy_with_logits_5/Reshape_2_grad/Shape*
T0*
Tshape0
�
gradients/AddN_1AddNgradients/Sum_12_grad/Tilegradients/Sum_11_grad/Tile*
T0*-
_class#
!loc:@gradients/Sum_12_grad/Tile*
N
s
2gradients/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_1*
data_formatNHWC*
T0
�
7gradients/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_13^gradients/extrinsic_value/BiasAdd_grad/BiasAddGrad
�
?gradients/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_18^gradients/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/Sum_12_grad/Tile
�
Agradients/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/extrinsic_value/BiasAdd_grad/BiasAddGrad8^gradients/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/extrinsic_value/BiasAdd_grad/BiasAddGrad
�
gradients/AddN_2AddNgradients/Sum_14_grad/Tilegradients/Sum_13_grad/Tile*
T0*-
_class#
!loc:@gradients/Sum_14_grad/Tile*
N
s
2gradients/curiosity_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_2*
data_formatNHWC*
T0
�
7gradients/curiosity_value/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_23^gradients/curiosity_value/BiasAdd_grad/BiasAddGrad
�
?gradients/curiosity_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_28^gradients/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/Sum_14_grad/Tile
�
Agradients/curiosity_value/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/curiosity_value/BiasAdd_grad/BiasAddGrad8^gradients/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/curiosity_value/BiasAdd_grad/BiasAddGrad
S
gradients/zeros_like_7	ZerosLike%softmax_cross_entropy_with_logits_3:1*
T0
t
Agradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
=gradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims
ExpandDimsDgradients/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims/dim*

Tdim0*
T0
�
6gradients/softmax_cross_entropy_with_logits_3_grad/mulMul=gradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims%softmax_cross_entropy_with_logits_3:1*
T0
�
=gradients/softmax_cross_entropy_with_logits_3_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_3/Reshape*
T0
�
6gradients/softmax_cross_entropy_with_logits_3_grad/NegNeg=gradients/softmax_cross_entropy_with_logits_3_grad/LogSoftmax*
T0
v
Cgradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
?gradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims_1
ExpandDimsDgradients/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ReshapeCgradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims_1/dim*

Tdim0*
T0
�
8gradients/softmax_cross_entropy_with_logits_3_grad/mul_1Mul?gradients/softmax_cross_entropy_with_logits_3_grad/ExpandDims_16gradients/softmax_cross_entropy_with_logits_3_grad/Neg*
T0
�
Cgradients/softmax_cross_entropy_with_logits_3_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_with_logits_3_grad/mul9^gradients/softmax_cross_entropy_with_logits_3_grad/mul_1
�
Kgradients/softmax_cross_entropy_with_logits_3_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_with_logits_3_grad/mulD^gradients/softmax_cross_entropy_with_logits_3_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_3_grad/mul
�
Mgradients/softmax_cross_entropy_with_logits_3_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_with_logits_3_grad/mul_1D^gradients/softmax_cross_entropy_with_logits_3_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/softmax_cross_entropy_with_logits_3_grad/mul_1
S
gradients/zeros_like_8	ZerosLike%softmax_cross_entropy_with_logits_4:1*
T0
t
Agradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
=gradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims
ExpandDimsDgradients/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims/dim*

Tdim0*
T0
�
6gradients/softmax_cross_entropy_with_logits_4_grad/mulMul=gradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims%softmax_cross_entropy_with_logits_4:1*
T0
�
=gradients/softmax_cross_entropy_with_logits_4_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_4/Reshape*
T0
�
6gradients/softmax_cross_entropy_with_logits_4_grad/NegNeg=gradients/softmax_cross_entropy_with_logits_4_grad/LogSoftmax*
T0
v
Cgradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims_1/dimConst*
dtype0*
valueB :
���������
�
?gradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims_1
ExpandDimsDgradients/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ReshapeCgradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims_1/dim*

Tdim0*
T0
�
8gradients/softmax_cross_entropy_with_logits_4_grad/mul_1Mul?gradients/softmax_cross_entropy_with_logits_4_grad/ExpandDims_16gradients/softmax_cross_entropy_with_logits_4_grad/Neg*
T0
�
Cgradients/softmax_cross_entropy_with_logits_4_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_with_logits_4_grad/mul9^gradients/softmax_cross_entropy_with_logits_4_grad/mul_1
�
Kgradients/softmax_cross_entropy_with_logits_4_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_with_logits_4_grad/mulD^gradients/softmax_cross_entropy_with_logits_4_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_4_grad/mul
�
Mgradients/softmax_cross_entropy_with_logits_4_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_with_logits_4_grad/mul_1D^gradients/softmax_cross_entropy_with_logits_4_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/softmax_cross_entropy_with_logits_4_grad/mul_1
S
gradients/zeros_like_9	ZerosLike%softmax_cross_entropy_with_logits_5:1*
T0
t
Agradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
=gradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims
ExpandDimsDgradients/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims/dim*

Tdim0*
T0
�
6gradients/softmax_cross_entropy_with_logits_5_grad/mulMul=gradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims%softmax_cross_entropy_with_logits_5:1*
T0
�
=gradients/softmax_cross_entropy_with_logits_5_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_5/Reshape*
T0
�
6gradients/softmax_cross_entropy_with_logits_5_grad/NegNeg=gradients/softmax_cross_entropy_with_logits_5_grad/LogSoftmax*
T0
v
Cgradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims_1/dimConst*
dtype0*
valueB :
���������
�
?gradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims_1
ExpandDimsDgradients/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ReshapeCgradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims_1/dim*

Tdim0*
T0
�
8gradients/softmax_cross_entropy_with_logits_5_grad/mul_1Mul?gradients/softmax_cross_entropy_with_logits_5_grad/ExpandDims_16gradients/softmax_cross_entropy_with_logits_5_grad/Neg*
T0
�
Cgradients/softmax_cross_entropy_with_logits_5_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_with_logits_5_grad/mul9^gradients/softmax_cross_entropy_with_logits_5_grad/mul_1
�
Kgradients/softmax_cross_entropy_with_logits_5_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_with_logits_5_grad/mulD^gradients/softmax_cross_entropy_with_logits_5_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_5_grad/mul
�
Mgradients/softmax_cross_entropy_with_logits_5_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_with_logits_5_grad/mul_1D^gradients/softmax_cross_entropy_with_logits_5_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/softmax_cross_entropy_with_logits_5_grad/mul_1
�
,gradients/extrinsic_value/MatMul_grad/MatMulMatMul?gradients/extrinsic_value/BiasAdd_grad/tuple/control_dependencyextrinsic_value/kernel/read*
T0*
transpose_a( *
transpose_b(
�
.gradients/extrinsic_value/MatMul_grad/MatMul_1MatMul	Reshape_2?gradients/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
�
6gradients/extrinsic_value/MatMul_grad/tuple/group_depsNoOp-^gradients/extrinsic_value/MatMul_grad/MatMul/^gradients/extrinsic_value/MatMul_grad/MatMul_1
�
>gradients/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentity,gradients/extrinsic_value/MatMul_grad/MatMul7^gradients/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/extrinsic_value/MatMul_grad/MatMul
�
@gradients/extrinsic_value/MatMul_grad/tuple/control_dependency_1Identity.gradients/extrinsic_value/MatMul_grad/MatMul_17^gradients/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/extrinsic_value/MatMul_grad/MatMul_1
�
,gradients/curiosity_value/MatMul_grad/MatMulMatMul?gradients/curiosity_value/BiasAdd_grad/tuple/control_dependencycuriosity_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
.gradients/curiosity_value/MatMul_grad/MatMul_1MatMul	Reshape_2?gradients/curiosity_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
6gradients/curiosity_value/MatMul_grad/tuple/group_depsNoOp-^gradients/curiosity_value/MatMul_grad/MatMul/^gradients/curiosity_value/MatMul_grad/MatMul_1
�
>gradients/curiosity_value/MatMul_grad/tuple/control_dependencyIdentity,gradients/curiosity_value/MatMul_grad/MatMul7^gradients/curiosity_value/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/curiosity_value/MatMul_grad/MatMul
�
@gradients/curiosity_value/MatMul_grad/tuple/control_dependency_1Identity.gradients/curiosity_value/MatMul_grad/MatMul_17^gradients/curiosity_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/curiosity_value/MatMul_grad/MatMul_1
t
@gradients/softmax_cross_entropy_with_logits_3/Reshape_grad/ShapeShapestrided_slice_27*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits_3/Reshape_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_3_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits_3/Reshape_grad/Shape*
T0*
Tshape0
t
@gradients/softmax_cross_entropy_with_logits_4/Reshape_grad/ShapeShapestrided_slice_29*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits_4/Reshape_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_4_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits_4/Reshape_grad/Shape*
T0*
Tshape0
t
@gradients/softmax_cross_entropy_with_logits_5/Reshape_grad/ShapeShapestrided_slice_31*
T0*
out_type0
�
Bgradients/softmax_cross_entropy_with_logits_5/Reshape_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_5_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits_5/Reshape_grad/Shape*
T0*
Tshape0
Q
%gradients/strided_slice_27_grad/ShapeShapeconcat_5*
T0*
out_type0
�
0gradients/strided_slice_27_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_27_grad/Shapestrided_slice_27/stackstrided_slice_27/stack_1strided_slice_27/stack_2Bgradients/softmax_cross_entropy_with_logits_3/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
Q
%gradients/strided_slice_29_grad/ShapeShapeconcat_5*
T0*
out_type0
�
0gradients/strided_slice_29_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_29_grad/Shapestrided_slice_29/stackstrided_slice_29/stack_1strided_slice_29/stack_2Bgradients/softmax_cross_entropy_with_logits_4/Reshape_grad/Reshape*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0*
shrink_axis_mask 
Q
%gradients/strided_slice_31_grad/ShapeShapeconcat_5*
T0*
out_type0
�
0gradients/strided_slice_31_grad/StridedSliceGradStridedSliceGrad%gradients/strided_slice_31_grad/Shapestrided_slice_31/stackstrided_slice_31/stack_1strided_slice_31/stack_2Bgradients/softmax_cross_entropy_with_logits_5/Reshape_grad/Reshape*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
�
gradients/AddN_3AddN0gradients/strided_slice_27_grad/StridedSliceGrad0gradients/strided_slice_29_grad/StridedSliceGrad0gradients/strided_slice_31_grad/StridedSliceGrad*
T0*C
_class9
75loc:@gradients/strided_slice_27_grad/StridedSliceGrad*
N
F
gradients/concat_5_grad/RankConst*
value	B :*
dtype0
]
gradients/concat_5_grad/modFloorModconcat_5/axisgradients/concat_5_grad/Rank*
T0
F
gradients/concat_5_grad/ShapeShapeLog_3*
T0*
out_type0
_
gradients/concat_5_grad/ShapeNShapeNLog_3Log_4Log_5*
T0*
out_type0*
N
�
$gradients/concat_5_grad/ConcatOffsetConcatOffsetgradients/concat_5_grad/modgradients/concat_5_grad/ShapeN gradients/concat_5_grad/ShapeN:1 gradients/concat_5_grad/ShapeN:2*
N
�
gradients/concat_5_grad/SliceSlicegradients/AddN_3$gradients/concat_5_grad/ConcatOffsetgradients/concat_5_grad/ShapeN*
T0*
Index0
�
gradients/concat_5_grad/Slice_1Slicegradients/AddN_3&gradients/concat_5_grad/ConcatOffset:1 gradients/concat_5_grad/ShapeN:1*
T0*
Index0
�
gradients/concat_5_grad/Slice_2Slicegradients/AddN_3&gradients/concat_5_grad/ConcatOffset:2 gradients/concat_5_grad/ShapeN:2*
T0*
Index0
�
(gradients/concat_5_grad/tuple/group_depsNoOp^gradients/concat_5_grad/Slice ^gradients/concat_5_grad/Slice_1 ^gradients/concat_5_grad/Slice_2
�
0gradients/concat_5_grad/tuple/control_dependencyIdentitygradients/concat_5_grad/Slice)^gradients/concat_5_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/concat_5_grad/Slice
�
2gradients/concat_5_grad/tuple/control_dependency_1Identitygradients/concat_5_grad/Slice_1)^gradients/concat_5_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/concat_5_grad/Slice_1
�
2gradients/concat_5_grad/tuple/control_dependency_2Identitygradients/concat_5_grad/Slice_2)^gradients/concat_5_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/concat_5_grad/Slice_2
q
gradients/Log_3_grad/Reciprocal
Reciprocaladd_111^gradients/concat_5_grad/tuple/control_dependency*
T0
{
gradients/Log_3_grad/mulMul0gradients/concat_5_grad/tuple/control_dependencygradients/Log_3_grad/Reciprocal*
T0
s
gradients/Log_4_grad/Reciprocal
Reciprocaladd_123^gradients/concat_5_grad/tuple/control_dependency_1*
T0
}
gradients/Log_4_grad/mulMul2gradients/concat_5_grad/tuple/control_dependency_1gradients/Log_4_grad/Reciprocal*
T0
s
gradients/Log_5_grad/Reciprocal
Reciprocaladd_133^gradients/concat_5_grad/tuple/control_dependency_2*
T0
}
gradients/Log_5_grad/mulMul2gradients/concat_5_grad/tuple/control_dependency_2gradients/Log_5_grad/Reciprocal*
T0
H
gradients/add_11_grad/ShapeShape	truediv_3*
T0*
out_type0
I
gradients/add_11_grad/Shape_1Shapeadd_11/y*
T0*
out_type0
�
+gradients/add_11_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_11_grad/Shapegradients/add_11_grad/Shape_1*
T0
�
gradients/add_11_grad/SumSumgradients/Log_3_grad/mul+gradients/add_11_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
w
gradients/add_11_grad/ReshapeReshapegradients/add_11_grad/Sumgradients/add_11_grad/Shape*
T0*
Tshape0
�
gradients/add_11_grad/Sum_1Sumgradients/Log_3_grad/mul-gradients/add_11_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
}
gradients/add_11_grad/Reshape_1Reshapegradients/add_11_grad/Sum_1gradients/add_11_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_11_grad/tuple/group_depsNoOp^gradients/add_11_grad/Reshape ^gradients/add_11_grad/Reshape_1
�
.gradients/add_11_grad/tuple/control_dependencyIdentitygradients/add_11_grad/Reshape'^gradients/add_11_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_11_grad/Reshape
�
0gradients/add_11_grad/tuple/control_dependency_1Identitygradients/add_11_grad/Reshape_1'^gradients/add_11_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_11_grad/Reshape_1
H
gradients/add_12_grad/ShapeShape	truediv_4*
T0*
out_type0
I
gradients/add_12_grad/Shape_1Shapeadd_12/y*
T0*
out_type0
�
+gradients/add_12_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_12_grad/Shapegradients/add_12_grad/Shape_1*
T0
�
gradients/add_12_grad/SumSumgradients/Log_4_grad/mul+gradients/add_12_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
w
gradients/add_12_grad/ReshapeReshapegradients/add_12_grad/Sumgradients/add_12_grad/Shape*
T0*
Tshape0
�
gradients/add_12_grad/Sum_1Sumgradients/Log_4_grad/mul-gradients/add_12_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
}
gradients/add_12_grad/Reshape_1Reshapegradients/add_12_grad/Sum_1gradients/add_12_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_12_grad/tuple/group_depsNoOp^gradients/add_12_grad/Reshape ^gradients/add_12_grad/Reshape_1
�
.gradients/add_12_grad/tuple/control_dependencyIdentitygradients/add_12_grad/Reshape'^gradients/add_12_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_12_grad/Reshape
�
0gradients/add_12_grad/tuple/control_dependency_1Identitygradients/add_12_grad/Reshape_1'^gradients/add_12_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_12_grad/Reshape_1
H
gradients/add_13_grad/ShapeShape	truediv_5*
T0*
out_type0
I
gradients/add_13_grad/Shape_1Shapeadd_13/y*
T0*
out_type0
�
+gradients/add_13_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_13_grad/Shapegradients/add_13_grad/Shape_1*
T0
�
gradients/add_13_grad/SumSumgradients/Log_5_grad/mul+gradients/add_13_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
w
gradients/add_13_grad/ReshapeReshapegradients/add_13_grad/Sumgradients/add_13_grad/Shape*
T0*
Tshape0
�
gradients/add_13_grad/Sum_1Sumgradients/Log_5_grad/mul-gradients/add_13_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
}
gradients/add_13_grad/Reshape_1Reshapegradients/add_13_grad/Sum_1gradients/add_13_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_13_grad/tuple/group_depsNoOp^gradients/add_13_grad/Reshape ^gradients/add_13_grad/Reshape_1
�
.gradients/add_13_grad/tuple/control_dependencyIdentitygradients/add_13_grad/Reshape'^gradients/add_13_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_13_grad/Reshape
�
0gradients/add_13_grad/tuple/control_dependency_1Identitygradients/add_13_grad/Reshape_1'^gradients/add_13_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_13_grad/Reshape_1
G
gradients/truediv_3_grad/ShapeShapeMul_1*
T0*
out_type0
I
 gradients/truediv_3_grad/Shape_1ShapeSum_2*
T0*
out_type0
�
.gradients/truediv_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/truediv_3_grad/Shape gradients/truediv_3_grad/Shape_1*
T0
k
 gradients/truediv_3_grad/RealDivRealDiv.gradients/add_11_grad/tuple/control_dependencySum_2*
T0
�
gradients/truediv_3_grad/SumSum gradients/truediv_3_grad/RealDiv.gradients/truediv_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
 gradients/truediv_3_grad/ReshapeReshapegradients/truediv_3_grad/Sumgradients/truediv_3_grad/Shape*
T0*
Tshape0
3
gradients/truediv_3_grad/NegNegMul_1*
T0
[
"gradients/truediv_3_grad/RealDiv_1RealDivgradients/truediv_3_grad/NegSum_2*
T0
a
"gradients/truediv_3_grad/RealDiv_2RealDiv"gradients/truediv_3_grad/RealDiv_1Sum_2*
T0
�
gradients/truediv_3_grad/mulMul.gradients/add_11_grad/tuple/control_dependency"gradients/truediv_3_grad/RealDiv_2*
T0
�
gradients/truediv_3_grad/Sum_1Sumgradients/truediv_3_grad/mul0gradients/truediv_3_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
"gradients/truediv_3_grad/Reshape_1Reshapegradients/truediv_3_grad/Sum_1 gradients/truediv_3_grad/Shape_1*
T0*
Tshape0
y
)gradients/truediv_3_grad/tuple/group_depsNoOp!^gradients/truediv_3_grad/Reshape#^gradients/truediv_3_grad/Reshape_1
�
1gradients/truediv_3_grad/tuple/control_dependencyIdentity gradients/truediv_3_grad/Reshape*^gradients/truediv_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/truediv_3_grad/Reshape
�
3gradients/truediv_3_grad/tuple/control_dependency_1Identity"gradients/truediv_3_grad/Reshape_1*^gradients/truediv_3_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/truediv_3_grad/Reshape_1
G
gradients/truediv_4_grad/ShapeShapeMul_2*
T0*
out_type0
I
 gradients/truediv_4_grad/Shape_1ShapeSum_3*
T0*
out_type0
�
.gradients/truediv_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/truediv_4_grad/Shape gradients/truediv_4_grad/Shape_1*
T0
k
 gradients/truediv_4_grad/RealDivRealDiv.gradients/add_12_grad/tuple/control_dependencySum_3*
T0
�
gradients/truediv_4_grad/SumSum gradients/truediv_4_grad/RealDiv.gradients/truediv_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
 gradients/truediv_4_grad/ReshapeReshapegradients/truediv_4_grad/Sumgradients/truediv_4_grad/Shape*
T0*
Tshape0
3
gradients/truediv_4_grad/NegNegMul_2*
T0
[
"gradients/truediv_4_grad/RealDiv_1RealDivgradients/truediv_4_grad/NegSum_3*
T0
a
"gradients/truediv_4_grad/RealDiv_2RealDiv"gradients/truediv_4_grad/RealDiv_1Sum_3*
T0
�
gradients/truediv_4_grad/mulMul.gradients/add_12_grad/tuple/control_dependency"gradients/truediv_4_grad/RealDiv_2*
T0
�
gradients/truediv_4_grad/Sum_1Sumgradients/truediv_4_grad/mul0gradients/truediv_4_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
"gradients/truediv_4_grad/Reshape_1Reshapegradients/truediv_4_grad/Sum_1 gradients/truediv_4_grad/Shape_1*
T0*
Tshape0
y
)gradients/truediv_4_grad/tuple/group_depsNoOp!^gradients/truediv_4_grad/Reshape#^gradients/truediv_4_grad/Reshape_1
�
1gradients/truediv_4_grad/tuple/control_dependencyIdentity gradients/truediv_4_grad/Reshape*^gradients/truediv_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/truediv_4_grad/Reshape
�
3gradients/truediv_4_grad/tuple/control_dependency_1Identity"gradients/truediv_4_grad/Reshape_1*^gradients/truediv_4_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/truediv_4_grad/Reshape_1
G
gradients/truediv_5_grad/ShapeShapeMul_3*
T0*
out_type0
I
 gradients/truediv_5_grad/Shape_1ShapeSum_4*
T0*
out_type0
�
.gradients/truediv_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/truediv_5_grad/Shape gradients/truediv_5_grad/Shape_1*
T0
k
 gradients/truediv_5_grad/RealDivRealDiv.gradients/add_13_grad/tuple/control_dependencySum_4*
T0
�
gradients/truediv_5_grad/SumSum gradients/truediv_5_grad/RealDiv.gradients/truediv_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
 gradients/truediv_5_grad/ReshapeReshapegradients/truediv_5_grad/Sumgradients/truediv_5_grad/Shape*
T0*
Tshape0
3
gradients/truediv_5_grad/NegNegMul_3*
T0
[
"gradients/truediv_5_grad/RealDiv_1RealDivgradients/truediv_5_grad/NegSum_4*
T0
a
"gradients/truediv_5_grad/RealDiv_2RealDiv"gradients/truediv_5_grad/RealDiv_1Sum_4*
T0
�
gradients/truediv_5_grad/mulMul.gradients/add_13_grad/tuple/control_dependency"gradients/truediv_5_grad/RealDiv_2*
T0
�
gradients/truediv_5_grad/Sum_1Sumgradients/truediv_5_grad/mul0gradients/truediv_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
"gradients/truediv_5_grad/Reshape_1Reshapegradients/truediv_5_grad/Sum_1 gradients/truediv_5_grad/Shape_1*
T0*
Tshape0
y
)gradients/truediv_5_grad/tuple/group_depsNoOp!^gradients/truediv_5_grad/Reshape#^gradients/truediv_5_grad/Reshape_1
�
1gradients/truediv_5_grad/tuple/control_dependencyIdentity gradients/truediv_5_grad/Reshape*^gradients/truediv_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/truediv_5_grad/Reshape
�
3gradients/truediv_5_grad/tuple/control_dependency_1Identity"gradients/truediv_5_grad/Reshape_1*^gradients/truediv_5_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/truediv_5_grad/Reshape_1
C
gradients/Sum_2_grad/ShapeShapeMul_1*
T0*
out_type0
r
gradients/Sum_2_grad/SizeConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_2_grad/addAddV2Sum_2/reduction_indicesgradients/Sum_2_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
�
gradients/Sum_2_grad/modFloorModgradients/Sum_2_grad/addgradients/Sum_2_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
t
gradients/Sum_2_grad/Shape_1Const*
dtype0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
valueB 
y
 gradients/Sum_2_grad/range/startConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_2_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_2_grad/rangeRange gradients/Sum_2_grad/range/startgradients/Sum_2_grad/Size gradients/Sum_2_grad/range/delta*-
_class#
!loc:@gradients/Sum_2_grad/Shape*

Tidx0
x
gradients/Sum_2_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_2_grad/FillFillgradients/Sum_2_grad/Shape_1gradients/Sum_2_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*

index_type0
�
"gradients/Sum_2_grad/DynamicStitchDynamicStitchgradients/Sum_2_grad/rangegradients/Sum_2_grad/modgradients/Sum_2_grad/Shapegradients/Sum_2_grad/Fill*
N*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
w
gradients/Sum_2_grad/Maximum/yConst*
dtype0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :
�
gradients/Sum_2_grad/MaximumMaximum"gradients/Sum_2_grad/DynamicStitchgradients/Sum_2_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
�
gradients/Sum_2_grad/floordivFloorDivgradients/Sum_2_grad/Shapegradients/Sum_2_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
�
gradients/Sum_2_grad/ReshapeReshape3gradients/truediv_3_grad/tuple/control_dependency_1"gradients/Sum_2_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_2_grad/TileTilegradients/Sum_2_grad/Reshapegradients/Sum_2_grad/floordiv*

Tmultiples0*
T0
C
gradients/Sum_3_grad/ShapeShapeMul_2*
T0*
out_type0
r
gradients/Sum_3_grad/SizeConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/addAddV2Sum_3/reduction_indicesgradients/Sum_3_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
�
gradients/Sum_3_grad/modFloorModgradients/Sum_3_grad/addgradients/Sum_3_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
t
gradients/Sum_3_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_3_grad/range/startConst*
dtype0*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B : 
y
 gradients/Sum_3_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/rangeRange gradients/Sum_3_grad/range/startgradients/Sum_3_grad/Size gradients/Sum_3_grad/range/delta*-
_class#
!loc:@gradients/Sum_3_grad/Shape*

Tidx0
x
gradients/Sum_3_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/FillFillgradients/Sum_3_grad/Shape_1gradients/Sum_3_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape*

index_type0
�
"gradients/Sum_3_grad/DynamicStitchDynamicStitchgradients/Sum_3_grad/rangegradients/Sum_3_grad/modgradients/Sum_3_grad/Shapegradients/Sum_3_grad/Fill*
N*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
w
gradients/Sum_3_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/MaximumMaximum"gradients/Sum_3_grad/DynamicStitchgradients/Sum_3_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
�
gradients/Sum_3_grad/floordivFloorDivgradients/Sum_3_grad/Shapegradients/Sum_3_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
�
gradients/Sum_3_grad/ReshapeReshape3gradients/truediv_4_grad/tuple/control_dependency_1"gradients/Sum_3_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_3_grad/TileTilegradients/Sum_3_grad/Reshapegradients/Sum_3_grad/floordiv*
T0*

Tmultiples0
C
gradients/Sum_4_grad/ShapeShapeMul_3*
T0*
out_type0
r
gradients/Sum_4_grad/SizeConst*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_4_grad/addAddV2Sum_4/reduction_indicesgradients/Sum_4_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_4_grad/Shape
�
gradients/Sum_4_grad/modFloorModgradients/Sum_4_grad/addgradients/Sum_4_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_4_grad/Shape
t
gradients/Sum_4_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_4_grad/range/startConst*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_4_grad/range/deltaConst*
dtype0*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
value	B :
�
gradients/Sum_4_grad/rangeRange gradients/Sum_4_grad/range/startgradients/Sum_4_grad/Size gradients/Sum_4_grad/range/delta*-
_class#
!loc:@gradients/Sum_4_grad/Shape*

Tidx0
x
gradients/Sum_4_grad/Fill/valueConst*
dtype0*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
value	B :
�
gradients/Sum_4_grad/FillFillgradients/Sum_4_grad/Shape_1gradients/Sum_4_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_4_grad/Shape*

index_type0
�
"gradients/Sum_4_grad/DynamicStitchDynamicStitchgradients/Sum_4_grad/rangegradients/Sum_4_grad/modgradients/Sum_4_grad/Shapegradients/Sum_4_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
N
w
gradients/Sum_4_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_4_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_4_grad/MaximumMaximum"gradients/Sum_4_grad/DynamicStitchgradients/Sum_4_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_4_grad/Shape
�
gradients/Sum_4_grad/floordivFloorDivgradients/Sum_4_grad/Shapegradients/Sum_4_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_4_grad/Shape
�
gradients/Sum_4_grad/ReshapeReshape3gradients/truediv_5_grad/tuple/control_dependency_1"gradients/Sum_4_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_4_grad/TileTilegradients/Sum_4_grad/Reshapegradients/Sum_4_grad/floordiv*
T0*

Tmultiples0
�
gradients/AddN_4AddN1gradients/truediv_3_grad/tuple/control_dependencygradients/Sum_2_grad/Tile*
T0*3
_class)
'%loc:@gradients/truediv_3_grad/Reshape*
N
C
gradients/Mul_1_grad/ShapeShapeadd_5*
T0*
out_type0
O
gradients/Mul_1_grad/Shape_1Shapestrided_slice_8*
T0*
out_type0
�
*gradients/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Mul_1_grad/Shapegradients/Mul_1_grad/Shape_1*
T0
K
gradients/Mul_1_grad/MulMulgradients/AddN_4strided_slice_8*
T0
�
gradients/Mul_1_grad/SumSumgradients/Mul_1_grad/Mul*gradients/Mul_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
t
gradients/Mul_1_grad/ReshapeReshapegradients/Mul_1_grad/Sumgradients/Mul_1_grad/Shape*
T0*
Tshape0
C
gradients/Mul_1_grad/Mul_1Muladd_5gradients/AddN_4*
T0
�
gradients/Mul_1_grad/Sum_1Sumgradients/Mul_1_grad/Mul_1,gradients/Mul_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
z
gradients/Mul_1_grad/Reshape_1Reshapegradients/Mul_1_grad/Sum_1gradients/Mul_1_grad/Shape_1*
T0*
Tshape0
m
%gradients/Mul_1_grad/tuple/group_depsNoOp^gradients/Mul_1_grad/Reshape^gradients/Mul_1_grad/Reshape_1
�
-gradients/Mul_1_grad/tuple/control_dependencyIdentitygradients/Mul_1_grad/Reshape&^gradients/Mul_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/Mul_1_grad/Reshape
�
/gradients/Mul_1_grad/tuple/control_dependency_1Identitygradients/Mul_1_grad/Reshape_1&^gradients/Mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Mul_1_grad/Reshape_1
�
gradients/AddN_5AddN1gradients/truediv_4_grad/tuple/control_dependencygradients/Sum_3_grad/Tile*
T0*3
_class)
'%loc:@gradients/truediv_4_grad/Reshape*
N
C
gradients/Mul_2_grad/ShapeShapeadd_6*
T0*
out_type0
O
gradients/Mul_2_grad/Shape_1Shapestrided_slice_9*
T0*
out_type0
�
*gradients/Mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Mul_2_grad/Shapegradients/Mul_2_grad/Shape_1*
T0
K
gradients/Mul_2_grad/MulMulgradients/AddN_5strided_slice_9*
T0
�
gradients/Mul_2_grad/SumSumgradients/Mul_2_grad/Mul*gradients/Mul_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/Mul_2_grad/ReshapeReshapegradients/Mul_2_grad/Sumgradients/Mul_2_grad/Shape*
T0*
Tshape0
C
gradients/Mul_2_grad/Mul_1Muladd_6gradients/AddN_5*
T0
�
gradients/Mul_2_grad/Sum_1Sumgradients/Mul_2_grad/Mul_1,gradients/Mul_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
z
gradients/Mul_2_grad/Reshape_1Reshapegradients/Mul_2_grad/Sum_1gradients/Mul_2_grad/Shape_1*
T0*
Tshape0
m
%gradients/Mul_2_grad/tuple/group_depsNoOp^gradients/Mul_2_grad/Reshape^gradients/Mul_2_grad/Reshape_1
�
-gradients/Mul_2_grad/tuple/control_dependencyIdentitygradients/Mul_2_grad/Reshape&^gradients/Mul_2_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/Mul_2_grad/Reshape
�
/gradients/Mul_2_grad/tuple/control_dependency_1Identitygradients/Mul_2_grad/Reshape_1&^gradients/Mul_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Mul_2_grad/Reshape_1
�
gradients/AddN_6AddN1gradients/truediv_5_grad/tuple/control_dependencygradients/Sum_4_grad/Tile*
T0*3
_class)
'%loc:@gradients/truediv_5_grad/Reshape*
N
C
gradients/Mul_3_grad/ShapeShapeadd_7*
T0*
out_type0
P
gradients/Mul_3_grad/Shape_1Shapestrided_slice_10*
T0*
out_type0
�
*gradients/Mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Mul_3_grad/Shapegradients/Mul_3_grad/Shape_1*
T0
L
gradients/Mul_3_grad/MulMulgradients/AddN_6strided_slice_10*
T0
�
gradients/Mul_3_grad/SumSumgradients/Mul_3_grad/Mul*gradients/Mul_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
t
gradients/Mul_3_grad/ReshapeReshapegradients/Mul_3_grad/Sumgradients/Mul_3_grad/Shape*
T0*
Tshape0
C
gradients/Mul_3_grad/Mul_1Muladd_7gradients/AddN_6*
T0
�
gradients/Mul_3_grad/Sum_1Sumgradients/Mul_3_grad/Mul_1,gradients/Mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/Mul_3_grad/Reshape_1Reshapegradients/Mul_3_grad/Sum_1gradients/Mul_3_grad/Shape_1*
T0*
Tshape0
m
%gradients/Mul_3_grad/tuple/group_depsNoOp^gradients/Mul_3_grad/Reshape^gradients/Mul_3_grad/Reshape_1
�
-gradients/Mul_3_grad/tuple/control_dependencyIdentitygradients/Mul_3_grad/Reshape&^gradients/Mul_3_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/Mul_3_grad/Reshape
�
/gradients/Mul_3_grad/tuple/control_dependency_1Identitygradients/Mul_3_grad/Reshape_1&^gradients/Mul_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Mul_3_grad/Reshape_1
E
gradients/add_5_grad/ShapeShapeSoftmax*
T0*
out_type0
G
gradients/add_5_grad/Shape_1Shapeadd_5/y*
T0*
out_type0
�
*gradients/add_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_5_grad/Shapegradients/add_5_grad/Shape_1*
T0
�
gradients/add_5_grad/SumSum-gradients/Mul_1_grad/tuple/control_dependency*gradients/add_5_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
t
gradients/add_5_grad/ReshapeReshapegradients/add_5_grad/Sumgradients/add_5_grad/Shape*
T0*
Tshape0
�
gradients/add_5_grad/Sum_1Sum-gradients/Mul_1_grad/tuple/control_dependency,gradients/add_5_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
z
gradients/add_5_grad/Reshape_1Reshapegradients/add_5_grad/Sum_1gradients/add_5_grad/Shape_1*
T0*
Tshape0
m
%gradients/add_5_grad/tuple/group_depsNoOp^gradients/add_5_grad/Reshape^gradients/add_5_grad/Reshape_1
�
-gradients/add_5_grad/tuple/control_dependencyIdentitygradients/add_5_grad/Reshape&^gradients/add_5_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_5_grad/Reshape
�
/gradients/add_5_grad/tuple/control_dependency_1Identitygradients/add_5_grad/Reshape_1&^gradients/add_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_5_grad/Reshape_1
G
gradients/add_6_grad/ShapeShape	Softmax_1*
T0*
out_type0
G
gradients/add_6_grad/Shape_1Shapeadd_6/y*
T0*
out_type0
�
*gradients/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_6_grad/Shapegradients/add_6_grad/Shape_1*
T0
�
gradients/add_6_grad/SumSum-gradients/Mul_2_grad/tuple/control_dependency*gradients/add_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/add_6_grad/ReshapeReshapegradients/add_6_grad/Sumgradients/add_6_grad/Shape*
T0*
Tshape0
�
gradients/add_6_grad/Sum_1Sum-gradients/Mul_2_grad/tuple/control_dependency,gradients/add_6_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/add_6_grad/Reshape_1Reshapegradients/add_6_grad/Sum_1gradients/add_6_grad/Shape_1*
T0*
Tshape0
m
%gradients/add_6_grad/tuple/group_depsNoOp^gradients/add_6_grad/Reshape^gradients/add_6_grad/Reshape_1
�
-gradients/add_6_grad/tuple/control_dependencyIdentitygradients/add_6_grad/Reshape&^gradients/add_6_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_6_grad/Reshape
�
/gradients/add_6_grad/tuple/control_dependency_1Identitygradients/add_6_grad/Reshape_1&^gradients/add_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_6_grad/Reshape_1
G
gradients/add_7_grad/ShapeShape	Softmax_2*
T0*
out_type0
G
gradients/add_7_grad/Shape_1Shapeadd_7/y*
T0*
out_type0
�
*gradients/add_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_7_grad/Shapegradients/add_7_grad/Shape_1*
T0
�
gradients/add_7_grad/SumSum-gradients/Mul_3_grad/tuple/control_dependency*gradients/add_7_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/add_7_grad/ReshapeReshapegradients/add_7_grad/Sumgradients/add_7_grad/Shape*
T0*
Tshape0
�
gradients/add_7_grad/Sum_1Sum-gradients/Mul_3_grad/tuple/control_dependency,gradients/add_7_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/add_7_grad/Reshape_1Reshapegradients/add_7_grad/Sum_1gradients/add_7_grad/Shape_1*
T0*
Tshape0
m
%gradients/add_7_grad/tuple/group_depsNoOp^gradients/add_7_grad/Reshape^gradients/add_7_grad/Reshape_1
�
-gradients/add_7_grad/tuple/control_dependencyIdentitygradients/add_7_grad/Reshape&^gradients/add_7_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_7_grad/Reshape
�
/gradients/add_7_grad/tuple/control_dependency_1Identitygradients/add_7_grad/Reshape_1&^gradients/add_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_7_grad/Reshape_1
b
gradients/Softmax_grad/mulMul-gradients/add_5_grad/tuple/control_dependencySoftmax*
T0
_
,gradients/Softmax_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients/Softmax_grad/SumSumgradients/Softmax_grad/mul,gradients/Softmax_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
u
gradients/Softmax_grad/subSub-gradients/add_5_grad/tuple/control_dependencygradients/Softmax_grad/Sum*
T0
Q
gradients/Softmax_grad/mul_1Mulgradients/Softmax_grad/subSoftmax*
T0
f
gradients/Softmax_1_grad/mulMul-gradients/add_6_grad/tuple/control_dependency	Softmax_1*
T0
a
.gradients/Softmax_1_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients/Softmax_1_grad/SumSumgradients/Softmax_1_grad/mul.gradients/Softmax_1_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
y
gradients/Softmax_1_grad/subSub-gradients/add_6_grad/tuple/control_dependencygradients/Softmax_1_grad/Sum*
T0
W
gradients/Softmax_1_grad/mul_1Mulgradients/Softmax_1_grad/sub	Softmax_1*
T0
f
gradients/Softmax_2_grad/mulMul-gradients/add_7_grad/tuple/control_dependency	Softmax_2*
T0
a
.gradients/Softmax_2_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients/Softmax_2_grad/SumSumgradients/Softmax_2_grad/mul.gradients/Softmax_2_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
y
gradients/Softmax_2_grad/subSub-gradients/add_7_grad/tuple/control_dependencygradients/Softmax_2_grad/Sum*
T0
W
gradients/Softmax_2_grad/mul_1Mulgradients/Softmax_2_grad/sub	Softmax_2*
T0
T
$gradients/strided_slice_5_grad/ShapeShapeaction_probs*
T0*
out_type0
�
/gradients/strided_slice_5_grad/StridedSliceGradStridedSliceGrad$gradients/strided_slice_5_grad/Shapestrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2gradients/Softmax_grad/mul_1*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
T
$gradients/strided_slice_6_grad/ShapeShapeaction_probs*
T0*
out_type0
�
/gradients/strided_slice_6_grad/StridedSliceGradStridedSliceGrad$gradients/strided_slice_6_grad/Shapestrided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2gradients/Softmax_1_grad/mul_1*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
T
$gradients/strided_slice_7_grad/ShapeShapeaction_probs*
T0*
out_type0
�
/gradients/strided_slice_7_grad/StridedSliceGradStridedSliceGrad$gradients/strided_slice_7_grad/Shapestrided_slice_7/stackstrided_slice_7/stack_1strided_slice_7/stack_2gradients/Softmax_2_grad/mul_1*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask 
�
gradients/AddN_7AddN0gradients/strided_slice_21_grad/StridedSliceGrad0gradients/strided_slice_23_grad/StridedSliceGrad0gradients/strided_slice_25_grad/StridedSliceGrad0gradients/strided_slice_20_grad/StridedSliceGrad0gradients/strided_slice_22_grad/StridedSliceGrad0gradients/strided_slice_24_grad/StridedSliceGrad/gradients/strided_slice_5_grad/StridedSliceGrad/gradients/strided_slice_6_grad/StridedSliceGrad/gradients/strided_slice_7_grad/StridedSliceGrad*
T0*C
_class9
75loc:@gradients/strided_slice_21_grad/StridedSliceGrad*
N	
J
 gradients/action_probs_grad/RankConst*
dtype0*
value	B :
i
gradients/action_probs_grad/modFloorModaction_probs/axis gradients/action_probs_grad/Rank*
T0
Q
!gradients/action_probs_grad/ShapeShapedense/MatMul*
T0*
out_type0
|
"gradients/action_probs_grad/ShapeNShapeNdense/MatMuldense_1/MatMuldense_2/MatMul*
N*
T0*
out_type0
�
(gradients/action_probs_grad/ConcatOffsetConcatOffsetgradients/action_probs_grad/mod"gradients/action_probs_grad/ShapeN$gradients/action_probs_grad/ShapeN:1$gradients/action_probs_grad/ShapeN:2*
N
�
!gradients/action_probs_grad/SliceSlicegradients/AddN_7(gradients/action_probs_grad/ConcatOffset"gradients/action_probs_grad/ShapeN*
T0*
Index0
�
#gradients/action_probs_grad/Slice_1Slicegradients/AddN_7*gradients/action_probs_grad/ConcatOffset:1$gradients/action_probs_grad/ShapeN:1*
T0*
Index0
�
#gradients/action_probs_grad/Slice_2Slicegradients/AddN_7*gradients/action_probs_grad/ConcatOffset:2$gradients/action_probs_grad/ShapeN:2*
T0*
Index0
�
,gradients/action_probs_grad/tuple/group_depsNoOp"^gradients/action_probs_grad/Slice$^gradients/action_probs_grad/Slice_1$^gradients/action_probs_grad/Slice_2
�
4gradients/action_probs_grad/tuple/control_dependencyIdentity!gradients/action_probs_grad/Slice-^gradients/action_probs_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients/action_probs_grad/Slice
�
6gradients/action_probs_grad/tuple/control_dependency_1Identity#gradients/action_probs_grad/Slice_1-^gradients/action_probs_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/action_probs_grad/Slice_1
�
6gradients/action_probs_grad/tuple/control_dependency_2Identity#gradients/action_probs_grad/Slice_2-^gradients/action_probs_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/action_probs_grad/Slice_2
�
"gradients/dense/MatMul_grad/MatMulMatMul4gradients/action_probs_grad/tuple/control_dependencydense/kernel/read*
transpose_a( *
transpose_b(*
T0
�
$gradients/dense/MatMul_grad/MatMul_1MatMul	Reshape_24gradients/action_probs_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
,gradients/dense/MatMul_grad/tuple/group_depsNoOp#^gradients/dense/MatMul_grad/MatMul%^gradients/dense/MatMul_grad/MatMul_1
�
4gradients/dense/MatMul_grad/tuple/control_dependencyIdentity"gradients/dense/MatMul_grad/MatMul-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense/MatMul_grad/MatMul
�
6gradients/dense/MatMul_grad/tuple/control_dependency_1Identity$gradients/dense/MatMul_grad/MatMul_1-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense/MatMul_grad/MatMul_1
�
$gradients/dense_1/MatMul_grad/MatMulMatMul6gradients/action_probs_grad/tuple/control_dependency_1dense_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
&gradients/dense_1/MatMul_grad/MatMul_1MatMul	Reshape_26gradients/action_probs_grad/tuple/control_dependency_1*
T0*
transpose_a(*
transpose_b( 
�
.gradients/dense_1/MatMul_grad/tuple/group_depsNoOp%^gradients/dense_1/MatMul_grad/MatMul'^gradients/dense_1/MatMul_grad/MatMul_1
�
6gradients/dense_1/MatMul_grad/tuple/control_dependencyIdentity$gradients/dense_1/MatMul_grad/MatMul/^gradients/dense_1/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense_1/MatMul_grad/MatMul
�
8gradients/dense_1/MatMul_grad/tuple/control_dependency_1Identity&gradients/dense_1/MatMul_grad/MatMul_1/^gradients/dense_1/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/dense_1/MatMul_grad/MatMul_1
�
$gradients/dense_2/MatMul_grad/MatMulMatMul6gradients/action_probs_grad/tuple/control_dependency_2dense_2/kernel/read*
transpose_a( *
transpose_b(*
T0
�
&gradients/dense_2/MatMul_grad/MatMul_1MatMul	Reshape_26gradients/action_probs_grad/tuple/control_dependency_2*
T0*
transpose_a(*
transpose_b( 
�
.gradients/dense_2/MatMul_grad/tuple/group_depsNoOp%^gradients/dense_2/MatMul_grad/MatMul'^gradients/dense_2/MatMul_grad/MatMul_1
�
6gradients/dense_2/MatMul_grad/tuple/control_dependencyIdentity$gradients/dense_2/MatMul_grad/MatMul/^gradients/dense_2/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense_2/MatMul_grad/MatMul
�
8gradients/dense_2/MatMul_grad/tuple/control_dependency_1Identity&gradients/dense_2/MatMul_grad/MatMul_1/^gradients/dense_2/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/dense_2/MatMul_grad/MatMul_1
�
gradients/AddN_8AddN>gradients/extrinsic_value/MatMul_grad/tuple/control_dependency>gradients/curiosity_value/MatMul_grad/tuple/control_dependency4gradients/dense/MatMul_grad/tuple/control_dependency6gradients/dense_1/MatMul_grad/tuple/control_dependency6gradients/dense_2/MatMul_grad/tuple/control_dependency*
T0*?
_class5
31loc:@gradients/extrinsic_value/MatMul_grad/MatMul*
N
V
gradients/Reshape_2_grad/ShapeShapelstm/rnn/transpose_1*
T0*
out_type0
t
 gradients/Reshape_2_grad/ReshapeReshapegradients/AddN_8gradients/Reshape_2_grad/Shape*
T0*
Tshape0
f
5gradients/lstm/rnn/transpose_1_grad/InvertPermutationInvertPermutationlstm/rnn/concat_2*
T0
�
-gradients/lstm/rnn/transpose_1_grad/transpose	Transpose gradients/Reshape_2_grad/Reshape5gradients/lstm/rnn/transpose_1_grad/InvertPermutation*
Tperm0*
T0
�
^gradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3lstm/rnn/TensorArraylstm/rnn/while/Exit_2*'
_class
loc:@lstm/rnn/TensorArray*
source	gradients
�
Zgradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/gradient_flowIdentitylstm/rnn/while/Exit_2_^gradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*'
_class
loc:@lstm/rnn/TensorArray
�
dgradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3^gradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/TensorArrayGradV3lstm/rnn/TensorArrayStack/range-gradients/lstm/rnn/transpose_1_grad/transposeZgradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/gradient_flow*
T0
D
gradients/zeros_like_10	ZerosLikelstm/rnn/while/Exit_3*
T0
D
gradients/zeros_like_11	ZerosLikelstm/rnn/while/Exit_4*
T0
�
+gradients/lstm/rnn/while/Exit_2_grad/b_exitEnterdgradients/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant( *
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
+gradients/lstm/rnn/while/Exit_3_grad/b_exitEntergradients/zeros_like_10*
T0*
is_constant( *
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
+gradients/lstm/rnn/while/Exit_4_grad/b_exitEntergradients/zeros_like_11*
T0*
is_constant( *
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
/gradients/lstm/rnn/while/Switch_2_grad/b_switchMerge+gradients/lstm/rnn/while/Exit_2_grad/b_exit6gradients/lstm/rnn/while/Switch_2_grad_1/NextIteration*
T0*
N
�
/gradients/lstm/rnn/while/Switch_3_grad/b_switchMerge+gradients/lstm/rnn/while/Exit_3_grad/b_exit6gradients/lstm/rnn/while/Switch_3_grad_1/NextIteration*
N*
T0
�
/gradients/lstm/rnn/while/Switch_4_grad/b_switchMerge+gradients/lstm/rnn/while/Exit_4_grad/b_exit6gradients/lstm/rnn/while/Switch_4_grad_1/NextIteration*
T0*
N
�
,gradients/lstm/rnn/while/Merge_2_grad/SwitchSwitch/gradients/lstm/rnn/while/Switch_2_grad/b_switchgradients/b_count_2*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_2_grad/b_switch
m
6gradients/lstm/rnn/while/Merge_2_grad/tuple/group_depsNoOp-^gradients/lstm/rnn/while/Merge_2_grad/Switch
�
>gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependencyIdentity,gradients/lstm/rnn/while/Merge_2_grad/Switch7^gradients/lstm/rnn/while/Merge_2_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_2_grad/b_switch
�
@gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1Identity.gradients/lstm/rnn/while/Merge_2_grad/Switch:17^gradients/lstm/rnn/while/Merge_2_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_2_grad/b_switch
�
,gradients/lstm/rnn/while/Merge_3_grad/SwitchSwitch/gradients/lstm/rnn/while/Switch_3_grad/b_switchgradients/b_count_2*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_3_grad/b_switch
m
6gradients/lstm/rnn/while/Merge_3_grad/tuple/group_depsNoOp-^gradients/lstm/rnn/while/Merge_3_grad/Switch
�
>gradients/lstm/rnn/while/Merge_3_grad/tuple/control_dependencyIdentity,gradients/lstm/rnn/while/Merge_3_grad/Switch7^gradients/lstm/rnn/while/Merge_3_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_3_grad/b_switch
�
@gradients/lstm/rnn/while/Merge_3_grad/tuple/control_dependency_1Identity.gradients/lstm/rnn/while/Merge_3_grad/Switch:17^gradients/lstm/rnn/while/Merge_3_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_3_grad/b_switch
�
,gradients/lstm/rnn/while/Merge_4_grad/SwitchSwitch/gradients/lstm/rnn/while/Switch_4_grad/b_switchgradients/b_count_2*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_4_grad/b_switch
m
6gradients/lstm/rnn/while/Merge_4_grad/tuple/group_depsNoOp-^gradients/lstm/rnn/while/Merge_4_grad/Switch
�
>gradients/lstm/rnn/while/Merge_4_grad/tuple/control_dependencyIdentity,gradients/lstm/rnn/while/Merge_4_grad/Switch7^gradients/lstm/rnn/while/Merge_4_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_4_grad/b_switch
�
@gradients/lstm/rnn/while/Merge_4_grad/tuple/control_dependency_1Identity.gradients/lstm/rnn/while/Merge_4_grad/Switch:17^gradients/lstm/rnn/while/Merge_4_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_4_grad/b_switch
{
*gradients/lstm/rnn/while/Enter_2_grad/ExitExit>gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependency*
T0
{
*gradients/lstm/rnn/while/Enter_3_grad/ExitExit>gradients/lstm/rnn/while/Merge_3_grad/tuple/control_dependency*
T0
{
*gradients/lstm/rnn/while/Enter_4_grad/ExitExit>gradients/lstm/rnn/while/Merge_4_grad/tuple/control_dependency*
T0
�
cgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3igradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter@gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2*
source	gradients
�
igradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEnterlstm/rnn/TensorArray*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2*
is_constant(
�
_gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/gradient_flowIdentity@gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1d^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2
�
Sgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3TensorArrayReadV3cgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2_gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/gradient_flow*
dtype0
�
Ygradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/ConstConst*,
_class"
 loc:@lstm/rnn/while/Identity_1*
valueB :
���������*
dtype0
�
Ygradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/f_accStackV2Ygradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/Const*
	elem_type0*,
_class"
 loc:@lstm/rnn/while/Identity_1*

stack_name 
�
Ygradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/EnterEnterYgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
_gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPushV2StackPushV2Ygradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/Enterlstm/rnn/while/Identity_1^gradients/Add*
T0*
swap_memory( 
�
^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2
StackPopV2dgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
dgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2/EnterEnterYgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Zgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/b_syncControlTrigger_^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2U^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2W^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1S^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2U^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1I^gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2U^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2W^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1C^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2E^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2U^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2W^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1C^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2E^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2S^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2U^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1A^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2C^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2G^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2I^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1
�
Rgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/group_depsNoOpA^gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1T^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3
�
Zgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependencyIdentitySgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3S^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/group_deps*
T0*f
_class\
ZXloc:@gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3
�
\gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependency_1Identity@gradients/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1S^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_2_grad/b_switch
�
gradients/AddN_9AddN@gradients/lstm/rnn/while/Merge_4_grad/tuple/control_dependency_1Zgradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependency*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_4_grad/b_switch*
N
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/ShapeShape%lstm/rnn/while/basic_lstm_cell/Tanh_1*
T0*
out_type0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1Shape(lstm/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
out_type0
�
Igradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsTgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2Vgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/ConstConst*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape*
valueB :
���������*
dtype0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_accStackV2Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Const*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape*

stack_name *
	elem_type0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ugradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2StackPushV2Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Enter9gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape^gradients/Add*
swap_memory( *
T0
�
Tgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Zgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Zgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant(
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Const_1Const*
dtype0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1*
valueB :
���������
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc_1StackV2Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Const_1*
	elem_type0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1*

stack_name 
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Enter_1EnterQgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc_1*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Wgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Enter_1;gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1^gradients/Add*
T0*
swap_memory( 
�
Vgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2\gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients/Sub*
	elem_type0
�
\gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterQgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/MulMulgradients/AddN_9Bgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2*
T0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/ConstConst*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_2*
valueB :
���������*
dtype0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/f_accStackV2=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/Const*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_2*

stack_name *
	elem_type0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/EnterEnter=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Cgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPushV2StackPushV2=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/Enter(lstm/rnn/while/basic_lstm_cell/Sigmoid_2^gradients/Add*
swap_memory( *
T0
�
Bgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2
StackPopV2Hgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Hgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2/EnterEnter=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/SumSum7gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/MulIgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/ReshapeReshape7gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/SumTgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1MulDgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2gradients/AddN_9*
T0
�
?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/ConstConst*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/Tanh_1*
valueB :
���������*
dtype0
�
?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/f_accStackV2?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/Const*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/Tanh_1*

stack_name *
	elem_type0
�
?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/EnterEnter?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Egradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPushV2StackPushV2?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/Enter%lstm/rnn/while/basic_lstm_cell/Tanh_1^gradients/Add*
T0*
swap_memory( 
�
Dgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2
StackPopV2Jgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Jgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2/EnterEnter?gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Sum_1Sum9gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1Kgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1Reshape9gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Sum_1Vgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Dgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/group_depsNoOp<^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape>^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1
�
Lgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependencyIdentity;gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/ReshapeE^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape
�
Ngradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependency_1Identity=gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1E^gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1
�
=gradients/lstm/rnn/while/basic_lstm_cell/Tanh_1_grad/TanhGradTanhGradDgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2Lgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependency*
T0
�
Cgradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_2_grad/SigmoidGradSigmoidGradBgradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2Ngradients/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependency_1*
T0
�
6gradients/lstm/rnn/while/Switch_2_grad_1/NextIterationNextIteration\gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependency_1*
T0
�
gradients/AddN_10AddN@gradients/lstm/rnn/while/Merge_3_grad/tuple/control_dependency_1=gradients/lstm/rnn/while/basic_lstm_cell/Tanh_1_grad/TanhGrad*
T0*B
_class8
64loc:@gradients/lstm/rnn/while/Switch_3_grad/b_switch*
N

9gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/ShapeShape"lstm/rnn/while/basic_lstm_cell/Mul*
T0*
out_type0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1Shape$lstm/rnn/while/basic_lstm_cell/Mul_1*
T0*
out_type0
�
Igradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgsBroadcastGradientArgsTgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2Vgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/ConstConst*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape*
valueB :
���������*
dtype0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_accStackV2Ogradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Const*

stack_name *
	elem_type0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Ugradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2StackPushV2Ogradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Enter9gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape^gradients/Add*
T0*
swap_memory( 
�
Tgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Zgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Zgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Const_1Const*
dtype0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1*
valueB :
���������
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc_1StackV2Qgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Const_1*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1*

stack_name *
	elem_type0
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Enter_1EnterQgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Wgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Qgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Enter_1;gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1^gradients/Add*
swap_memory( *
T0
�
Vgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2\gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients/Sub*
	elem_type0
�
\gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterQgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
7gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/SumSumgradients/AddN_10Igradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/ReshapeReshape7gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/SumTgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
9gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Sum_1Sumgradients/AddN_10Kgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1Reshape9gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Sum_1Vgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Dgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/group_depsNoOp<^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape>^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1
�
Lgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependencyIdentity;gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/ReshapeE^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape
�
Ngradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency_1Identity=gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1E^gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1
t
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/ShapeShapelstm/rnn/while/Identity_3*
T0*
out_type0
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1Shape&lstm/rnn/while/basic_lstm_cell/Sigmoid*
T0*
out_type0
�
Ggradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsRgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2Tgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Mgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/ConstConst*J
_class@
><loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape*
valueB :
���������*
dtype0
�
Mgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_accStackV2Mgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Const*J
_class@
><loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape*

stack_name *
	elem_type0
�
Mgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/EnterEnterMgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Sgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2StackPushV2Mgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Enter7gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape^gradients/Add*
swap_memory( *
T0
�
Rgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Xgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Xgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2/EnterEnterMgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Const_1Const*
dtype0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1*
valueB :
���������
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc_1StackV2Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Const_1*
	elem_type0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1*

stack_name 
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Enter_1EnterOgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ugradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Enter_19gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1^gradients/Add*
swap_memory( *
T0
�
Tgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2Zgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients/Sub*
	elem_type0
�
Zgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
5gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/MulMulLgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2*
T0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/ConstConst*9
_class/
-+loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid*
valueB :
���������*
dtype0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/f_accStackV2;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/Const*9
_class/
-+loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid*

stack_name *
	elem_type0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/EnterEnter;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Agradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPushV2StackPushV2;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/Enter&lstm/rnn/while/basic_lstm_cell/Sigmoid^gradients/Add*
T0*
swap_memory( 
�
@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2
StackPopV2Fgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Fgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2/EnterEnter;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
5gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/SumSum5gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/MulGgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/ReshapeReshape5gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/SumRgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1MulBgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2Lgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency*
T0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/ConstConst*,
_class"
 loc:@lstm/rnn/while/Identity_3*
valueB :
���������*
dtype0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/f_accStackV2=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/Const*,
_class"
 loc:@lstm/rnn/while/Identity_3*

stack_name *
	elem_type0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/EnterEnter=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Cgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPushV2StackPushV2=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/Enterlstm/rnn/while/Identity_3^gradients/Add*
T0*
swap_memory( 
�
Bgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2
StackPopV2Hgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Hgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2/EnterEnter=gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Sum_1Sum7gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1Igradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1Reshape7gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Sum_1Tgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Bgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/group_depsNoOp:^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape<^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1
�
Jgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependencyIdentity9gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/ReshapeC^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape
�
Lgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependency_1Identity;gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1C^gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/ShapeShape(lstm/rnn/while/basic_lstm_cell/Sigmoid_1*
T0*
out_type0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1Shape#lstm/rnn/while/basic_lstm_cell/Tanh*
T0*
out_type0
�
Igradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsTgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2Vgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/ConstConst*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape*
valueB :
���������*
dtype0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_accStackV2Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Const*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape*

stack_name *
	elem_type0
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ugradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2StackPushV2Ogradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Enter9gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape^gradients/Add*
swap_memory( *
T0
�
Tgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Zgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Zgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Const_1Const*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1*
valueB :
���������*
dtype0
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc_1StackV2Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Const_1*

stack_name *
	elem_type0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1
�
Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Enter_1EnterQgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Wgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Qgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Enter_1;gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1^gradients/Add*
T0*
swap_memory( 
�
Vgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2\gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients/Sub*
	elem_type0
�
\gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterQgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/MulMulNgradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency_1Bgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2*
T0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/ConstConst*6
_class,
*(loc:@lstm/rnn/while/basic_lstm_cell/Tanh*
valueB :
���������*
dtype0
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/f_accStackV2=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/Const*

stack_name *
	elem_type0*6
_class,
*(loc:@lstm/rnn/while/basic_lstm_cell/Tanh
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/EnterEnter=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Cgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPushV2StackPushV2=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/Enter#lstm/rnn/while/basic_lstm_cell/Tanh^gradients/Add*
T0*
swap_memory( 
�
Bgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2
StackPopV2Hgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Hgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2/EnterEnter=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/f_acc*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant(
�
7gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/SumSum7gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/MulIgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
;gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/ReshapeReshape7gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/SumTgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1MulDgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2Ngradients/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency_1*
T0
�
?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/ConstConst*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_1*
valueB :
���������*
dtype0
�
?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/f_accStackV2?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/Const*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_1*

stack_name *
	elem_type0
�
?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/EnterEnter?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Egradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPushV2StackPushV2?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/Enter(lstm/rnn/while/basic_lstm_cell/Sigmoid_1^gradients/Add*
T0*
swap_memory( 
�
Dgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2
StackPopV2Jgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Jgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2/EnterEnter?gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/f_acc*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant(
�
9gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Sum_1Sum9gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1Kgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1Reshape9gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Sum_1Vgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Dgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/group_depsNoOp<^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape>^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1
�
Lgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependencyIdentity;gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/ReshapeE^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape
�
Ngradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependency_1Identity=gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1E^gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1
�
Agradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_grad/SigmoidGradSigmoidGrad@gradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2Lgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependency_1*
T0
�
Cgradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_1_grad/SigmoidGradSigmoidGradDgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2Lgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependency*
T0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Tanh_grad/TanhGradTanhGradBgradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2Ngradients/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependency_1*
T0
�
6gradients/lstm/rnn/while/Switch_3_grad_1/NextIterationNextIterationJgradients/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependency*
T0
�
7gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/ShapeShape&lstm/rnn/while/basic_lstm_cell/split:2*
T0*
out_type0
�
9gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1Shape&lstm/rnn/while/basic_lstm_cell/Const_2*
T0*
out_type0
�
Ggradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgsBroadcastGradientArgsRgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2Tgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Mgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/ConstConst*J
_class@
><loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape*
valueB :
���������*
dtype0
�
Mgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_accStackV2Mgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Const*
	elem_type0*J
_class@
><loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape*

stack_name 
�
Mgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/EnterEnterMgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Sgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2StackPushV2Mgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Enter7gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape^gradients/Add*
T0*
swap_memory( 
�
Rgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Xgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Xgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2/EnterEnterMgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Const_1Const*
dtype0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1*
valueB :
���������
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc_1StackV2Ogradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Const_1*

stack_name *
	elem_type0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1
�
Ogradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Enter_1EnterOgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc_1*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Ugradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Ogradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Enter_19gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1^gradients/Add*
T0*
swap_memory( 
�
Tgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2Zgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients/Sub*
	elem_type0
�
Zgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterOgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
5gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/SumSumAgradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_grad/SigmoidGradGgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
9gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/ReshapeReshape5gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/SumRgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
7gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Sum_1SumAgradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_grad/SigmoidGradIgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
;gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1Reshape7gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Sum_1Tgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Bgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/group_depsNoOp:^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape<^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1
�
Jgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/control_dependencyIdentity9gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/ReshapeC^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape
�
Lgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/control_dependency_1Identity;gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1C^gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1
�
:gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concatConcatV2Cgradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_1_grad/SigmoidGrad;gradients/lstm/rnn/while/basic_lstm_cell/Tanh_grad/TanhGradJgradients/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/control_dependencyCgradients/lstm/rnn/while/basic_lstm_cell/Sigmoid_2_grad/SigmoidGrad@gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concat/Const*
T0*
N*

Tidx0
z
@gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concat/ConstConst^gradients/Sub*
value	B :*
dtype0
�
Agradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGradBiasAddGrad:gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concat*
T0*
data_formatNHWC
�
Fgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/group_depsNoOpB^gradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGrad;^gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concat
�
Ngradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependencyIdentity:gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concatG^gradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients/lstm/rnn/while/basic_lstm_cell/split_grad/concat
�
Pgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGradG^gradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGrad
�
;gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMulMatMulNgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependencyAgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul/Enter*
T0*
transpose_a( *
transpose_b(
�
Agradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul/EnterEnter$lstm/rnn/basic_lstm_cell/kernel/read*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant(
�
=gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1MatMulHgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2Ngradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Cgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/ConstConst*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/concat*
valueB :
���������*
dtype0
�
Cgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/f_accStackV2Cgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/Const*

stack_name *
	elem_type0*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/concat
�
Cgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/EnterEnterCgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Igradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPushV2StackPushV2Cgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/Enter%lstm/rnn/while/basic_lstm_cell/concat^gradients/Add*
swap_memory( *
T0
�
Hgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2
StackPopV2Ngradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Ngradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2/EnterEnterCgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/f_acc*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant(
�
Egradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/group_depsNoOp<^gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul>^gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1
�
Mgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependencyIdentity;gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMulF^gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul
�
Ogradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependency_1Identity=gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1F^gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1
s
Agradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_accConst*
valueB�*    *
dtype0
�
Cgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_1EnterAgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc*
T0*
is_constant( *
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Cgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_2MergeCgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_1Igradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/NextIteration*
T0*
N
�
Bgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/SwitchSwitchCgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_2gradients/b_count_2*
T0
�
?gradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/AddAddDgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/Switch:1Pgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependency_1*
T0
�
Igradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/NextIterationNextIteration?gradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/Add*
T0
�
Cgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_3ExitBgradients/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/Switch*
T0
t
:gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ConstConst^gradients/Sub*
value	B :*
dtype0
s
9gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/RankConst^gradients/Sub*
value	B :*
dtype0
�
8gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/modFloorMod:gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Const9gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Rank*
T0
~
:gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeShape lstm/rnn/while/TensorArrayReadV3*
T0*
out_type0
�
;gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeNShapeNFgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2Hgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1*
T0*
out_type0*
N
�
Agradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/ConstConst*3
_class)
'%loc:@lstm/rnn/while/TensorArrayReadV3*
valueB :
���������*
dtype0
�
Agradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_accStackV2Agradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Const*3
_class)
'%loc:@lstm/rnn/while/TensorArrayReadV3*

stack_name *
	elem_type0
�
Agradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/EnterEnterAgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Ggradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2StackPushV2Agradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Enter lstm/rnn/while/TensorArrayReadV3^gradients/Add*
T0*
swap_memory( 
�
Fgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2
StackPopV2Lgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2/Enter^gradients/Sub*
	elem_type0
�
Lgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2/EnterEnterAgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Cgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Const_1Const*
dtype0*,
_class"
 loc:@lstm/rnn/while/Identity_4*
valueB :
���������
�
Cgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc_1StackV2Cgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Const_1*,
_class"
 loc:@lstm/rnn/while/Identity_4*

stack_name *
	elem_type0
�
Cgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Enter_1EnterCgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc_1*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Igradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2_1StackPushV2Cgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Enter_1lstm/rnn/while/Identity_4^gradients/Add*
swap_memory( *
T0
�
Hgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1
StackPopV2Ngradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1/Enter^gradients/Sub*
	elem_type0
�
Ngradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1/EnterEnterCgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc_1*
T0*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Agradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ConcatOffsetConcatOffset8gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/mod;gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN=gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN:1*
N
�
:gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/SliceSliceMgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependencyAgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ConcatOffset;gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN*
T0*
Index0
�
<gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1SliceMgradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependencyCgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ConcatOffset:1=gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN:1*
T0*
Index0
�
Egradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/group_depsNoOp;^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice=^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1
�
Mgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependencyIdentity:gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/SliceF^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice
�
Ogradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependency_1Identity<gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1F^gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1
w
@gradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_accConst*
valueB
��*    *
dtype0
�
Bgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_1Enter@gradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc*
T0*
is_constant( *
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Bgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_2MergeBgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_1Hgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/NextIteration*
T0*
N
�
Agradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/SwitchSwitchBgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_2gradients/b_count_2*
T0
�
>gradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/AddAddCgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/Switch:1Ogradients/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependency_1*
T0
�
Hgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/NextIterationNextIteration>gradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/Add*
T0
�
Bgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_3ExitAgradients/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/Switch*
T0
�
Qgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3Wgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterYgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1^gradients/Sub*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter*
source	gradients
�
Wgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEnterlstm/rnn/TensorArray_1*
T0*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter*
is_constant(*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context
�
Ygradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1EnterClstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter*
is_constant(
�
Mgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flowIdentityYgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1R^gradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter
�
Sgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3Qgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3^gradients/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2Mgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependencyMgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flow*
T0
j
=gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_accConst*
valueB
 *    *
dtype0
�
?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Enter=gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc*
parallel_iterations *6

frame_name(&gradients/lstm/rnn/while/while_context*
T0*
is_constant( 
�
?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2Merge?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Egradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIteration*
T0*
N
�
>gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/SwitchSwitch?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2gradients/b_count_2*
T0
�
;gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/AddAdd@gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch:1Sgradients/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3*
T0
�
Egradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIterationNextIteration;gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/Add*
T0
�
?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3Exit>gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch*
T0
�
6gradients/lstm/rnn/while/Switch_4_grad_1/NextIterationNextIterationOgradients/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependency_1*
T0
�
tgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3lstm/rnn/TensorArray_1?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*)
_class
loc:@lstm/rnn/TensorArray_1*
source	gradients
�
pgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flowIdentity?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3u^gradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*)
_class
loc:@lstm/rnn/TensorArray_1
�
fgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3TensorArrayGatherV3tgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3!lstm/rnn/TensorArrayUnstack/rangepgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flow*
dtype0*
element_shape:
�
cgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_depsNoOpg^gradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3@^gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3
�
kgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependencyIdentityfgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3d^gradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*y
_classo
mkloc:@gradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3
�
mgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency_1Identity?gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3d^gradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3
b
3gradients/lstm/rnn/transpose_grad/InvertPermutationInvertPermutationlstm/rnn/concat*
T0
�
+gradients/lstm/rnn/transpose_grad/transpose	Transposekgradients/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency3gradients/lstm/rnn/transpose_grad/InvertPermutation*
Tperm0*
T0
H
gradients/Reshape_grad/ShapeShapeconcat_1*
T0*
out_type0
�
gradients/Reshape_grad/ReshapeReshape+gradients/lstm/rnn/transpose_grad/transposegradients/Reshape_grad/Shape*
T0*
Tshape0
F
gradients/concat_1_grad/RankConst*
value	B :*
dtype0
]
gradients/concat_1_grad/modFloorModconcat_1/axisgradients/concat_1_grad/Rank*
T0
Z
gradients/concat_1_grad/ShapeShapemain_graph_0/hidden_1/Mul*
T0*
out_type0
m
gradients/concat_1_grad/ShapeNShapeNmain_graph_0/hidden_1/Mulconcat*
T0*
out_type0*
N
�
$gradients/concat_1_grad/ConcatOffsetConcatOffsetgradients/concat_1_grad/modgradients/concat_1_grad/ShapeN gradients/concat_1_grad/ShapeN:1*
N
�
gradients/concat_1_grad/SliceSlicegradients/Reshape_grad/Reshape$gradients/concat_1_grad/ConcatOffsetgradients/concat_1_grad/ShapeN*
T0*
Index0
�
gradients/concat_1_grad/Slice_1Slicegradients/Reshape_grad/Reshape&gradients/concat_1_grad/ConcatOffset:1 gradients/concat_1_grad/ShapeN:1*
T0*
Index0
r
(gradients/concat_1_grad/tuple/group_depsNoOp^gradients/concat_1_grad/Slice ^gradients/concat_1_grad/Slice_1
�
0gradients/concat_1_grad/tuple/control_dependencyIdentitygradients/concat_1_grad/Slice)^gradients/concat_1_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/concat_1_grad/Slice
�
2gradients/concat_1_grad/tuple/control_dependency_1Identitygradients/concat_1_grad/Slice_1)^gradients/concat_1_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/concat_1_grad/Slice_1
o
.gradients/main_graph_0/hidden_1/Mul_grad/ShapeShapemain_graph_0/hidden_1/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_1/Mul_grad/Shape_1Shapemain_graph_0/hidden_1/Sigmoid*
T0*
out_type0
�
>gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_1/Mul_grad/Shape0gradients/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0
�
,gradients/main_graph_0/hidden_1/Mul_grad/MulMul0gradients/concat_1_grad/tuple/control_dependencymain_graph_0/hidden_1/Sigmoid*
T0
�
,gradients/main_graph_0/hidden_1/Mul_grad/SumSum,gradients/main_graph_0/hidden_1/Mul_grad/Mul>gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
0gradients/main_graph_0/hidden_1/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_1/Mul_grad/Sum.gradients/main_graph_0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
.gradients/main_graph_0/hidden_1/Mul_grad/Mul_1Mulmain_graph_0/hidden_1/BiasAdd0gradients/concat_1_grad/tuple/control_dependency*
T0
�
.gradients/main_graph_0/hidden_1/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_1/Mul_grad/Mul_1@gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
2gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_1/Mul_grad/Sum_10gradients/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
9gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_1/Mul_grad/Reshape3^gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1
�
Agradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_1/Mul_grad/Reshape:^gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape
�
Cgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1
�
8gradients/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_1/SigmoidCgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients/AddN_11AddNAgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape*
N
z
8gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_11*
T0*
data_formatNHWC
�
=gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_119^gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
�
Egradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_11>^gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape
�
Ggradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
�
2gradients/main_graph_0/hidden_1/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
4gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_0/MulEgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
<gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_1/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1
�
Dgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_1/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_1/MatMul_grad/MatMul
�
Fgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_0/Mul_grad/ShapeShapemain_graph_0/hidden_0/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_0/Mul_grad/Shape_1Shapemain_graph_0/hidden_0/Sigmoid*
T0*
out_type0
�
>gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_0/Mul_grad/Shape0gradients/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0
�
,gradients/main_graph_0/hidden_0/Mul_grad/MulMulDgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_0/Sigmoid*
T0
�
,gradients/main_graph_0/hidden_0/Mul_grad/SumSum,gradients/main_graph_0/hidden_0/Mul_grad/Mul>gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
0gradients/main_graph_0/hidden_0/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_0/Mul_grad/Sum.gradients/main_graph_0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
.gradients/main_graph_0/hidden_0/Mul_grad/Mul_1Mulmain_graph_0/hidden_0/BiasAddDgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
.gradients/main_graph_0/hidden_0/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_0/Mul_grad/Mul_1@gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
2gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_0/Mul_grad/Sum_10gradients/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
9gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_0/Mul_grad/Reshape3^gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1
�
Agradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_0/Mul_grad/Reshape:^gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape
�
Cgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1
�
8gradients/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_0/SigmoidCgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients/AddN_12AddNAgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGrad*
N*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape
z
8gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_12*
T0*
data_formatNHWC
�
=gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_129^gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
�
Egradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_12>^gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape
�
Ggradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
�
2gradients/main_graph_0/hidden_0/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b(
�
4gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1MatMulnormalized_stateEgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
�
<gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_0/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1
�
Dgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_0/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_0/MatMul_grad/MatMul
�
Fgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1
:
gradients_1/ShapeConst*
valueB *
dtype0
B
gradients_1/grad_ys_0Const*
valueB
 *  �?*
dtype0
]
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*
T0*

index_type0
=
gradients_1/f_countConst*
dtype0*
value	B : 
�
gradients_1/f_count_1Entergradients_1/f_count*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant( 
^
gradients_1/MergeMergegradients_1/f_count_1gradients_1/NextIteration*
T0*
N
Q
gradients_1/SwitchSwitchgradients_1/Mergelstm/rnn/while/LoopCond*
T0
U
gradients_1/Add/yConst^lstm/rnn/while/Identity*
value	B :*
dtype0
H
gradients_1/AddAddgradients_1/Switch:1gradients_1/Add/y*
T0
�
gradients_1/NextIterationNextIterationgradients_1/Addb^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPushV2X^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2Z^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2_1V^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2X^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2_1L^gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPushV2X^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2Z^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2_1F^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPushV2H^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPushV2X^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2Z^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2_1F^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPushV2H^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPushV2V^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2X^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2_1D^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPushV2F^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPushV2J^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2L^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2_1*
T0
:
gradients_1/f_count_2Exitgradients_1/Switch*
T0
=
gradients_1/b_countConst*
value	B :*
dtype0
�
gradients_1/b_count_1Entergradients_1/f_count_2*
T0*
is_constant( *
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
b
gradients_1/Merge_1Mergegradients_1/b_count_1gradients_1/NextIteration_1*
T0*
N
f
gradients_1/GreaterEqualGreaterEqualgradients_1/Merge_1gradients_1/GreaterEqual/Enter*
T0
�
gradients_1/GreaterEqual/EnterEntergradients_1/b_count*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
;
gradients_1/b_count_2LoopCondgradients_1/GreaterEqual
S
gradients_1/Switch_1Switchgradients_1/Merge_1gradients_1/b_count_2*
T0
W
gradients_1/SubSubgradients_1/Switch_1:1gradients_1/GreaterEqual/Enter*
T0
�
gradients_1/NextIteration_1NextIterationgradients_1/Sub]^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/b_sync*
T0
<
gradients_1/b_count_3Exitgradients_1/Switch_1*
T0
<
gradients_1/sub_7_grad/NegNeggradients_1/Fill*
T0
_
'gradients_1/sub_7_grad/tuple/group_depsNoOp^gradients_1/Fill^gradients_1/sub_7_grad/Neg
�
/gradients_1/sub_7_grad/tuple/control_dependencyIdentitygradients_1/Fill(^gradients_1/sub_7_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill
�
1gradients_1/sub_7_grad/tuple/control_dependency_1Identitygradients_1/sub_7_grad/Neg(^gradients_1/sub_7_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/sub_7_grad/Neg
b
(gradients_1/add_26_grad/tuple/group_depsNoOp0^gradients_1/sub_7_grad/tuple/control_dependency
�
0gradients_1/add_26_grad/tuple/control_dependencyIdentity/gradients_1/sub_7_grad/tuple/control_dependency)^gradients_1/add_26_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill
�
2gradients_1/add_26_grad/tuple/control_dependency_1Identity/gradients_1/sub_7_grad/tuple/control_dependency)^gradients_1/add_26_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill
f
gradients_1/mul_10_grad/MulMul1gradients_1/sub_7_grad/tuple/control_dependency_1Mean_5*
T0
s
gradients_1/mul_10_grad/Mul_1Mul1gradients_1/sub_7_grad/tuple/control_dependency_1PolynomialDecay_1*
T0
n
(gradients_1/mul_10_grad/tuple/group_depsNoOp^gradients_1/mul_10_grad/Mul^gradients_1/mul_10_grad/Mul_1
�
0gradients_1/mul_10_grad/tuple/control_dependencyIdentitygradients_1/mul_10_grad/Mul)^gradients_1/mul_10_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_1/mul_10_grad/Mul
�
2gradients_1/mul_10_grad/tuple/control_dependency_1Identitygradients_1/mul_10_grad/Mul_1)^gradients_1/mul_10_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_1/mul_10_grad/Mul_1
\
gradients_1/Neg_8_grad/NegNeg0gradients_1/add_26_grad/tuple/control_dependency*
T0
f
gradients_1/mul_9_grad/MulMul2gradients_1/add_26_grad/tuple/control_dependency_1Mean_3*
T0
i
gradients_1/mul_9_grad/Mul_1Mul2gradients_1/add_26_grad/tuple/control_dependency_1mul_9/x*
T0
k
'gradients_1/mul_9_grad/tuple/group_depsNoOp^gradients_1/mul_9_grad/Mul^gradients_1/mul_9_grad/Mul_1
�
/gradients_1/mul_9_grad/tuple/control_dependencyIdentitygradients_1/mul_9_grad/Mul(^gradients_1/mul_9_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/mul_9_grad/Mul
�
1gradients_1/mul_9_grad/tuple/control_dependency_1Identitygradients_1/mul_9_grad/Mul_1(^gradients_1/mul_9_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_1/mul_9_grad/Mul_1
S
%gradients_1/Mean_5_grad/Reshape/shapeConst*
dtype0*
valueB:
�
gradients_1/Mean_5_grad/ReshapeReshape2gradients_1/mul_10_grad/tuple/control_dependency_1%gradients_1/Mean_5_grad/Reshape/shape*
T0*
Tshape0
U
gradients_1/Mean_5_grad/ShapeShapeDynamicPartition_3:1*
T0*
out_type0

gradients_1/Mean_5_grad/TileTilegradients_1/Mean_5_grad/Reshapegradients_1/Mean_5_grad/Shape*

Tmultiples0*
T0
W
gradients_1/Mean_5_grad/Shape_1ShapeDynamicPartition_3:1*
T0*
out_type0
H
gradients_1/Mean_5_grad/Shape_2Const*
valueB *
dtype0
K
gradients_1/Mean_5_grad/ConstConst*
valueB: *
dtype0
�
gradients_1/Mean_5_grad/ProdProdgradients_1/Mean_5_grad/Shape_1gradients_1/Mean_5_grad/Const*
T0*

Tidx0*
	keep_dims( 
M
gradients_1/Mean_5_grad/Const_1Const*
valueB: *
dtype0
�
gradients_1/Mean_5_grad/Prod_1Prodgradients_1/Mean_5_grad/Shape_2gradients_1/Mean_5_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_5_grad/Maximum/yConst*
dtype0*
value	B :
v
gradients_1/Mean_5_grad/MaximumMaximumgradients_1/Mean_5_grad/Prod_1!gradients_1/Mean_5_grad/Maximum/y*
T0
t
 gradients_1/Mean_5_grad/floordivFloorDivgradients_1/Mean_5_grad/Prodgradients_1/Mean_5_grad/Maximum*
T0
n
gradients_1/Mean_5_grad/CastCast gradients_1/Mean_5_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_1/Mean_5_grad/truedivRealDivgradients_1/Mean_5_grad/Tilegradients_1/Mean_5_grad/Cast*
T0
Z
%gradients_1/Mean_4_grad/Reshape/shapeConst*
valueB"      *
dtype0
�
gradients_1/Mean_4_grad/ReshapeReshapegradients_1/Neg_8_grad/Neg%gradients_1/Mean_4_grad/Reshape/shape*
T0*
Tshape0
U
gradients_1/Mean_4_grad/ShapeShapeDynamicPartition_2:1*
T0*
out_type0

gradients_1/Mean_4_grad/TileTilegradients_1/Mean_4_grad/Reshapegradients_1/Mean_4_grad/Shape*

Tmultiples0*
T0
W
gradients_1/Mean_4_grad/Shape_1ShapeDynamicPartition_2:1*
T0*
out_type0
H
gradients_1/Mean_4_grad/Shape_2Const*
dtype0*
valueB 
K
gradients_1/Mean_4_grad/ConstConst*
valueB: *
dtype0
�
gradients_1/Mean_4_grad/ProdProdgradients_1/Mean_4_grad/Shape_1gradients_1/Mean_4_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_4_grad/Const_1Const*
valueB: *
dtype0
�
gradients_1/Mean_4_grad/Prod_1Prodgradients_1/Mean_4_grad/Shape_2gradients_1/Mean_4_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
K
!gradients_1/Mean_4_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_4_grad/MaximumMaximumgradients_1/Mean_4_grad/Prod_1!gradients_1/Mean_4_grad/Maximum/y*
T0
t
 gradients_1/Mean_4_grad/floordivFloorDivgradients_1/Mean_4_grad/Prodgradients_1/Mean_4_grad/Maximum*
T0
n
gradients_1/Mean_4_grad/CastCast gradients_1/Mean_4_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_1/Mean_4_grad/truedivRealDivgradients_1/Mean_4_grad/Tilegradients_1/Mean_4_grad/Cast*
T0
S
%gradients_1/Mean_3_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients_1/Mean_3_grad/ReshapeReshape1gradients_1/mul_9_grad/tuple/control_dependency_1%gradients_1/Mean_3_grad/Reshape/shape*
T0*
Tshape0
K
gradients_1/Mean_3_grad/ConstConst*
valueB:*
dtype0

gradients_1/Mean_3_grad/TileTilegradients_1/Mean_3_grad/Reshapegradients_1/Mean_3_grad/Const*

Tmultiples0*
T0
L
gradients_1/Mean_3_grad/Const_1Const*
valueB
 *   @*
dtype0
r
gradients_1/Mean_3_grad/truedivRealDivgradients_1/Mean_3_grad/Tilegradients_1/Mean_3_grad/Const_1*
T0
@
gradients_1/zeros_like	ZerosLikeDynamicPartition_3*
T0
Q
)gradients_1/DynamicPartition_3_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_1/DynamicPartition_3_grad/ConstConst*
valueB: *
dtype0
�
(gradients_1/DynamicPartition_3_grad/ProdProd)gradients_1/DynamicPartition_3_grad/Shape)gradients_1/DynamicPartition_3_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_1/DynamicPartition_3_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_1/DynamicPartition_3_grad/range/deltaConst*
value	B :*
dtype0
�
)gradients_1/DynamicPartition_3_grad/rangeRange/gradients_1/DynamicPartition_3_grad/range/start(gradients_1/DynamicPartition_3_grad/Prod/gradients_1/DynamicPartition_3_grad/range/delta*

Tidx0
�
+gradients_1/DynamicPartition_3_grad/ReshapeReshape)gradients_1/DynamicPartition_3_grad/range)gradients_1/DynamicPartition_3_grad/Shape*
T0*
Tshape0
�
4gradients_1/DynamicPartition_3_grad/DynamicPartitionDynamicPartition+gradients_1/DynamicPartition_3_grad/ReshapeCast*
T0*
num_partitions
�
1gradients_1/DynamicPartition_3_grad/DynamicStitchDynamicStitch4gradients_1/DynamicPartition_3_grad/DynamicPartition6gradients_1/DynamicPartition_3_grad/DynamicPartition:1gradients_1/zeros_likegradients_1/Mean_5_grad/truediv*
T0*
N
T
+gradients_1/DynamicPartition_3_grad/Shape_1ShapeSum_8*
T0*
out_type0
�
-gradients_1/DynamicPartition_3_grad/Reshape_1Reshape1gradients_1/DynamicPartition_3_grad/DynamicStitch+gradients_1/DynamicPartition_3_grad/Shape_1*
T0*
Tshape0
B
gradients_1/zeros_like_1	ZerosLikeDynamicPartition_2*
T0
Q
)gradients_1/DynamicPartition_2_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_1/DynamicPartition_2_grad/ConstConst*
valueB: *
dtype0
�
(gradients_1/DynamicPartition_2_grad/ProdProd)gradients_1/DynamicPartition_2_grad/Shape)gradients_1/DynamicPartition_2_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_1/DynamicPartition_2_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_1/DynamicPartition_2_grad/range/deltaConst*
dtype0*
value	B :
�
)gradients_1/DynamicPartition_2_grad/rangeRange/gradients_1/DynamicPartition_2_grad/range/start(gradients_1/DynamicPartition_2_grad/Prod/gradients_1/DynamicPartition_2_grad/range/delta*

Tidx0
�
+gradients_1/DynamicPartition_2_grad/ReshapeReshape)gradients_1/DynamicPartition_2_grad/range)gradients_1/DynamicPartition_2_grad/Shape*
T0*
Tshape0
�
4gradients_1/DynamicPartition_2_grad/DynamicPartitionDynamicPartition+gradients_1/DynamicPartition_2_grad/ReshapeCast*
num_partitions*
T0
�
1gradients_1/DynamicPartition_2_grad/DynamicStitchDynamicStitch4gradients_1/DynamicPartition_2_grad/DynamicPartition6gradients_1/DynamicPartition_2_grad/DynamicPartition:1gradients_1/zeros_like_1gradients_1/Mean_4_grad/truediv*
T0*
N
V
+gradients_1/DynamicPartition_2_grad/Shape_1ShapeMinimum*
T0*
out_type0
�
-gradients_1/DynamicPartition_2_grad/Reshape_1Reshape1gradients_1/DynamicPartition_2_grad/DynamicStitch+gradients_1/DynamicPartition_2_grad/Shape_1*
T0*
Tshape0
p
%gradients_1/Mean_3/input_grad/unstackUnpackgradients_1/Mean_3_grad/truediv*
T0*	
num*

axis 
^
.gradients_1/Mean_3/input_grad/tuple/group_depsNoOp&^gradients_1/Mean_3/input_grad/unstack
�
6gradients_1/Mean_3/input_grad/tuple/control_dependencyIdentity%gradients_1/Mean_3/input_grad/unstack/^gradients_1/Mean_3/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/Mean_3/input_grad/unstack
�
8gradients_1/Mean_3/input_grad/tuple/control_dependency_1Identity'gradients_1/Mean_3/input_grad/unstack:1/^gradients_1/Mean_3/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/Mean_3/input_grad/unstack
E
gradients_1/Sum_8_grad/ShapeShapestack*
T0*
out_type0
v
gradients_1/Sum_8_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_8_grad/addAddV2Sum_8/reduction_indicesgradients_1/Sum_8_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
�
gradients_1/Sum_8_grad/modFloorModgradients_1/Sum_8_grad/addgradients_1/Sum_8_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
x
gradients_1/Sum_8_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_8_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_8_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_8_grad/rangeRange"gradients_1/Sum_8_grad/range/startgradients_1/Sum_8_grad/Size"gradients_1/Sum_8_grad/range/delta*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*

Tidx0
|
!gradients_1/Sum_8_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_8_grad/FillFillgradients_1/Sum_8_grad/Shape_1!gradients_1/Sum_8_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*

index_type0
�
$gradients_1/Sum_8_grad/DynamicStitchDynamicStitchgradients_1/Sum_8_grad/rangegradients_1/Sum_8_grad/modgradients_1/Sum_8_grad/Shapegradients_1/Sum_8_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
N
{
 gradients_1/Sum_8_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_8_grad/MaximumMaximum$gradients_1/Sum_8_grad/DynamicStitch gradients_1/Sum_8_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
�
gradients_1/Sum_8_grad/floordivFloorDivgradients_1/Sum_8_grad/Shapegradients_1/Sum_8_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
�
gradients_1/Sum_8_grad/ReshapeReshape-gradients_1/DynamicPartition_3_grad/Reshape_1$gradients_1/Sum_8_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_8_grad/TileTilegradients_1/Sum_8_grad/Reshapegradients_1/Sum_8_grad/floordiv*

Tmultiples0*
T0
G
gradients_1/Minimum_grad/ShapeShapemul_7*
T0*
out_type0
I
 gradients_1/Minimum_grad/Shape_1Shapemul_8*
T0*
out_type0
q
 gradients_1/Minimum_grad/Shape_2Shape-gradients_1/DynamicPartition_2_grad/Reshape_1*
T0*
out_type0
Q
$gradients_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
gradients_1/Minimum_grad/zerosFill gradients_1/Minimum_grad/Shape_2$gradients_1/Minimum_grad/zeros/Const*
T0*

index_type0
F
"gradients_1/Minimum_grad/LessEqual	LessEqualmul_7mul_8*
T0
�
.gradients_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Minimum_grad/Shape gradients_1/Minimum_grad/Shape_1*
T0
�
gradients_1/Minimum_grad/SelectSelect"gradients_1/Minimum_grad/LessEqual-gradients_1/DynamicPartition_2_grad/Reshape_1gradients_1/Minimum_grad/zeros*
T0
�
gradients_1/Minimum_grad/SumSumgradients_1/Minimum_grad/Select.gradients_1/Minimum_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
 gradients_1/Minimum_grad/ReshapeReshapegradients_1/Minimum_grad/Sumgradients_1/Minimum_grad/Shape*
T0*
Tshape0
�
!gradients_1/Minimum_grad/Select_1Select"gradients_1/Minimum_grad/LessEqualgradients_1/Minimum_grad/zeros-gradients_1/DynamicPartition_2_grad/Reshape_1*
T0
�
gradients_1/Minimum_grad/Sum_1Sum!gradients_1/Minimum_grad/Select_10gradients_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
"gradients_1/Minimum_grad/Reshape_1Reshapegradients_1/Minimum_grad/Sum_1 gradients_1/Minimum_grad/Shape_1*
T0*
Tshape0
y
)gradients_1/Minimum_grad/tuple/group_depsNoOp!^gradients_1/Minimum_grad/Reshape#^gradients_1/Minimum_grad/Reshape_1
�
1gradients_1/Minimum_grad/tuple/control_dependencyIdentity gradients_1/Minimum_grad/Reshape*^gradients_1/Minimum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Minimum_grad/Reshape
�
3gradients_1/Minimum_grad/tuple/control_dependency_1Identity"gradients_1/Minimum_grad/Reshape_1*^gradients_1/Minimum_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/Minimum_grad/Reshape_1
S
%gradients_1/Mean_1_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients_1/Mean_1_grad/ReshapeReshape6gradients_1/Mean_3/input_grad/tuple/control_dependency%gradients_1/Mean_1_grad/Reshape/shape*
T0*
Tshape0
S
gradients_1/Mean_1_grad/ShapeShapeDynamicPartition:1*
T0*
out_type0

gradients_1/Mean_1_grad/TileTilegradients_1/Mean_1_grad/Reshapegradients_1/Mean_1_grad/Shape*
T0*

Tmultiples0
U
gradients_1/Mean_1_grad/Shape_1ShapeDynamicPartition:1*
T0*
out_type0
H
gradients_1/Mean_1_grad/Shape_2Const*
valueB *
dtype0
K
gradients_1/Mean_1_grad/ConstConst*
valueB: *
dtype0
�
gradients_1/Mean_1_grad/ProdProdgradients_1/Mean_1_grad/Shape_1gradients_1/Mean_1_grad/Const*
T0*

Tidx0*
	keep_dims( 
M
gradients_1/Mean_1_grad/Const_1Const*
valueB: *
dtype0
�
gradients_1/Mean_1_grad/Prod_1Prodgradients_1/Mean_1_grad/Shape_2gradients_1/Mean_1_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
K
!gradients_1/Mean_1_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_1_grad/MaximumMaximumgradients_1/Mean_1_grad/Prod_1!gradients_1/Mean_1_grad/Maximum/y*
T0
t
 gradients_1/Mean_1_grad/floordivFloorDivgradients_1/Mean_1_grad/Prodgradients_1/Mean_1_grad/Maximum*
T0
n
gradients_1/Mean_1_grad/CastCast gradients_1/Mean_1_grad/floordiv*
Truncate( *

DstT0*

SrcT0
o
gradients_1/Mean_1_grad/truedivRealDivgradients_1/Mean_1_grad/Tilegradients_1/Mean_1_grad/Cast*
T0
S
%gradients_1/Mean_2_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients_1/Mean_2_grad/ReshapeReshape8gradients_1/Mean_3/input_grad/tuple/control_dependency_1%gradients_1/Mean_2_grad/Reshape/shape*
T0*
Tshape0
U
gradients_1/Mean_2_grad/ShapeShapeDynamicPartition_1:1*
T0*
out_type0

gradients_1/Mean_2_grad/TileTilegradients_1/Mean_2_grad/Reshapegradients_1/Mean_2_grad/Shape*

Tmultiples0*
T0
W
gradients_1/Mean_2_grad/Shape_1ShapeDynamicPartition_1:1*
T0*
out_type0
H
gradients_1/Mean_2_grad/Shape_2Const*
dtype0*
valueB 
K
gradients_1/Mean_2_grad/ConstConst*
dtype0*
valueB: 
�
gradients_1/Mean_2_grad/ProdProdgradients_1/Mean_2_grad/Shape_1gradients_1/Mean_2_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_2_grad/Const_1Const*
dtype0*
valueB: 
�
gradients_1/Mean_2_grad/Prod_1Prodgradients_1/Mean_2_grad/Shape_2gradients_1/Mean_2_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_2_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_2_grad/MaximumMaximumgradients_1/Mean_2_grad/Prod_1!gradients_1/Mean_2_grad/Maximum/y*
T0
t
 gradients_1/Mean_2_grad/floordivFloorDivgradients_1/Mean_2_grad/Prodgradients_1/Mean_2_grad/Maximum*
T0
n
gradients_1/Mean_2_grad/CastCast gradients_1/Mean_2_grad/floordiv*
Truncate( *

DstT0*

SrcT0
o
gradients_1/Mean_2_grad/truedivRealDivgradients_1/Mean_2_grad/Tilegradients_1/Mean_2_grad/Cast*
T0
e
gradients_1/stack_grad/unstackUnpackgradients_1/Sum_8_grad/Tile*
T0*	
num*

axis
P
'gradients_1/stack_grad/tuple/group_depsNoOp^gradients_1/stack_grad/unstack
�
/gradients_1/stack_grad/tuple/control_dependencyIdentitygradients_1/stack_grad/unstack(^gradients_1/stack_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/stack_grad/unstack
�
1gradients_1/stack_grad/tuple/control_dependency_1Identity gradients_1/stack_grad/unstack:1(^gradients_1/stack_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/stack_grad/unstack
�
1gradients_1/stack_grad/tuple/control_dependency_2Identity gradients_1/stack_grad/unstack:2(^gradients_1/stack_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/stack_grad/unstack
C
gradients_1/mul_7_grad/ShapeShapeExp*
T0*
out_type0
L
gradients_1/mul_7_grad/Shape_1Shape
ExpandDims*
T0*
out_type0
�
,gradients_1/mul_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_7_grad/Shapegradients_1/mul_7_grad/Shape_1*
T0
i
gradients_1/mul_7_grad/MulMul1gradients_1/Minimum_grad/tuple/control_dependency
ExpandDims*
T0
�
gradients_1/mul_7_grad/SumSumgradients_1/mul_7_grad/Mul,gradients_1/mul_7_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients_1/mul_7_grad/ReshapeReshapegradients_1/mul_7_grad/Sumgradients_1/mul_7_grad/Shape*
T0*
Tshape0
d
gradients_1/mul_7_grad/Mul_1MulExp1gradients_1/Minimum_grad/tuple/control_dependency*
T0
�
gradients_1/mul_7_grad/Sum_1Sumgradients_1/mul_7_grad/Mul_1.gradients_1/mul_7_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/mul_7_grad/Reshape_1Reshapegradients_1/mul_7_grad/Sum_1gradients_1/mul_7_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/mul_7_grad/tuple/group_depsNoOp^gradients_1/mul_7_grad/Reshape!^gradients_1/mul_7_grad/Reshape_1
�
/gradients_1/mul_7_grad/tuple/control_dependencyIdentitygradients_1/mul_7_grad/Reshape(^gradients_1/mul_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/mul_7_grad/Reshape
�
1gradients_1/mul_7_grad/tuple/control_dependency_1Identity gradients_1/mul_7_grad/Reshape_1(^gradients_1/mul_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/mul_7_grad/Reshape_1
O
gradients_1/mul_8_grad/ShapeShapeclip_by_value_2*
T0*
out_type0
L
gradients_1/mul_8_grad/Shape_1Shape
ExpandDims*
T0*
out_type0
�
,gradients_1/mul_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_8_grad/Shapegradients_1/mul_8_grad/Shape_1*
T0
k
gradients_1/mul_8_grad/MulMul3gradients_1/Minimum_grad/tuple/control_dependency_1
ExpandDims*
T0
�
gradients_1/mul_8_grad/SumSumgradients_1/mul_8_grad/Mul,gradients_1/mul_8_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients_1/mul_8_grad/ReshapeReshapegradients_1/mul_8_grad/Sumgradients_1/mul_8_grad/Shape*
T0*
Tshape0
r
gradients_1/mul_8_grad/Mul_1Mulclip_by_value_23gradients_1/Minimum_grad/tuple/control_dependency_1*
T0
�
gradients_1/mul_8_grad/Sum_1Sumgradients_1/mul_8_grad/Mul_1.gradients_1/mul_8_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
 gradients_1/mul_8_grad/Reshape_1Reshapegradients_1/mul_8_grad/Sum_1gradients_1/mul_8_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/mul_8_grad/tuple/group_depsNoOp^gradients_1/mul_8_grad/Reshape!^gradients_1/mul_8_grad/Reshape_1
�
/gradients_1/mul_8_grad/tuple/control_dependencyIdentitygradients_1/mul_8_grad/Reshape(^gradients_1/mul_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/mul_8_grad/Reshape
�
1gradients_1/mul_8_grad/tuple/control_dependency_1Identity gradients_1/mul_8_grad/Reshape_1(^gradients_1/mul_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/mul_8_grad/Reshape_1
@
gradients_1/zeros_like_2	ZerosLikeDynamicPartition*
T0
O
'gradients_1/DynamicPartition_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients_1/DynamicPartition_grad/ConstConst*
valueB: *
dtype0
�
&gradients_1/DynamicPartition_grad/ProdProd'gradients_1/DynamicPartition_grad/Shape'gradients_1/DynamicPartition_grad/Const*
T0*

Tidx0*
	keep_dims( 
W
-gradients_1/DynamicPartition_grad/range/startConst*
value	B : *
dtype0
W
-gradients_1/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0
�
'gradients_1/DynamicPartition_grad/rangeRange-gradients_1/DynamicPartition_grad/range/start&gradients_1/DynamicPartition_grad/Prod-gradients_1/DynamicPartition_grad/range/delta*

Tidx0
�
)gradients_1/DynamicPartition_grad/ReshapeReshape'gradients_1/DynamicPartition_grad/range'gradients_1/DynamicPartition_grad/Shape*
T0*
Tshape0
�
2gradients_1/DynamicPartition_grad/DynamicPartitionDynamicPartition)gradients_1/DynamicPartition_grad/ReshapeCast*
num_partitions*
T0
�
/gradients_1/DynamicPartition_grad/DynamicStitchDynamicStitch2gradients_1/DynamicPartition_grad/DynamicPartition4gradients_1/DynamicPartition_grad/DynamicPartition:1gradients_1/zeros_like_2gradients_1/Mean_1_grad/truediv*
T0*
N
T
)gradients_1/DynamicPartition_grad/Shape_1ShapeMaximum*
T0*
out_type0
�
+gradients_1/DynamicPartition_grad/Reshape_1Reshape/gradients_1/DynamicPartition_grad/DynamicStitch)gradients_1/DynamicPartition_grad/Shape_1*
T0*
Tshape0
B
gradients_1/zeros_like_3	ZerosLikeDynamicPartition_1*
T0
Q
)gradients_1/DynamicPartition_1_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_1/DynamicPartition_1_grad/ConstConst*
valueB: *
dtype0
�
(gradients_1/DynamicPartition_1_grad/ProdProd)gradients_1/DynamicPartition_1_grad/Shape)gradients_1/DynamicPartition_1_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_1/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_1/DynamicPartition_1_grad/range/deltaConst*
value	B :*
dtype0
�
)gradients_1/DynamicPartition_1_grad/rangeRange/gradients_1/DynamicPartition_1_grad/range/start(gradients_1/DynamicPartition_1_grad/Prod/gradients_1/DynamicPartition_1_grad/range/delta*

Tidx0
�
+gradients_1/DynamicPartition_1_grad/ReshapeReshape)gradients_1/DynamicPartition_1_grad/range)gradients_1/DynamicPartition_1_grad/Shape*
T0*
Tshape0
�
4gradients_1/DynamicPartition_1_grad/DynamicPartitionDynamicPartition+gradients_1/DynamicPartition_1_grad/ReshapeCast*
T0*
num_partitions
�
1gradients_1/DynamicPartition_1_grad/DynamicStitchDynamicStitch4gradients_1/DynamicPartition_1_grad/DynamicPartition6gradients_1/DynamicPartition_1_grad/DynamicPartition:1gradients_1/zeros_like_3gradients_1/Mean_2_grad/truediv*
N*
T0
X
+gradients_1/DynamicPartition_1_grad/Shape_1Shape	Maximum_1*
T0*
out_type0
�
-gradients_1/DynamicPartition_1_grad/Reshape_1Reshape1gradients_1/DynamicPartition_1_grad/DynamicStitch+gradients_1/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0
�
Bgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ShapeShape!softmax_cross_entropy_with_logits*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeReshape/gradients_1/stack_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/Shape*
T0*
Tshape0
�
Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_1*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeReshape1gradients_1/stack_grad/tuple/control_dependency_1Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/Shape*
T0*
Tshape0
�
Dgradients_1/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_2*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ReshapeReshape1gradients_1/stack_grad/tuple/control_dependency_2Dgradients_1/softmax_cross_entropy_with_logits_2/Reshape_2_grad/Shape*
T0*
Tshape0
a
&gradients_1/clip_by_value_2_grad/ShapeShapeclip_by_value_2/Minimum*
T0*
out_type0
Q
(gradients_1/clip_by_value_2_grad/Shape_1Const*
dtype0*
valueB 
{
(gradients_1/clip_by_value_2_grad/Shape_2Shape/gradients_1/mul_8_grad/tuple/control_dependency*
T0*
out_type0
Y
,gradients_1/clip_by_value_2_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
&gradients_1/clip_by_value_2_grad/zerosFill(gradients_1/clip_by_value_2_grad/Shape_2,gradients_1/clip_by_value_2_grad/zeros/Const*
T0*

index_type0
f
-gradients_1/clip_by_value_2_grad/GreaterEqualGreaterEqualclip_by_value_2/Minimumsub_6*
T0
�
6gradients_1/clip_by_value_2_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients_1/clip_by_value_2_grad/Shape(gradients_1/clip_by_value_2_grad/Shape_1*
T0
�
'gradients_1/clip_by_value_2_grad/SelectSelect-gradients_1/clip_by_value_2_grad/GreaterEqual/gradients_1/mul_8_grad/tuple/control_dependency&gradients_1/clip_by_value_2_grad/zeros*
T0
�
$gradients_1/clip_by_value_2_grad/SumSum'gradients_1/clip_by_value_2_grad/Select6gradients_1/clip_by_value_2_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
(gradients_1/clip_by_value_2_grad/ReshapeReshape$gradients_1/clip_by_value_2_grad/Sum&gradients_1/clip_by_value_2_grad/Shape*
T0*
Tshape0
�
)gradients_1/clip_by_value_2_grad/Select_1Select-gradients_1/clip_by_value_2_grad/GreaterEqual&gradients_1/clip_by_value_2_grad/zeros/gradients_1/mul_8_grad/tuple/control_dependency*
T0
�
&gradients_1/clip_by_value_2_grad/Sum_1Sum)gradients_1/clip_by_value_2_grad/Select_18gradients_1/clip_by_value_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
*gradients_1/clip_by_value_2_grad/Reshape_1Reshape&gradients_1/clip_by_value_2_grad/Sum_1(gradients_1/clip_by_value_2_grad/Shape_1*
T0*
Tshape0
�
1gradients_1/clip_by_value_2_grad/tuple/group_depsNoOp)^gradients_1/clip_by_value_2_grad/Reshape+^gradients_1/clip_by_value_2_grad/Reshape_1
�
9gradients_1/clip_by_value_2_grad/tuple/control_dependencyIdentity(gradients_1/clip_by_value_2_grad/Reshape2^gradients_1/clip_by_value_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/clip_by_value_2_grad/Reshape
�
;gradients_1/clip_by_value_2_grad/tuple/control_dependency_1Identity*gradients_1/clip_by_value_2_grad/Reshape_12^gradients_1/clip_by_value_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/clip_by_value_2_grad/Reshape_1
S
gradients_1/Maximum_grad/ShapeShapeSquaredDifference*
T0*
out_type0
W
 gradients_1/Maximum_grad/Shape_1ShapeSquaredDifference_1*
T0*
out_type0
o
 gradients_1/Maximum_grad/Shape_2Shape+gradients_1/DynamicPartition_grad/Reshape_1*
T0*
out_type0
Q
$gradients_1/Maximum_grad/zeros/ConstConst*
dtype0*
valueB
 *    
�
gradients_1/Maximum_grad/zerosFill gradients_1/Maximum_grad/Shape_2$gradients_1/Maximum_grad/zeros/Const*
T0*

index_type0
f
%gradients_1/Maximum_grad/GreaterEqualGreaterEqualSquaredDifferenceSquaredDifference_1*
T0
�
.gradients_1/Maximum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Maximum_grad/Shape gradients_1/Maximum_grad/Shape_1*
T0
�
gradients_1/Maximum_grad/SelectSelect%gradients_1/Maximum_grad/GreaterEqual+gradients_1/DynamicPartition_grad/Reshape_1gradients_1/Maximum_grad/zeros*
T0
�
gradients_1/Maximum_grad/SumSumgradients_1/Maximum_grad/Select.gradients_1/Maximum_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
 gradients_1/Maximum_grad/ReshapeReshapegradients_1/Maximum_grad/Sumgradients_1/Maximum_grad/Shape*
T0*
Tshape0
�
!gradients_1/Maximum_grad/Select_1Select%gradients_1/Maximum_grad/GreaterEqualgradients_1/Maximum_grad/zeros+gradients_1/DynamicPartition_grad/Reshape_1*
T0
�
gradients_1/Maximum_grad/Sum_1Sum!gradients_1/Maximum_grad/Select_10gradients_1/Maximum_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
"gradients_1/Maximum_grad/Reshape_1Reshapegradients_1/Maximum_grad/Sum_1 gradients_1/Maximum_grad/Shape_1*
T0*
Tshape0
y
)gradients_1/Maximum_grad/tuple/group_depsNoOp!^gradients_1/Maximum_grad/Reshape#^gradients_1/Maximum_grad/Reshape_1
�
1gradients_1/Maximum_grad/tuple/control_dependencyIdentity gradients_1/Maximum_grad/Reshape*^gradients_1/Maximum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Maximum_grad/Reshape
�
3gradients_1/Maximum_grad/tuple/control_dependency_1Identity"gradients_1/Maximum_grad/Reshape_1*^gradients_1/Maximum_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/Maximum_grad/Reshape_1
W
 gradients_1/Maximum_1_grad/ShapeShapeSquaredDifference_2*
T0*
out_type0
Y
"gradients_1/Maximum_1_grad/Shape_1ShapeSquaredDifference_3*
T0*
out_type0
s
"gradients_1/Maximum_1_grad/Shape_2Shape-gradients_1/DynamicPartition_1_grad/Reshape_1*
T0*
out_type0
S
&gradients_1/Maximum_1_grad/zeros/ConstConst*
dtype0*
valueB
 *    
�
 gradients_1/Maximum_1_grad/zerosFill"gradients_1/Maximum_1_grad/Shape_2&gradients_1/Maximum_1_grad/zeros/Const*
T0*

index_type0
j
'gradients_1/Maximum_1_grad/GreaterEqualGreaterEqualSquaredDifference_2SquaredDifference_3*
T0
�
0gradients_1/Maximum_1_grad/BroadcastGradientArgsBroadcastGradientArgs gradients_1/Maximum_1_grad/Shape"gradients_1/Maximum_1_grad/Shape_1*
T0
�
!gradients_1/Maximum_1_grad/SelectSelect'gradients_1/Maximum_1_grad/GreaterEqual-gradients_1/DynamicPartition_1_grad/Reshape_1 gradients_1/Maximum_1_grad/zeros*
T0
�
gradients_1/Maximum_1_grad/SumSum!gradients_1/Maximum_1_grad/Select0gradients_1/Maximum_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
"gradients_1/Maximum_1_grad/ReshapeReshapegradients_1/Maximum_1_grad/Sum gradients_1/Maximum_1_grad/Shape*
T0*
Tshape0
�
#gradients_1/Maximum_1_grad/Select_1Select'gradients_1/Maximum_1_grad/GreaterEqual gradients_1/Maximum_1_grad/zeros-gradients_1/DynamicPartition_1_grad/Reshape_1*
T0
�
 gradients_1/Maximum_1_grad/Sum_1Sum#gradients_1/Maximum_1_grad/Select_12gradients_1/Maximum_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
$gradients_1/Maximum_1_grad/Reshape_1Reshape gradients_1/Maximum_1_grad/Sum_1"gradients_1/Maximum_1_grad/Shape_1*
T0*
Tshape0

+gradients_1/Maximum_1_grad/tuple/group_depsNoOp#^gradients_1/Maximum_1_grad/Reshape%^gradients_1/Maximum_1_grad/Reshape_1
�
3gradients_1/Maximum_1_grad/tuple/control_dependencyIdentity"gradients_1/Maximum_1_grad/Reshape,^gradients_1/Maximum_1_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/Maximum_1_grad/Reshape
�
5gradients_1/Maximum_1_grad/tuple/control_dependency_1Identity$gradients_1/Maximum_1_grad/Reshape_1,^gradients_1/Maximum_1_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/Maximum_1_grad/Reshape_1
S
gradients_1/zeros_like_4	ZerosLike#softmax_cross_entropy_with_logits:1*
T0
t
Agradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
=gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims
ExpandDimsDgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeAgradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dim*
T0*

Tdim0
�
6gradients_1/softmax_cross_entropy_with_logits_grad/mulMul=gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims#softmax_cross_entropy_with_logits:1*
T0

=gradients_1/softmax_cross_entropy_with_logits_grad/LogSoftmax
LogSoftmax)softmax_cross_entropy_with_logits/Reshape*
T0
�
6gradients_1/softmax_cross_entropy_with_logits_grad/NegNeg=gradients_1/softmax_cross_entropy_with_logits_grad/LogSoftmax*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dimConst*
dtype0*
valueB :
���������
�
?gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1
ExpandDimsDgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dim*

Tdim0*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_grad/mul_1Mul?gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_16gradients_1/softmax_cross_entropy_with_logits_grad/Neg*
T0
�
Cgradients_1/softmax_cross_entropy_with_logits_grad/tuple/group_depsNoOp7^gradients_1/softmax_cross_entropy_with_logits_grad/mul9^gradients_1/softmax_cross_entropy_with_logits_grad/mul_1
�
Kgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyIdentity6gradients_1/softmax_cross_entropy_with_logits_grad/mulD^gradients_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/softmax_cross_entropy_with_logits_grad/mul
�
Mgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Identity8gradients_1/softmax_cross_entropy_with_logits_grad/mul_1D^gradients_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_grad/mul_1
U
gradients_1/zeros_like_5	ZerosLike%softmax_cross_entropy_with_logits_1:1*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
?gradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dim*

Tdim0*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_1_grad/mulMul?gradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims%softmax_cross_entropy_with_logits_1:1*
T0
�
?gradients_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_1/Reshape*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_1_grad/NegNeg?gradients_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax*
T0
x
Egradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
Agradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeEgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dim*
T0*

Tdim0
�
:gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1MulAgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_18gradients_1/softmax_cross_entropy_with_logits_1_grad/Neg*
T0
�
Egradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_depsNoOp9^gradients_1/softmax_cross_entropy_with_logits_1_grad/mul;^gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1
�
Mgradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyIdentity8gradients_1/softmax_cross_entropy_with_logits_1_grad/mulF^gradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_1_grad/mul
�
Ogradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1Identity:gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1F^gradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1
U
gradients_1/zeros_like_6	ZerosLike%softmax_cross_entropy_with_logits_2:1*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
?gradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims/dim*

Tdim0*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_2_grad/mulMul?gradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims%softmax_cross_entropy_with_logits_2:1*
T0
�
?gradients_1/softmax_cross_entropy_with_logits_2_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_2/Reshape*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_2_grad/NegNeg?gradients_1/softmax_cross_entropy_with_logits_2_grad/LogSoftmax*
T0
x
Egradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
Agradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims_1
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_2/Reshape_2_grad/ReshapeEgradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims_1/dim*
T0*

Tdim0
�
:gradients_1/softmax_cross_entropy_with_logits_2_grad/mul_1MulAgradients_1/softmax_cross_entropy_with_logits_2_grad/ExpandDims_18gradients_1/softmax_cross_entropy_with_logits_2_grad/Neg*
T0
�
Egradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/group_depsNoOp9^gradients_1/softmax_cross_entropy_with_logits_2_grad/mul;^gradients_1/softmax_cross_entropy_with_logits_2_grad/mul_1
�
Mgradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependencyIdentity8gradients_1/softmax_cross_entropy_with_logits_2_grad/mulF^gradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_2_grad/mul
�
Ogradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependency_1Identity:gradients_1/softmax_cross_entropy_with_logits_2_grad/mul_1F^gradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/softmax_cross_entropy_with_logits_2_grad/mul_1
U
.gradients_1/clip_by_value_2/Minimum_grad/ShapeShapeExp*
T0*
out_type0
Y
0gradients_1/clip_by_value_2/Minimum_grad/Shape_1Const*
valueB *
dtype0
�
0gradients_1/clip_by_value_2/Minimum_grad/Shape_2Shape9gradients_1/clip_by_value_2_grad/tuple/control_dependency*
T0*
out_type0
a
4gradients_1/clip_by_value_2/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
.gradients_1/clip_by_value_2/Minimum_grad/zerosFill0gradients_1/clip_by_value_2/Minimum_grad/Shape_24gradients_1/clip_by_value_2/Minimum_grad/zeros/Const*
T0*

index_type0
U
2gradients_1/clip_by_value_2/Minimum_grad/LessEqual	LessEqualExpadd_25*
T0
�
>gradients_1/clip_by_value_2/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients_1/clip_by_value_2/Minimum_grad/Shape0gradients_1/clip_by_value_2/Minimum_grad/Shape_1*
T0
�
/gradients_1/clip_by_value_2/Minimum_grad/SelectSelect2gradients_1/clip_by_value_2/Minimum_grad/LessEqual9gradients_1/clip_by_value_2_grad/tuple/control_dependency.gradients_1/clip_by_value_2/Minimum_grad/zeros*
T0
�
,gradients_1/clip_by_value_2/Minimum_grad/SumSum/gradients_1/clip_by_value_2/Minimum_grad/Select>gradients_1/clip_by_value_2/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
0gradients_1/clip_by_value_2/Minimum_grad/ReshapeReshape,gradients_1/clip_by_value_2/Minimum_grad/Sum.gradients_1/clip_by_value_2/Minimum_grad/Shape*
T0*
Tshape0
�
1gradients_1/clip_by_value_2/Minimum_grad/Select_1Select2gradients_1/clip_by_value_2/Minimum_grad/LessEqual.gradients_1/clip_by_value_2/Minimum_grad/zeros9gradients_1/clip_by_value_2_grad/tuple/control_dependency*
T0
�
.gradients_1/clip_by_value_2/Minimum_grad/Sum_1Sum1gradients_1/clip_by_value_2/Minimum_grad/Select_1@gradients_1/clip_by_value_2/Minimum_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
2gradients_1/clip_by_value_2/Minimum_grad/Reshape_1Reshape.gradients_1/clip_by_value_2/Minimum_grad/Sum_10gradients_1/clip_by_value_2/Minimum_grad/Shape_1*
T0*
Tshape0
�
9gradients_1/clip_by_value_2/Minimum_grad/tuple/group_depsNoOp1^gradients_1/clip_by_value_2/Minimum_grad/Reshape3^gradients_1/clip_by_value_2/Minimum_grad/Reshape_1
�
Agradients_1/clip_by_value_2/Minimum_grad/tuple/control_dependencyIdentity0gradients_1/clip_by_value_2/Minimum_grad/Reshape:^gradients_1/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/clip_by_value_2/Minimum_grad/Reshape
�
Cgradients_1/clip_by_value_2/Minimum_grad/tuple/control_dependency_1Identity2gradients_1/clip_by_value_2/Minimum_grad/Reshape_1:^gradients_1/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/clip_by_value_2/Minimum_grad/Reshape_1
�
)gradients_1/SquaredDifference_grad/scalarConst2^gradients_1/Maximum_grad/tuple/control_dependency*
valueB
 *   @*
dtype0
�
&gradients_1/SquaredDifference_grad/MulMul)gradients_1/SquaredDifference_grad/scalar1gradients_1/Maximum_grad/tuple/control_dependency*
T0
�
&gradients_1/SquaredDifference_grad/subSubextrinsic_returnsSum_122^gradients_1/Maximum_grad/tuple/control_dependency*
T0
�
(gradients_1/SquaredDifference_grad/mul_1Mul&gradients_1/SquaredDifference_grad/Mul&gradients_1/SquaredDifference_grad/sub*
T0
]
(gradients_1/SquaredDifference_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
T
*gradients_1/SquaredDifference_grad/Shape_1ShapeSum_12*
T0*
out_type0
�
8gradients_1/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients_1/SquaredDifference_grad/Shape*gradients_1/SquaredDifference_grad/Shape_1*
T0
�
&gradients_1/SquaredDifference_grad/SumSum(gradients_1/SquaredDifference_grad/mul_18gradients_1/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
*gradients_1/SquaredDifference_grad/ReshapeReshape&gradients_1/SquaredDifference_grad/Sum(gradients_1/SquaredDifference_grad/Shape*
T0*
Tshape0
�
(gradients_1/SquaredDifference_grad/Sum_1Sum(gradients_1/SquaredDifference_grad/mul_1:gradients_1/SquaredDifference_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
,gradients_1/SquaredDifference_grad/Reshape_1Reshape(gradients_1/SquaredDifference_grad/Sum_1*gradients_1/SquaredDifference_grad/Shape_1*
T0*
Tshape0
d
&gradients_1/SquaredDifference_grad/NegNeg,gradients_1/SquaredDifference_grad/Reshape_1*
T0
�
3gradients_1/SquaredDifference_grad/tuple/group_depsNoOp'^gradients_1/SquaredDifference_grad/Neg+^gradients_1/SquaredDifference_grad/Reshape
�
;gradients_1/SquaredDifference_grad/tuple/control_dependencyIdentity*gradients_1/SquaredDifference_grad/Reshape4^gradients_1/SquaredDifference_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/SquaredDifference_grad/Reshape
�
=gradients_1/SquaredDifference_grad/tuple/control_dependency_1Identity&gradients_1/SquaredDifference_grad/Neg4^gradients_1/SquaredDifference_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/SquaredDifference_grad/Neg
�
+gradients_1/SquaredDifference_1_grad/scalarConst4^gradients_1/Maximum_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0
�
(gradients_1/SquaredDifference_1_grad/MulMul+gradients_1/SquaredDifference_1_grad/scalar3gradients_1/Maximum_grad/tuple/control_dependency_1*
T0
�
(gradients_1/SquaredDifference_1_grad/subSubextrinsic_returnsadd_234^gradients_1/Maximum_grad/tuple/control_dependency_1*
T0
�
*gradients_1/SquaredDifference_1_grad/mul_1Mul(gradients_1/SquaredDifference_1_grad/Mul(gradients_1/SquaredDifference_1_grad/sub*
T0
_
*gradients_1/SquaredDifference_1_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
V
,gradients_1/SquaredDifference_1_grad/Shape_1Shapeadd_23*
T0*
out_type0
�
:gradients_1/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_1/SquaredDifference_1_grad/Shape,gradients_1/SquaredDifference_1_grad/Shape_1*
T0
�
(gradients_1/SquaredDifference_1_grad/SumSum*gradients_1/SquaredDifference_1_grad/mul_1:gradients_1/SquaredDifference_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
,gradients_1/SquaredDifference_1_grad/ReshapeReshape(gradients_1/SquaredDifference_1_grad/Sum*gradients_1/SquaredDifference_1_grad/Shape*
T0*
Tshape0
�
*gradients_1/SquaredDifference_1_grad/Sum_1Sum*gradients_1/SquaredDifference_1_grad/mul_1<gradients_1/SquaredDifference_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
.gradients_1/SquaredDifference_1_grad/Reshape_1Reshape*gradients_1/SquaredDifference_1_grad/Sum_1,gradients_1/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0
h
(gradients_1/SquaredDifference_1_grad/NegNeg.gradients_1/SquaredDifference_1_grad/Reshape_1*
T0
�
5gradients_1/SquaredDifference_1_grad/tuple/group_depsNoOp)^gradients_1/SquaredDifference_1_grad/Neg-^gradients_1/SquaredDifference_1_grad/Reshape
�
=gradients_1/SquaredDifference_1_grad/tuple/control_dependencyIdentity,gradients_1/SquaredDifference_1_grad/Reshape6^gradients_1/SquaredDifference_1_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/SquaredDifference_1_grad/Reshape
�
?gradients_1/SquaredDifference_1_grad/tuple/control_dependency_1Identity(gradients_1/SquaredDifference_1_grad/Neg6^gradients_1/SquaredDifference_1_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/SquaredDifference_1_grad/Neg
�
+gradients_1/SquaredDifference_2_grad/scalarConst4^gradients_1/Maximum_1_grad/tuple/control_dependency*
dtype0*
valueB
 *   @
�
(gradients_1/SquaredDifference_2_grad/MulMul+gradients_1/SquaredDifference_2_grad/scalar3gradients_1/Maximum_1_grad/tuple/control_dependency*
T0
�
(gradients_1/SquaredDifference_2_grad/subSubcuriosity_returnsSum_144^gradients_1/Maximum_1_grad/tuple/control_dependency*
T0
�
*gradients_1/SquaredDifference_2_grad/mul_1Mul(gradients_1/SquaredDifference_2_grad/Mul(gradients_1/SquaredDifference_2_grad/sub*
T0
_
*gradients_1/SquaredDifference_2_grad/ShapeShapecuriosity_returns*
T0*
out_type0
V
,gradients_1/SquaredDifference_2_grad/Shape_1ShapeSum_14*
T0*
out_type0
�
:gradients_1/SquaredDifference_2_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_1/SquaredDifference_2_grad/Shape,gradients_1/SquaredDifference_2_grad/Shape_1*
T0
�
(gradients_1/SquaredDifference_2_grad/SumSum*gradients_1/SquaredDifference_2_grad/mul_1:gradients_1/SquaredDifference_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_1/SquaredDifference_2_grad/ReshapeReshape(gradients_1/SquaredDifference_2_grad/Sum*gradients_1/SquaredDifference_2_grad/Shape*
T0*
Tshape0
�
*gradients_1/SquaredDifference_2_grad/Sum_1Sum*gradients_1/SquaredDifference_2_grad/mul_1<gradients_1/SquaredDifference_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_1/SquaredDifference_2_grad/Reshape_1Reshape*gradients_1/SquaredDifference_2_grad/Sum_1,gradients_1/SquaredDifference_2_grad/Shape_1*
T0*
Tshape0
h
(gradients_1/SquaredDifference_2_grad/NegNeg.gradients_1/SquaredDifference_2_grad/Reshape_1*
T0
�
5gradients_1/SquaredDifference_2_grad/tuple/group_depsNoOp)^gradients_1/SquaredDifference_2_grad/Neg-^gradients_1/SquaredDifference_2_grad/Reshape
�
=gradients_1/SquaredDifference_2_grad/tuple/control_dependencyIdentity,gradients_1/SquaredDifference_2_grad/Reshape6^gradients_1/SquaredDifference_2_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/SquaredDifference_2_grad/Reshape
�
?gradients_1/SquaredDifference_2_grad/tuple/control_dependency_1Identity(gradients_1/SquaredDifference_2_grad/Neg6^gradients_1/SquaredDifference_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/SquaredDifference_2_grad/Neg
�
+gradients_1/SquaredDifference_3_grad/scalarConst6^gradients_1/Maximum_1_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0
�
(gradients_1/SquaredDifference_3_grad/MulMul+gradients_1/SquaredDifference_3_grad/scalar5gradients_1/Maximum_1_grad/tuple/control_dependency_1*
T0
�
(gradients_1/SquaredDifference_3_grad/subSubcuriosity_returnsadd_246^gradients_1/Maximum_1_grad/tuple/control_dependency_1*
T0
�
*gradients_1/SquaredDifference_3_grad/mul_1Mul(gradients_1/SquaredDifference_3_grad/Mul(gradients_1/SquaredDifference_3_grad/sub*
T0
_
*gradients_1/SquaredDifference_3_grad/ShapeShapecuriosity_returns*
T0*
out_type0
V
,gradients_1/SquaredDifference_3_grad/Shape_1Shapeadd_24*
T0*
out_type0
�
:gradients_1/SquaredDifference_3_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_1/SquaredDifference_3_grad/Shape,gradients_1/SquaredDifference_3_grad/Shape_1*
T0
�
(gradients_1/SquaredDifference_3_grad/SumSum*gradients_1/SquaredDifference_3_grad/mul_1:gradients_1/SquaredDifference_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_1/SquaredDifference_3_grad/ReshapeReshape(gradients_1/SquaredDifference_3_grad/Sum*gradients_1/SquaredDifference_3_grad/Shape*
T0*
Tshape0
�
*gradients_1/SquaredDifference_3_grad/Sum_1Sum*gradients_1/SquaredDifference_3_grad/mul_1<gradients_1/SquaredDifference_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_1/SquaredDifference_3_grad/Reshape_1Reshape*gradients_1/SquaredDifference_3_grad/Sum_1,gradients_1/SquaredDifference_3_grad/Shape_1*
T0*
Tshape0
h
(gradients_1/SquaredDifference_3_grad/NegNeg.gradients_1/SquaredDifference_3_grad/Reshape_1*
T0
�
5gradients_1/SquaredDifference_3_grad/tuple/group_depsNoOp)^gradients_1/SquaredDifference_3_grad/Neg-^gradients_1/SquaredDifference_3_grad/Reshape
�
=gradients_1/SquaredDifference_3_grad/tuple/control_dependencyIdentity,gradients_1/SquaredDifference_3_grad/Reshape6^gradients_1/SquaredDifference_3_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/SquaredDifference_3_grad/Reshape
�
?gradients_1/SquaredDifference_3_grad/tuple/control_dependency_1Identity(gradients_1/SquaredDifference_3_grad/Neg6^gradients_1/SquaredDifference_3_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/SquaredDifference_3_grad/Neg
t
@gradients_1/softmax_cross_entropy_with_logits/Reshape_grad/ShapeShapestrided_slice_21*
T0*
out_type0
�
Bgradients_1/softmax_cross_entropy_with_logits/Reshape_grad/ReshapeReshapeKgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency@gradients_1/softmax_cross_entropy_with_logits/Reshape_grad/Shape*
T0*
Tshape0
o
Bgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ShapeShape	Softmax_6*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Bgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Shape*
T0*
Tshape0
v
Bgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ShapeShapestrided_slice_23*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Shape*
T0*
Tshape0
q
Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_1_grad/ShapeShape	Softmax_7*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_1/Reshape_1_grad/ReshapeReshapeOgradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_1_grad/Shape*
T0*
Tshape0
v
Bgradients_1/softmax_cross_entropy_with_logits_2/Reshape_grad/ShapeShapestrided_slice_25*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits_2/Reshape_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits_2/Reshape_grad/Shape*
T0*
Tshape0
q
Dgradients_1/softmax_cross_entropy_with_logits_2/Reshape_1_grad/ShapeShape	Softmax_8*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_2/Reshape_1_grad/ReshapeReshapeOgradients_1/softmax_cross_entropy_with_logits_2_grad/tuple/control_dependency_1Dgradients_1/softmax_cross_entropy_with_logits_2/Reshape_1_grad/Shape*
T0*
Tshape0
�
gradients_1/AddNAddN/gradients_1/mul_7_grad/tuple/control_dependencyAgradients_1/clip_by_value_2/Minimum_grad/tuple/control_dependency*
T0*1
_class'
%#loc:@gradients_1/mul_7_grad/Reshape*
N
?
gradients_1/Exp_grad/mulMulgradients_1/AddNExp*
T0
X
gradients_1/Sum_12_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
x
gradients_1/Sum_12_grad/SizeConst*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_12_grad/addAddV2Sum_12/reduction_indicesgradients_1/Sum_12_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape
�
gradients_1/Sum_12_grad/modFloorModgradients_1/Sum_12_grad/addgradients_1/Sum_12_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape
z
gradients_1/Sum_12_grad/Shape_1Const*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
valueB *
dtype0

#gradients_1/Sum_12_grad/range/startConst*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
value	B : *
dtype0

#gradients_1/Sum_12_grad/range/deltaConst*
dtype0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
value	B :
�
gradients_1/Sum_12_grad/rangeRange#gradients_1/Sum_12_grad/range/startgradients_1/Sum_12_grad/Size#gradients_1/Sum_12_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape
~
"gradients_1/Sum_12_grad/Fill/valueConst*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_12_grad/FillFillgradients_1/Sum_12_grad/Shape_1"gradients_1/Sum_12_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*

index_type0
�
%gradients_1/Sum_12_grad/DynamicStitchDynamicStitchgradients_1/Sum_12_grad/rangegradients_1/Sum_12_grad/modgradients_1/Sum_12_grad/Shapegradients_1/Sum_12_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
N
}
!gradients_1/Sum_12_grad/Maximum/yConst*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_12_grad/MaximumMaximum%gradients_1/Sum_12_grad/DynamicStitch!gradients_1/Sum_12_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape
�
 gradients_1/Sum_12_grad/floordivFloorDivgradients_1/Sum_12_grad/Shapegradients_1/Sum_12_grad/Maximum*
T0*0
_class&
$"loc:@gradients_1/Sum_12_grad/Shape
�
gradients_1/Sum_12_grad/ReshapeReshape=gradients_1/SquaredDifference_grad/tuple/control_dependency_1%gradients_1/Sum_12_grad/DynamicStitch*
T0*
Tshape0
�
gradients_1/Sum_12_grad/TileTilegradients_1/Sum_12_grad/Reshape gradients_1/Sum_12_grad/floordiv*
T0*

Tmultiples0
Y
gradients_1/add_23_grad/ShapeShapeextrinsic_value_estimate*
T0*
out_type0
P
gradients_1/add_23_grad/Shape_1Shapeclip_by_value*
T0*
out_type0
�
-gradients_1/add_23_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_23_grad/Shapegradients_1/add_23_grad/Shape_1*
T0
�
gradients_1/add_23_grad/SumSum?gradients_1/SquaredDifference_1_grad/tuple/control_dependency_1-gradients_1/add_23_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_1/add_23_grad/ReshapeReshapegradients_1/add_23_grad/Sumgradients_1/add_23_grad/Shape*
T0*
Tshape0
�
gradients_1/add_23_grad/Sum_1Sum?gradients_1/SquaredDifference_1_grad/tuple/control_dependency_1/gradients_1/add_23_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
!gradients_1/add_23_grad/Reshape_1Reshapegradients_1/add_23_grad/Sum_1gradients_1/add_23_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_23_grad/tuple/group_depsNoOp ^gradients_1/add_23_grad/Reshape"^gradients_1/add_23_grad/Reshape_1
�
0gradients_1/add_23_grad/tuple/control_dependencyIdentitygradients_1/add_23_grad/Reshape)^gradients_1/add_23_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_23_grad/Reshape
�
2gradients_1/add_23_grad/tuple/control_dependency_1Identity!gradients_1/add_23_grad/Reshape_1)^gradients_1/add_23_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_23_grad/Reshape_1
X
gradients_1/Sum_14_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
x
gradients_1/Sum_14_grad/SizeConst*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_14_grad/addAddV2Sum_14/reduction_indicesgradients_1/Sum_14_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape
�
gradients_1/Sum_14_grad/modFloorModgradients_1/Sum_14_grad/addgradients_1/Sum_14_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape
z
gradients_1/Sum_14_grad/Shape_1Const*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
valueB *
dtype0

#gradients_1/Sum_14_grad/range/startConst*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
value	B : *
dtype0

#gradients_1/Sum_14_grad/range/deltaConst*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_14_grad/rangeRange#gradients_1/Sum_14_grad/range/startgradients_1/Sum_14_grad/Size#gradients_1/Sum_14_grad/range/delta*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*

Tidx0
~
"gradients_1/Sum_14_grad/Fill/valueConst*
dtype0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
value	B :
�
gradients_1/Sum_14_grad/FillFillgradients_1/Sum_14_grad/Shape_1"gradients_1/Sum_14_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*

index_type0
�
%gradients_1/Sum_14_grad/DynamicStitchDynamicStitchgradients_1/Sum_14_grad/rangegradients_1/Sum_14_grad/modgradients_1/Sum_14_grad/Shapegradients_1/Sum_14_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
N
}
!gradients_1/Sum_14_grad/Maximum/yConst*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_14_grad/MaximumMaximum%gradients_1/Sum_14_grad/DynamicStitch!gradients_1/Sum_14_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape
�
 gradients_1/Sum_14_grad/floordivFloorDivgradients_1/Sum_14_grad/Shapegradients_1/Sum_14_grad/Maximum*
T0*0
_class&
$"loc:@gradients_1/Sum_14_grad/Shape
�
gradients_1/Sum_14_grad/ReshapeReshape?gradients_1/SquaredDifference_2_grad/tuple/control_dependency_1%gradients_1/Sum_14_grad/DynamicStitch*
T0*
Tshape0
�
gradients_1/Sum_14_grad/TileTilegradients_1/Sum_14_grad/Reshape gradients_1/Sum_14_grad/floordiv*

Tmultiples0*
T0
Y
gradients_1/add_24_grad/ShapeShapecuriosity_value_estimate*
T0*
out_type0
R
gradients_1/add_24_grad/Shape_1Shapeclip_by_value_1*
T0*
out_type0
�
-gradients_1/add_24_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_24_grad/Shapegradients_1/add_24_grad/Shape_1*
T0
�
gradients_1/add_24_grad/SumSum?gradients_1/SquaredDifference_3_grad/tuple/control_dependency_1-gradients_1/add_24_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
}
gradients_1/add_24_grad/ReshapeReshapegradients_1/add_24_grad/Sumgradients_1/add_24_grad/Shape*
T0*
Tshape0
�
gradients_1/add_24_grad/Sum_1Sum?gradients_1/SquaredDifference_3_grad/tuple/control_dependency_1/gradients_1/add_24_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
!gradients_1/add_24_grad/Reshape_1Reshapegradients_1/add_24_grad/Sum_1gradients_1/add_24_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_24_grad/tuple/group_depsNoOp ^gradients_1/add_24_grad/Reshape"^gradients_1/add_24_grad/Reshape_1
�
0gradients_1/add_24_grad/tuple/control_dependencyIdentitygradients_1/add_24_grad/Reshape)^gradients_1/add_24_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_24_grad/Reshape
�
2gradients_1/add_24_grad/tuple/control_dependency_1Identity!gradients_1/add_24_grad/Reshape_1)^gradients_1/add_24_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_24_grad/Reshape_1
W
'gradients_1/strided_slice_21_grad/ShapeShapeaction_probs*
T0*
out_type0
�
2gradients_1/strided_slice_21_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_21_grad/Shapestrided_slice_21/stackstrided_slice_21/stack_1strided_slice_21/stack_2Bgradients_1/softmax_cross_entropy_with_logits/Reshape_grad/Reshape*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask

gradients_1/Softmax_6_grad/mulMulDgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshape	Softmax_6*
T0
c
0gradients_1/Softmax_6_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients_1/Softmax_6_grad/SumSumgradients_1/Softmax_6_grad/mul0gradients_1/Softmax_6_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
gradients_1/Softmax_6_grad/subSubDgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshapegradients_1/Softmax_6_grad/Sum*
T0
[
 gradients_1/Softmax_6_grad/mul_1Mulgradients_1/Softmax_6_grad/sub	Softmax_6*
T0
W
'gradients_1/strided_slice_23_grad/ShapeShapeaction_probs*
T0*
out_type0
�
2gradients_1/strided_slice_23_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_23_grad/Shapestrided_slice_23/stackstrided_slice_23/stack_1strided_slice_23/stack_2Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
�
gradients_1/Softmax_7_grad/mulMulFgradients_1/softmax_cross_entropy_with_logits_1/Reshape_1_grad/Reshape	Softmax_7*
T0
c
0gradients_1/Softmax_7_grad/Sum/reduction_indicesConst*
dtype0*
valueB :
���������
�
gradients_1/Softmax_7_grad/SumSumgradients_1/Softmax_7_grad/mul0gradients_1/Softmax_7_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
�
gradients_1/Softmax_7_grad/subSubFgradients_1/softmax_cross_entropy_with_logits_1/Reshape_1_grad/Reshapegradients_1/Softmax_7_grad/Sum*
T0
[
 gradients_1/Softmax_7_grad/mul_1Mulgradients_1/Softmax_7_grad/sub	Softmax_7*
T0
W
'gradients_1/strided_slice_25_grad/ShapeShapeaction_probs*
T0*
out_type0
�
2gradients_1/strided_slice_25_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_25_grad/Shapestrided_slice_25/stackstrided_slice_25/stack_1strided_slice_25/stack_2Dgradients_1/softmax_cross_entropy_with_logits_2/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
�
gradients_1/Softmax_8_grad/mulMulFgradients_1/softmax_cross_entropy_with_logits_2/Reshape_1_grad/Reshape	Softmax_8*
T0
c
0gradients_1/Softmax_8_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients_1/Softmax_8_grad/SumSumgradients_1/Softmax_8_grad/mul0gradients_1/Softmax_8_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
gradients_1/Softmax_8_grad/subSubFgradients_1/softmax_cross_entropy_with_logits_2/Reshape_1_grad/Reshapegradients_1/Softmax_8_grad/Sum*
T0
[
 gradients_1/Softmax_8_grad/mul_1Mulgradients_1/Softmax_8_grad/sub	Softmax_8*
T0
E
gradients_1/sub_5_grad/ShapeShapeSum_9*
T0*
out_type0
H
gradients_1/sub_5_grad/Shape_1ShapeSum_10*
T0*
out_type0
�
,gradients_1/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_5_grad/Shapegradients_1/sub_5_grad/Shape_1*
T0
�
gradients_1/sub_5_grad/SumSumgradients_1/Exp_grad/mul,gradients_1/sub_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/sub_5_grad/ReshapeReshapegradients_1/sub_5_grad/Sumgradients_1/sub_5_grad/Shape*
T0*
Tshape0
D
gradients_1/sub_5_grad/NegNeggradients_1/Exp_grad/mul*
T0
�
gradients_1/sub_5_grad/Sum_1Sumgradients_1/sub_5_grad/Neg.gradients_1/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/sub_5_grad/Reshape_1Reshapegradients_1/sub_5_grad/Sum_1gradients_1/sub_5_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_5_grad/tuple/group_depsNoOp^gradients_1/sub_5_grad/Reshape!^gradients_1/sub_5_grad/Reshape_1
�
/gradients_1/sub_5_grad/tuple/control_dependencyIdentitygradients_1/sub_5_grad/Reshape(^gradients_1/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_5_grad/Reshape
�
1gradients_1/sub_5_grad/tuple/control_dependency_1Identity gradients_1/sub_5_grad/Reshape_1(^gradients_1/sub_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_5_grad/Reshape_1
]
$gradients_1/clip_by_value_grad/ShapeShapeclip_by_value/Minimum*
T0*
out_type0
O
&gradients_1/clip_by_value_grad/Shape_1Const*
dtype0*
valueB 
|
&gradients_1/clip_by_value_grad/Shape_2Shape2gradients_1/add_23_grad/tuple/control_dependency_1*
T0*
out_type0
W
*gradients_1/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
$gradients_1/clip_by_value_grad/zerosFill&gradients_1/clip_by_value_grad/Shape_2*gradients_1/clip_by_value_grad/zeros/Const*
T0*

index_type0
b
+gradients_1/clip_by_value_grad/GreaterEqualGreaterEqualclip_by_value/MinimumNeg_6*
T0
�
4gradients_1/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients_1/clip_by_value_grad/Shape&gradients_1/clip_by_value_grad/Shape_1*
T0
�
%gradients_1/clip_by_value_grad/SelectSelect+gradients_1/clip_by_value_grad/GreaterEqual2gradients_1/add_23_grad/tuple/control_dependency_1$gradients_1/clip_by_value_grad/zeros*
T0
�
"gradients_1/clip_by_value_grad/SumSum%gradients_1/clip_by_value_grad/Select4gradients_1/clip_by_value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
&gradients_1/clip_by_value_grad/ReshapeReshape"gradients_1/clip_by_value_grad/Sum$gradients_1/clip_by_value_grad/Shape*
T0*
Tshape0
�
'gradients_1/clip_by_value_grad/Select_1Select+gradients_1/clip_by_value_grad/GreaterEqual$gradients_1/clip_by_value_grad/zeros2gradients_1/add_23_grad/tuple/control_dependency_1*
T0
�
$gradients_1/clip_by_value_grad/Sum_1Sum'gradients_1/clip_by_value_grad/Select_16gradients_1/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
(gradients_1/clip_by_value_grad/Reshape_1Reshape$gradients_1/clip_by_value_grad/Sum_1&gradients_1/clip_by_value_grad/Shape_1*
T0*
Tshape0
�
/gradients_1/clip_by_value_grad/tuple/group_depsNoOp'^gradients_1/clip_by_value_grad/Reshape)^gradients_1/clip_by_value_grad/Reshape_1
�
7gradients_1/clip_by_value_grad/tuple/control_dependencyIdentity&gradients_1/clip_by_value_grad/Reshape0^gradients_1/clip_by_value_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/clip_by_value_grad/Reshape
�
9gradients_1/clip_by_value_grad/tuple/control_dependency_1Identity(gradients_1/clip_by_value_grad/Reshape_10^gradients_1/clip_by_value_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/clip_by_value_grad/Reshape_1
a
&gradients_1/clip_by_value_1_grad/ShapeShapeclip_by_value_1/Minimum*
T0*
out_type0
Q
(gradients_1/clip_by_value_1_grad/Shape_1Const*
valueB *
dtype0
~
(gradients_1/clip_by_value_1_grad/Shape_2Shape2gradients_1/add_24_grad/tuple/control_dependency_1*
T0*
out_type0
Y
,gradients_1/clip_by_value_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
&gradients_1/clip_by_value_1_grad/zerosFill(gradients_1/clip_by_value_1_grad/Shape_2,gradients_1/clip_by_value_1_grad/zeros/Const*
T0*

index_type0
f
-gradients_1/clip_by_value_1_grad/GreaterEqualGreaterEqualclip_by_value_1/MinimumNeg_7*
T0
�
6gradients_1/clip_by_value_1_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients_1/clip_by_value_1_grad/Shape(gradients_1/clip_by_value_1_grad/Shape_1*
T0
�
'gradients_1/clip_by_value_1_grad/SelectSelect-gradients_1/clip_by_value_1_grad/GreaterEqual2gradients_1/add_24_grad/tuple/control_dependency_1&gradients_1/clip_by_value_1_grad/zeros*
T0
�
$gradients_1/clip_by_value_1_grad/SumSum'gradients_1/clip_by_value_1_grad/Select6gradients_1/clip_by_value_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
(gradients_1/clip_by_value_1_grad/ReshapeReshape$gradients_1/clip_by_value_1_grad/Sum&gradients_1/clip_by_value_1_grad/Shape*
T0*
Tshape0
�
)gradients_1/clip_by_value_1_grad/Select_1Select-gradients_1/clip_by_value_1_grad/GreaterEqual&gradients_1/clip_by_value_1_grad/zeros2gradients_1/add_24_grad/tuple/control_dependency_1*
T0
�
&gradients_1/clip_by_value_1_grad/Sum_1Sum)gradients_1/clip_by_value_1_grad/Select_18gradients_1/clip_by_value_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
*gradients_1/clip_by_value_1_grad/Reshape_1Reshape&gradients_1/clip_by_value_1_grad/Sum_1(gradients_1/clip_by_value_1_grad/Shape_1*
T0*
Tshape0
�
1gradients_1/clip_by_value_1_grad/tuple/group_depsNoOp)^gradients_1/clip_by_value_1_grad/Reshape+^gradients_1/clip_by_value_1_grad/Reshape_1
�
9gradients_1/clip_by_value_1_grad/tuple/control_dependencyIdentity(gradients_1/clip_by_value_1_grad/Reshape2^gradients_1/clip_by_value_1_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/clip_by_value_1_grad/Reshape
�
;gradients_1/clip_by_value_1_grad/tuple/control_dependency_1Identity*gradients_1/clip_by_value_1_grad/Reshape_12^gradients_1/clip_by_value_1_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/clip_by_value_1_grad/Reshape_1
W
'gradients_1/strided_slice_20_grad/ShapeShapeaction_probs*
T0*
out_type0
�
2gradients_1/strided_slice_20_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_20_grad/Shapestrided_slice_20/stackstrided_slice_20/stack_1strided_slice_20/stack_2 gradients_1/Softmax_6_grad/mul_1*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*
Index0*
T0
W
'gradients_1/strided_slice_22_grad/ShapeShapeaction_probs*
T0*
out_type0
�
2gradients_1/strided_slice_22_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_22_grad/Shapestrided_slice_22/stackstrided_slice_22/stack_1strided_slice_22/stack_2 gradients_1/Softmax_7_grad/mul_1*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
W
'gradients_1/strided_slice_24_grad/ShapeShapeaction_probs*
T0*
out_type0
�
2gradients_1/strided_slice_24_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_24_grad/Shapestrided_slice_24/stackstrided_slice_24/stack_1strided_slice_24/stack_2 gradients_1/Softmax_8_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
G
gradients_1/Sum_9_grad/ShapeShapestack_1*
T0*
out_type0
v
gradients_1/Sum_9_grad/SizeConst*
dtype0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
value	B :
�
gradients_1/Sum_9_grad/addAddV2Sum_9/reduction_indicesgradients_1/Sum_9_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape
�
gradients_1/Sum_9_grad/modFloorModgradients_1/Sum_9_grad/addgradients_1/Sum_9_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape
x
gradients_1/Sum_9_grad/Shape_1Const*
dtype0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
valueB 
}
"gradients_1/Sum_9_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_9_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_9_grad/rangeRange"gradients_1/Sum_9_grad/range/startgradients_1/Sum_9_grad/Size"gradients_1/Sum_9_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape
|
!gradients_1/Sum_9_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_9_grad/FillFillgradients_1/Sum_9_grad/Shape_1!gradients_1/Sum_9_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*

index_type0
�
$gradients_1/Sum_9_grad/DynamicStitchDynamicStitchgradients_1/Sum_9_grad/rangegradients_1/Sum_9_grad/modgradients_1/Sum_9_grad/Shapegradients_1/Sum_9_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
N
{
 gradients_1/Sum_9_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_9_grad/MaximumMaximum$gradients_1/Sum_9_grad/DynamicStitch gradients_1/Sum_9_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape
�
gradients_1/Sum_9_grad/floordivFloorDivgradients_1/Sum_9_grad/Shapegradients_1/Sum_9_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_9_grad/Shape
�
gradients_1/Sum_9_grad/ReshapeReshape/gradients_1/sub_5_grad/tuple/control_dependency$gradients_1/Sum_9_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_9_grad/TileTilegradients_1/Sum_9_grad/Reshapegradients_1/Sum_9_grad/floordiv*

Tmultiples0*
T0
U
,gradients_1/clip_by_value/Minimum_grad/ShapeShapesub_3*
T0*
out_type0
W
.gradients_1/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0
�
.gradients_1/clip_by_value/Minimum_grad/Shape_2Shape7gradients_1/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
_
2gradients_1/clip_by_value/Minimum_grad/zeros/ConstConst*
dtype0*
valueB
 *    
�
,gradients_1/clip_by_value/Minimum_grad/zerosFill.gradients_1/clip_by_value/Minimum_grad/Shape_22gradients_1/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0
^
0gradients_1/clip_by_value/Minimum_grad/LessEqual	LessEqualsub_3PolynomialDecay*
T0
�
<gradients_1/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients_1/clip_by_value/Minimum_grad/Shape.gradients_1/clip_by_value/Minimum_grad/Shape_1*
T0
�
-gradients_1/clip_by_value/Minimum_grad/SelectSelect0gradients_1/clip_by_value/Minimum_grad/LessEqual7gradients_1/clip_by_value_grad/tuple/control_dependency,gradients_1/clip_by_value/Minimum_grad/zeros*
T0
�
*gradients_1/clip_by_value/Minimum_grad/SumSum-gradients_1/clip_by_value/Minimum_grad/Select<gradients_1/clip_by_value/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
.gradients_1/clip_by_value/Minimum_grad/ReshapeReshape*gradients_1/clip_by_value/Minimum_grad/Sum,gradients_1/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
�
/gradients_1/clip_by_value/Minimum_grad/Select_1Select0gradients_1/clip_by_value/Minimum_grad/LessEqual,gradients_1/clip_by_value/Minimum_grad/zeros7gradients_1/clip_by_value_grad/tuple/control_dependency*
T0
�
,gradients_1/clip_by_value/Minimum_grad/Sum_1Sum/gradients_1/clip_by_value/Minimum_grad/Select_1>gradients_1/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
0gradients_1/clip_by_value/Minimum_grad/Reshape_1Reshape,gradients_1/clip_by_value/Minimum_grad/Sum_1.gradients_1/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0
�
7gradients_1/clip_by_value/Minimum_grad/tuple/group_depsNoOp/^gradients_1/clip_by_value/Minimum_grad/Reshape1^gradients_1/clip_by_value/Minimum_grad/Reshape_1
�
?gradients_1/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity.gradients_1/clip_by_value/Minimum_grad/Reshape8^gradients_1/clip_by_value/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/clip_by_value/Minimum_grad/Reshape
�
Agradients_1/clip_by_value/Minimum_grad/tuple/control_dependency_1Identity0gradients_1/clip_by_value/Minimum_grad/Reshape_18^gradients_1/clip_by_value/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/clip_by_value/Minimum_grad/Reshape_1
W
.gradients_1/clip_by_value_1/Minimum_grad/ShapeShapesub_4*
T0*
out_type0
Y
0gradients_1/clip_by_value_1/Minimum_grad/Shape_1Const*
valueB *
dtype0
�
0gradients_1/clip_by_value_1/Minimum_grad/Shape_2Shape9gradients_1/clip_by_value_1_grad/tuple/control_dependency*
T0*
out_type0
a
4gradients_1/clip_by_value_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
.gradients_1/clip_by_value_1/Minimum_grad/zerosFill0gradients_1/clip_by_value_1/Minimum_grad/Shape_24gradients_1/clip_by_value_1/Minimum_grad/zeros/Const*
T0*

index_type0
`
2gradients_1/clip_by_value_1/Minimum_grad/LessEqual	LessEqualsub_4PolynomialDecay*
T0
�
>gradients_1/clip_by_value_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients_1/clip_by_value_1/Minimum_grad/Shape0gradients_1/clip_by_value_1/Minimum_grad/Shape_1*
T0
�
/gradients_1/clip_by_value_1/Minimum_grad/SelectSelect2gradients_1/clip_by_value_1/Minimum_grad/LessEqual9gradients_1/clip_by_value_1_grad/tuple/control_dependency.gradients_1/clip_by_value_1/Minimum_grad/zeros*
T0
�
,gradients_1/clip_by_value_1/Minimum_grad/SumSum/gradients_1/clip_by_value_1/Minimum_grad/Select>gradients_1/clip_by_value_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
0gradients_1/clip_by_value_1/Minimum_grad/ReshapeReshape,gradients_1/clip_by_value_1/Minimum_grad/Sum.gradients_1/clip_by_value_1/Minimum_grad/Shape*
T0*
Tshape0
�
1gradients_1/clip_by_value_1/Minimum_grad/Select_1Select2gradients_1/clip_by_value_1/Minimum_grad/LessEqual.gradients_1/clip_by_value_1/Minimum_grad/zeros9gradients_1/clip_by_value_1_grad/tuple/control_dependency*
T0
�
.gradients_1/clip_by_value_1/Minimum_grad/Sum_1Sum1gradients_1/clip_by_value_1/Minimum_grad/Select_1@gradients_1/clip_by_value_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
2gradients_1/clip_by_value_1/Minimum_grad/Reshape_1Reshape.gradients_1/clip_by_value_1/Minimum_grad/Sum_10gradients_1/clip_by_value_1/Minimum_grad/Shape_1*
T0*
Tshape0
�
9gradients_1/clip_by_value_1/Minimum_grad/tuple/group_depsNoOp1^gradients_1/clip_by_value_1/Minimum_grad/Reshape3^gradients_1/clip_by_value_1/Minimum_grad/Reshape_1
�
Agradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependencyIdentity0gradients_1/clip_by_value_1/Minimum_grad/Reshape:^gradients_1/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/clip_by_value_1/Minimum_grad/Reshape
�
Cgradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependency_1Identity2gradients_1/clip_by_value_1/Minimum_grad/Reshape_1:^gradients_1/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/clip_by_value_1/Minimum_grad/Reshape_1
g
 gradients_1/stack_1_grad/unstackUnpackgradients_1/Sum_9_grad/Tile*
T0*	
num*

axis
T
)gradients_1/stack_1_grad/tuple/group_depsNoOp!^gradients_1/stack_1_grad/unstack
�
1gradients_1/stack_1_grad/tuple/control_dependencyIdentity gradients_1/stack_1_grad/unstack*^gradients_1/stack_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/stack_1_grad/unstack
�
3gradients_1/stack_1_grad/tuple/control_dependency_1Identity"gradients_1/stack_1_grad/unstack:1*^gradients_1/stack_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/stack_1_grad/unstack
�
3gradients_1/stack_1_grad/tuple/control_dependency_2Identity"gradients_1/stack_1_grad/unstack:2*^gradients_1/stack_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/stack_1_grad/unstack
F
gradients_1/sub_3_grad/ShapeShapeSum_11*
T0*
out_type0
Z
gradients_1/sub_3_grad/Shape_1Shapeextrinsic_value_estimate*
T0*
out_type0
�
,gradients_1/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_3_grad/Shapegradients_1/sub_3_grad/Shape_1*
T0
�
gradients_1/sub_3_grad/SumSum?gradients_1/clip_by_value/Minimum_grad/tuple/control_dependency,gradients_1/sub_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients_1/sub_3_grad/ReshapeReshapegradients_1/sub_3_grad/Sumgradients_1/sub_3_grad/Shape*
T0*
Tshape0
k
gradients_1/sub_3_grad/NegNeg?gradients_1/clip_by_value/Minimum_grad/tuple/control_dependency*
T0
�
gradients_1/sub_3_grad/Sum_1Sumgradients_1/sub_3_grad/Neg.gradients_1/sub_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/sub_3_grad/Reshape_1Reshapegradients_1/sub_3_grad/Sum_1gradients_1/sub_3_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_3_grad/tuple/group_depsNoOp^gradients_1/sub_3_grad/Reshape!^gradients_1/sub_3_grad/Reshape_1
�
/gradients_1/sub_3_grad/tuple/control_dependencyIdentitygradients_1/sub_3_grad/Reshape(^gradients_1/sub_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_3_grad/Reshape
�
1gradients_1/sub_3_grad/tuple/control_dependency_1Identity gradients_1/sub_3_grad/Reshape_1(^gradients_1/sub_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_3_grad/Reshape_1
F
gradients_1/sub_4_grad/ShapeShapeSum_13*
T0*
out_type0
Z
gradients_1/sub_4_grad/Shape_1Shapecuriosity_value_estimate*
T0*
out_type0
�
,gradients_1/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_4_grad/Shapegradients_1/sub_4_grad/Shape_1*
T0
�
gradients_1/sub_4_grad/SumSumAgradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependency,gradients_1/sub_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/sub_4_grad/ReshapeReshapegradients_1/sub_4_grad/Sumgradients_1/sub_4_grad/Shape*
T0*
Tshape0
m
gradients_1/sub_4_grad/NegNegAgradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependency*
T0
�
gradients_1/sub_4_grad/Sum_1Sumgradients_1/sub_4_grad/Neg.gradients_1/sub_4_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
 gradients_1/sub_4_grad/Reshape_1Reshapegradients_1/sub_4_grad/Sum_1gradients_1/sub_4_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_4_grad/tuple/group_depsNoOp^gradients_1/sub_4_grad/Reshape!^gradients_1/sub_4_grad/Reshape_1
�
/gradients_1/sub_4_grad/tuple/control_dependencyIdentitygradients_1/sub_4_grad/Reshape(^gradients_1/sub_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_4_grad/Reshape
�
1gradients_1/sub_4_grad/tuple/control_dependency_1Identity gradients_1/sub_4_grad/Reshape_1(^gradients_1/sub_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_4_grad/Reshape_1
[
gradients_1/Neg_grad/NegNeg1gradients_1/stack_1_grad/tuple/control_dependency*
T0
_
gradients_1/Neg_1_grad/NegNeg3gradients_1/stack_1_grad/tuple/control_dependency_1*
T0
_
gradients_1/Neg_2_grad/NegNeg3gradients_1/stack_1_grad/tuple/control_dependency_2*
T0
X
gradients_1/Sum_11_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
x
gradients_1/Sum_11_grad/SizeConst*
dtype0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
value	B :
�
gradients_1/Sum_11_grad/addAddV2Sum_11/reduction_indicesgradients_1/Sum_11_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape
�
gradients_1/Sum_11_grad/modFloorModgradients_1/Sum_11_grad/addgradients_1/Sum_11_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape
z
gradients_1/Sum_11_grad/Shape_1Const*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
valueB *
dtype0

#gradients_1/Sum_11_grad/range/startConst*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
value	B : *
dtype0

#gradients_1/Sum_11_grad/range/deltaConst*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_11_grad/rangeRange#gradients_1/Sum_11_grad/range/startgradients_1/Sum_11_grad/Size#gradients_1/Sum_11_grad/range/delta*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*

Tidx0
~
"gradients_1/Sum_11_grad/Fill/valueConst*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_11_grad/FillFillgradients_1/Sum_11_grad/Shape_1"gradients_1/Sum_11_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*

index_type0
�
%gradients_1/Sum_11_grad/DynamicStitchDynamicStitchgradients_1/Sum_11_grad/rangegradients_1/Sum_11_grad/modgradients_1/Sum_11_grad/Shapegradients_1/Sum_11_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
N
}
!gradients_1/Sum_11_grad/Maximum/yConst*
dtype0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape*
value	B :
�
gradients_1/Sum_11_grad/MaximumMaximum%gradients_1/Sum_11_grad/DynamicStitch!gradients_1/Sum_11_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape
�
 gradients_1/Sum_11_grad/floordivFloorDivgradients_1/Sum_11_grad/Shapegradients_1/Sum_11_grad/Maximum*
T0*0
_class&
$"loc:@gradients_1/Sum_11_grad/Shape
�
gradients_1/Sum_11_grad/ReshapeReshape/gradients_1/sub_3_grad/tuple/control_dependency%gradients_1/Sum_11_grad/DynamicStitch*
T0*
Tshape0
�
gradients_1/Sum_11_grad/TileTilegradients_1/Sum_11_grad/Reshape gradients_1/Sum_11_grad/floordiv*

Tmultiples0*
T0
X
gradients_1/Sum_13_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
x
gradients_1/Sum_13_grad/SizeConst*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_13_grad/addAddV2Sum_13/reduction_indicesgradients_1/Sum_13_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape
�
gradients_1/Sum_13_grad/modFloorModgradients_1/Sum_13_grad/addgradients_1/Sum_13_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape
z
gradients_1/Sum_13_grad/Shape_1Const*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
valueB *
dtype0

#gradients_1/Sum_13_grad/range/startConst*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
value	B : *
dtype0

#gradients_1/Sum_13_grad/range/deltaConst*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_13_grad/rangeRange#gradients_1/Sum_13_grad/range/startgradients_1/Sum_13_grad/Size#gradients_1/Sum_13_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape
~
"gradients_1/Sum_13_grad/Fill/valueConst*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_13_grad/FillFillgradients_1/Sum_13_grad/Shape_1"gradients_1/Sum_13_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*

index_type0
�
%gradients_1/Sum_13_grad/DynamicStitchDynamicStitchgradients_1/Sum_13_grad/rangegradients_1/Sum_13_grad/modgradients_1/Sum_13_grad/Shapegradients_1/Sum_13_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
N
}
!gradients_1/Sum_13_grad/Maximum/yConst*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_13_grad/MaximumMaximum%gradients_1/Sum_13_grad/DynamicStitch!gradients_1/Sum_13_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape
�
 gradients_1/Sum_13_grad/floordivFloorDivgradients_1/Sum_13_grad/Shapegradients_1/Sum_13_grad/Maximum*
T0*0
_class&
$"loc:@gradients_1/Sum_13_grad/Shape
�
gradients_1/Sum_13_grad/ReshapeReshape/gradients_1/sub_4_grad/tuple/control_dependency%gradients_1/Sum_13_grad/DynamicStitch*
T0*
Tshape0
�
gradients_1/Sum_13_grad/TileTilegradients_1/Sum_13_grad/Reshape gradients_1/Sum_13_grad/floordiv*

Tmultiples0*
T0
�
Dgradients_1/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_3*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ReshapeReshapegradients_1/Neg_grad/NegDgradients_1/softmax_cross_entropy_with_logits_3/Reshape_2_grad/Shape*
T0*
Tshape0
�
Dgradients_1/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_4*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ReshapeReshapegradients_1/Neg_1_grad/NegDgradients_1/softmax_cross_entropy_with_logits_4/Reshape_2_grad/Shape*
T0*
Tshape0
�
Dgradients_1/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_5*
T0*
out_type0
�
Fgradients_1/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ReshapeReshapegradients_1/Neg_2_grad/NegDgradients_1/softmax_cross_entropy_with_logits_5/Reshape_2_grad/Shape*
T0*
Tshape0
�
gradients_1/AddN_1AddNgradients_1/Sum_12_grad/Tilegradients_1/Sum_11_grad/Tile*
T0*/
_class%
#!loc:@gradients_1/Sum_12_grad/Tile*
N
w
4gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_1*
T0*
data_formatNHWC
�
9gradients_1/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_15^gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGrad
�
Agradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_1:^gradients_1/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_1/Sum_12_grad/Tile
�
Cgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGrad:^gradients_1/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGrad
�
gradients_1/AddN_2AddNgradients_1/Sum_14_grad/Tilegradients_1/Sum_13_grad/Tile*
T0*/
_class%
#!loc:@gradients_1/Sum_14_grad/Tile*
N
w
4gradients_1/curiosity_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_2*
T0*
data_formatNHWC
�
9gradients_1/curiosity_value/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_25^gradients_1/curiosity_value/BiasAdd_grad/BiasAddGrad
�
Agradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_2:^gradients_1/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_1/Sum_14_grad/Tile
�
Cgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/curiosity_value/BiasAdd_grad/BiasAddGrad:^gradients_1/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/curiosity_value/BiasAdd_grad/BiasAddGrad
U
gradients_1/zeros_like_7	ZerosLike%softmax_cross_entropy_with_logits_3:1*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
?gradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims/dim*

Tdim0*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_3_grad/mulMul?gradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims%softmax_cross_entropy_with_logits_3:1*
T0
�
?gradients_1/softmax_cross_entropy_with_logits_3_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_3/Reshape*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_3_grad/NegNeg?gradients_1/softmax_cross_entropy_with_logits_3_grad/LogSoftmax*
T0
x
Egradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
Agradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims_1
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_3/Reshape_2_grad/ReshapeEgradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims_1/dim*

Tdim0*
T0
�
:gradients_1/softmax_cross_entropy_with_logits_3_grad/mul_1MulAgradients_1/softmax_cross_entropy_with_logits_3_grad/ExpandDims_18gradients_1/softmax_cross_entropy_with_logits_3_grad/Neg*
T0
�
Egradients_1/softmax_cross_entropy_with_logits_3_grad/tuple/group_depsNoOp9^gradients_1/softmax_cross_entropy_with_logits_3_grad/mul;^gradients_1/softmax_cross_entropy_with_logits_3_grad/mul_1
�
Mgradients_1/softmax_cross_entropy_with_logits_3_grad/tuple/control_dependencyIdentity8gradients_1/softmax_cross_entropy_with_logits_3_grad/mulF^gradients_1/softmax_cross_entropy_with_logits_3_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_3_grad/mul
�
Ogradients_1/softmax_cross_entropy_with_logits_3_grad/tuple/control_dependency_1Identity:gradients_1/softmax_cross_entropy_with_logits_3_grad/mul_1F^gradients_1/softmax_cross_entropy_with_logits_3_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/softmax_cross_entropy_with_logits_3_grad/mul_1
U
gradients_1/zeros_like_8	ZerosLike%softmax_cross_entropy_with_logits_4:1*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
?gradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims/dim*

Tdim0*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_4_grad/mulMul?gradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims%softmax_cross_entropy_with_logits_4:1*
T0
�
?gradients_1/softmax_cross_entropy_with_logits_4_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_4/Reshape*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_4_grad/NegNeg?gradients_1/softmax_cross_entropy_with_logits_4_grad/LogSoftmax*
T0
x
Egradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
Agradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims_1
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_4/Reshape_2_grad/ReshapeEgradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims_1/dim*

Tdim0*
T0
�
:gradients_1/softmax_cross_entropy_with_logits_4_grad/mul_1MulAgradients_1/softmax_cross_entropy_with_logits_4_grad/ExpandDims_18gradients_1/softmax_cross_entropy_with_logits_4_grad/Neg*
T0
�
Egradients_1/softmax_cross_entropy_with_logits_4_grad/tuple/group_depsNoOp9^gradients_1/softmax_cross_entropy_with_logits_4_grad/mul;^gradients_1/softmax_cross_entropy_with_logits_4_grad/mul_1
�
Mgradients_1/softmax_cross_entropy_with_logits_4_grad/tuple/control_dependencyIdentity8gradients_1/softmax_cross_entropy_with_logits_4_grad/mulF^gradients_1/softmax_cross_entropy_with_logits_4_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_4_grad/mul
�
Ogradients_1/softmax_cross_entropy_with_logits_4_grad/tuple/control_dependency_1Identity:gradients_1/softmax_cross_entropy_with_logits_4_grad/mul_1F^gradients_1/softmax_cross_entropy_with_logits_4_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/softmax_cross_entropy_with_logits_4_grad/mul_1
U
gradients_1/zeros_like_9	ZerosLike%softmax_cross_entropy_with_logits_5:1*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
?gradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims/dim*

Tdim0*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_5_grad/mulMul?gradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims%softmax_cross_entropy_with_logits_5:1*
T0
�
?gradients_1/softmax_cross_entropy_with_logits_5_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_5/Reshape*
T0
�
8gradients_1/softmax_cross_entropy_with_logits_5_grad/NegNeg?gradients_1/softmax_cross_entropy_with_logits_5_grad/LogSoftmax*
T0
x
Egradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
Agradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims_1
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_5/Reshape_2_grad/ReshapeEgradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims_1/dim*
T0*

Tdim0
�
:gradients_1/softmax_cross_entropy_with_logits_5_grad/mul_1MulAgradients_1/softmax_cross_entropy_with_logits_5_grad/ExpandDims_18gradients_1/softmax_cross_entropy_with_logits_5_grad/Neg*
T0
�
Egradients_1/softmax_cross_entropy_with_logits_5_grad/tuple/group_depsNoOp9^gradients_1/softmax_cross_entropy_with_logits_5_grad/mul;^gradients_1/softmax_cross_entropy_with_logits_5_grad/mul_1
�
Mgradients_1/softmax_cross_entropy_with_logits_5_grad/tuple/control_dependencyIdentity8gradients_1/softmax_cross_entropy_with_logits_5_grad/mulF^gradients_1/softmax_cross_entropy_with_logits_5_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_5_grad/mul
�
Ogradients_1/softmax_cross_entropy_with_logits_5_grad/tuple/control_dependency_1Identity:gradients_1/softmax_cross_entropy_with_logits_5_grad/mul_1F^gradients_1/softmax_cross_entropy_with_logits_5_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/softmax_cross_entropy_with_logits_5_grad/mul_1
�
.gradients_1/extrinsic_value/MatMul_grad/MatMulMatMulAgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependencyextrinsic_value/kernel/read*
transpose_a( *
transpose_b(*
T0
�
0gradients_1/extrinsic_value/MatMul_grad/MatMul_1MatMul	Reshape_2Agradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
8gradients_1/extrinsic_value/MatMul_grad/tuple/group_depsNoOp/^gradients_1/extrinsic_value/MatMul_grad/MatMul1^gradients_1/extrinsic_value/MatMul_grad/MatMul_1
�
@gradients_1/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/extrinsic_value/MatMul_grad/MatMul9^gradients_1/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/extrinsic_value/MatMul_grad/MatMul
�
Bgradients_1/extrinsic_value/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/extrinsic_value/MatMul_grad/MatMul_19^gradients_1/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/extrinsic_value/MatMul_grad/MatMul_1
�
.gradients_1/curiosity_value/MatMul_grad/MatMulMatMulAgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependencycuriosity_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
0gradients_1/curiosity_value/MatMul_grad/MatMul_1MatMul	Reshape_2Agradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
8gradients_1/curiosity_value/MatMul_grad/tuple/group_depsNoOp/^gradients_1/curiosity_value/MatMul_grad/MatMul1^gradients_1/curiosity_value/MatMul_grad/MatMul_1
�
@gradients_1/curiosity_value/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/curiosity_value/MatMul_grad/MatMul9^gradients_1/curiosity_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/curiosity_value/MatMul_grad/MatMul
�
Bgradients_1/curiosity_value/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/curiosity_value/MatMul_grad/MatMul_19^gradients_1/curiosity_value/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/curiosity_value/MatMul_grad/MatMul_1
v
Bgradients_1/softmax_cross_entropy_with_logits_3/Reshape_grad/ShapeShapestrided_slice_27*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits_3/Reshape_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_3_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits_3/Reshape_grad/Shape*
T0*
Tshape0
v
Bgradients_1/softmax_cross_entropy_with_logits_4/Reshape_grad/ShapeShapestrided_slice_29*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits_4/Reshape_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_4_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits_4/Reshape_grad/Shape*
T0*
Tshape0
v
Bgradients_1/softmax_cross_entropy_with_logits_5/Reshape_grad/ShapeShapestrided_slice_31*
T0*
out_type0
�
Dgradients_1/softmax_cross_entropy_with_logits_5/Reshape_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_5_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits_5/Reshape_grad/Shape*
T0*
Tshape0
S
'gradients_1/strided_slice_27_grad/ShapeShapeconcat_5*
T0*
out_type0
�
2gradients_1/strided_slice_27_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_27_grad/Shapestrided_slice_27/stackstrided_slice_27/stack_1strided_slice_27/stack_2Dgradients_1/softmax_cross_entropy_with_logits_3/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
S
'gradients_1/strided_slice_29_grad/ShapeShapeconcat_5*
T0*
out_type0
�
2gradients_1/strided_slice_29_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_29_grad/Shapestrided_slice_29/stackstrided_slice_29/stack_1strided_slice_29/stack_2Dgradients_1/softmax_cross_entropy_with_logits_4/Reshape_grad/Reshape*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
S
'gradients_1/strided_slice_31_grad/ShapeShapeconcat_5*
T0*
out_type0
�
2gradients_1/strided_slice_31_grad/StridedSliceGradStridedSliceGrad'gradients_1/strided_slice_31_grad/Shapestrided_slice_31/stackstrided_slice_31/stack_1strided_slice_31/stack_2Dgradients_1/softmax_cross_entropy_with_logits_5/Reshape_grad/Reshape*
end_mask*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
�
gradients_1/AddN_3AddN2gradients_1/strided_slice_27_grad/StridedSliceGrad2gradients_1/strided_slice_29_grad/StridedSliceGrad2gradients_1/strided_slice_31_grad/StridedSliceGrad*
T0*E
_class;
97loc:@gradients_1/strided_slice_27_grad/StridedSliceGrad*
N
H
gradients_1/concat_5_grad/RankConst*
value	B :*
dtype0
a
gradients_1/concat_5_grad/modFloorModconcat_5/axisgradients_1/concat_5_grad/Rank*
T0
H
gradients_1/concat_5_grad/ShapeShapeLog_3*
T0*
out_type0
a
 gradients_1/concat_5_grad/ShapeNShapeNLog_3Log_4Log_5*
N*
T0*
out_type0
�
&gradients_1/concat_5_grad/ConcatOffsetConcatOffsetgradients_1/concat_5_grad/mod gradients_1/concat_5_grad/ShapeN"gradients_1/concat_5_grad/ShapeN:1"gradients_1/concat_5_grad/ShapeN:2*
N
�
gradients_1/concat_5_grad/SliceSlicegradients_1/AddN_3&gradients_1/concat_5_grad/ConcatOffset gradients_1/concat_5_grad/ShapeN*
T0*
Index0
�
!gradients_1/concat_5_grad/Slice_1Slicegradients_1/AddN_3(gradients_1/concat_5_grad/ConcatOffset:1"gradients_1/concat_5_grad/ShapeN:1*
T0*
Index0
�
!gradients_1/concat_5_grad/Slice_2Slicegradients_1/AddN_3(gradients_1/concat_5_grad/ConcatOffset:2"gradients_1/concat_5_grad/ShapeN:2*
T0*
Index0
�
*gradients_1/concat_5_grad/tuple/group_depsNoOp ^gradients_1/concat_5_grad/Slice"^gradients_1/concat_5_grad/Slice_1"^gradients_1/concat_5_grad/Slice_2
�
2gradients_1/concat_5_grad/tuple/control_dependencyIdentitygradients_1/concat_5_grad/Slice+^gradients_1/concat_5_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/concat_5_grad/Slice
�
4gradients_1/concat_5_grad/tuple/control_dependency_1Identity!gradients_1/concat_5_grad/Slice_1+^gradients_1/concat_5_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/concat_5_grad/Slice_1
�
4gradients_1/concat_5_grad/tuple/control_dependency_2Identity!gradients_1/concat_5_grad/Slice_2+^gradients_1/concat_5_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/concat_5_grad/Slice_2
u
!gradients_1/Log_3_grad/Reciprocal
Reciprocaladd_113^gradients_1/concat_5_grad/tuple/control_dependency*
T0
�
gradients_1/Log_3_grad/mulMul2gradients_1/concat_5_grad/tuple/control_dependency!gradients_1/Log_3_grad/Reciprocal*
T0
w
!gradients_1/Log_4_grad/Reciprocal
Reciprocaladd_125^gradients_1/concat_5_grad/tuple/control_dependency_1*
T0
�
gradients_1/Log_4_grad/mulMul4gradients_1/concat_5_grad/tuple/control_dependency_1!gradients_1/Log_4_grad/Reciprocal*
T0
w
!gradients_1/Log_5_grad/Reciprocal
Reciprocaladd_135^gradients_1/concat_5_grad/tuple/control_dependency_2*
T0
�
gradients_1/Log_5_grad/mulMul4gradients_1/concat_5_grad/tuple/control_dependency_2!gradients_1/Log_5_grad/Reciprocal*
T0
J
gradients_1/add_11_grad/ShapeShape	truediv_3*
T0*
out_type0
K
gradients_1/add_11_grad/Shape_1Shapeadd_11/y*
T0*
out_type0
�
-gradients_1/add_11_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_11_grad/Shapegradients_1/add_11_grad/Shape_1*
T0
�
gradients_1/add_11_grad/SumSumgradients_1/Log_3_grad/mul-gradients_1/add_11_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
}
gradients_1/add_11_grad/ReshapeReshapegradients_1/add_11_grad/Sumgradients_1/add_11_grad/Shape*
T0*
Tshape0
�
gradients_1/add_11_grad/Sum_1Sumgradients_1/Log_3_grad/mul/gradients_1/add_11_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
!gradients_1/add_11_grad/Reshape_1Reshapegradients_1/add_11_grad/Sum_1gradients_1/add_11_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_11_grad/tuple/group_depsNoOp ^gradients_1/add_11_grad/Reshape"^gradients_1/add_11_grad/Reshape_1
�
0gradients_1/add_11_grad/tuple/control_dependencyIdentitygradients_1/add_11_grad/Reshape)^gradients_1/add_11_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_11_grad/Reshape
�
2gradients_1/add_11_grad/tuple/control_dependency_1Identity!gradients_1/add_11_grad/Reshape_1)^gradients_1/add_11_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_11_grad/Reshape_1
J
gradients_1/add_12_grad/ShapeShape	truediv_4*
T0*
out_type0
K
gradients_1/add_12_grad/Shape_1Shapeadd_12/y*
T0*
out_type0
�
-gradients_1/add_12_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_12_grad/Shapegradients_1/add_12_grad/Shape_1*
T0
�
gradients_1/add_12_grad/SumSumgradients_1/Log_4_grad/mul-gradients_1/add_12_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
}
gradients_1/add_12_grad/ReshapeReshapegradients_1/add_12_grad/Sumgradients_1/add_12_grad/Shape*
T0*
Tshape0
�
gradients_1/add_12_grad/Sum_1Sumgradients_1/Log_4_grad/mul/gradients_1/add_12_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
!gradients_1/add_12_grad/Reshape_1Reshapegradients_1/add_12_grad/Sum_1gradients_1/add_12_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_12_grad/tuple/group_depsNoOp ^gradients_1/add_12_grad/Reshape"^gradients_1/add_12_grad/Reshape_1
�
0gradients_1/add_12_grad/tuple/control_dependencyIdentitygradients_1/add_12_grad/Reshape)^gradients_1/add_12_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_12_grad/Reshape
�
2gradients_1/add_12_grad/tuple/control_dependency_1Identity!gradients_1/add_12_grad/Reshape_1)^gradients_1/add_12_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_12_grad/Reshape_1
J
gradients_1/add_13_grad/ShapeShape	truediv_5*
T0*
out_type0
K
gradients_1/add_13_grad/Shape_1Shapeadd_13/y*
T0*
out_type0
�
-gradients_1/add_13_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_13_grad/Shapegradients_1/add_13_grad/Shape_1*
T0
�
gradients_1/add_13_grad/SumSumgradients_1/Log_5_grad/mul-gradients_1/add_13_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
}
gradients_1/add_13_grad/ReshapeReshapegradients_1/add_13_grad/Sumgradients_1/add_13_grad/Shape*
T0*
Tshape0
�
gradients_1/add_13_grad/Sum_1Sumgradients_1/Log_5_grad/mul/gradients_1/add_13_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_1/add_13_grad/Reshape_1Reshapegradients_1/add_13_grad/Sum_1gradients_1/add_13_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_13_grad/tuple/group_depsNoOp ^gradients_1/add_13_grad/Reshape"^gradients_1/add_13_grad/Reshape_1
�
0gradients_1/add_13_grad/tuple/control_dependencyIdentitygradients_1/add_13_grad/Reshape)^gradients_1/add_13_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_13_grad/Reshape
�
2gradients_1/add_13_grad/tuple/control_dependency_1Identity!gradients_1/add_13_grad/Reshape_1)^gradients_1/add_13_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_13_grad/Reshape_1
I
 gradients_1/truediv_3_grad/ShapeShapeMul_1*
T0*
out_type0
K
"gradients_1/truediv_3_grad/Shape_1ShapeSum_2*
T0*
out_type0
�
0gradients_1/truediv_3_grad/BroadcastGradientArgsBroadcastGradientArgs gradients_1/truediv_3_grad/Shape"gradients_1/truediv_3_grad/Shape_1*
T0
o
"gradients_1/truediv_3_grad/RealDivRealDiv0gradients_1/add_11_grad/tuple/control_dependencySum_2*
T0
�
gradients_1/truediv_3_grad/SumSum"gradients_1/truediv_3_grad/RealDiv0gradients_1/truediv_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
"gradients_1/truediv_3_grad/ReshapeReshapegradients_1/truediv_3_grad/Sum gradients_1/truediv_3_grad/Shape*
T0*
Tshape0
5
gradients_1/truediv_3_grad/NegNegMul_1*
T0
_
$gradients_1/truediv_3_grad/RealDiv_1RealDivgradients_1/truediv_3_grad/NegSum_2*
T0
e
$gradients_1/truediv_3_grad/RealDiv_2RealDiv$gradients_1/truediv_3_grad/RealDiv_1Sum_2*
T0
�
gradients_1/truediv_3_grad/mulMul0gradients_1/add_11_grad/tuple/control_dependency$gradients_1/truediv_3_grad/RealDiv_2*
T0
�
 gradients_1/truediv_3_grad/Sum_1Sumgradients_1/truediv_3_grad/mul2gradients_1/truediv_3_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
$gradients_1/truediv_3_grad/Reshape_1Reshape gradients_1/truediv_3_grad/Sum_1"gradients_1/truediv_3_grad/Shape_1*
T0*
Tshape0

+gradients_1/truediv_3_grad/tuple/group_depsNoOp#^gradients_1/truediv_3_grad/Reshape%^gradients_1/truediv_3_grad/Reshape_1
�
3gradients_1/truediv_3_grad/tuple/control_dependencyIdentity"gradients_1/truediv_3_grad/Reshape,^gradients_1/truediv_3_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/truediv_3_grad/Reshape
�
5gradients_1/truediv_3_grad/tuple/control_dependency_1Identity$gradients_1/truediv_3_grad/Reshape_1,^gradients_1/truediv_3_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/truediv_3_grad/Reshape_1
I
 gradients_1/truediv_4_grad/ShapeShapeMul_2*
T0*
out_type0
K
"gradients_1/truediv_4_grad/Shape_1ShapeSum_3*
T0*
out_type0
�
0gradients_1/truediv_4_grad/BroadcastGradientArgsBroadcastGradientArgs gradients_1/truediv_4_grad/Shape"gradients_1/truediv_4_grad/Shape_1*
T0
o
"gradients_1/truediv_4_grad/RealDivRealDiv0gradients_1/add_12_grad/tuple/control_dependencySum_3*
T0
�
gradients_1/truediv_4_grad/SumSum"gradients_1/truediv_4_grad/RealDiv0gradients_1/truediv_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
"gradients_1/truediv_4_grad/ReshapeReshapegradients_1/truediv_4_grad/Sum gradients_1/truediv_4_grad/Shape*
T0*
Tshape0
5
gradients_1/truediv_4_grad/NegNegMul_2*
T0
_
$gradients_1/truediv_4_grad/RealDiv_1RealDivgradients_1/truediv_4_grad/NegSum_3*
T0
e
$gradients_1/truediv_4_grad/RealDiv_2RealDiv$gradients_1/truediv_4_grad/RealDiv_1Sum_3*
T0
�
gradients_1/truediv_4_grad/mulMul0gradients_1/add_12_grad/tuple/control_dependency$gradients_1/truediv_4_grad/RealDiv_2*
T0
�
 gradients_1/truediv_4_grad/Sum_1Sumgradients_1/truediv_4_grad/mul2gradients_1/truediv_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
$gradients_1/truediv_4_grad/Reshape_1Reshape gradients_1/truediv_4_grad/Sum_1"gradients_1/truediv_4_grad/Shape_1*
T0*
Tshape0

+gradients_1/truediv_4_grad/tuple/group_depsNoOp#^gradients_1/truediv_4_grad/Reshape%^gradients_1/truediv_4_grad/Reshape_1
�
3gradients_1/truediv_4_grad/tuple/control_dependencyIdentity"gradients_1/truediv_4_grad/Reshape,^gradients_1/truediv_4_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/truediv_4_grad/Reshape
�
5gradients_1/truediv_4_grad/tuple/control_dependency_1Identity$gradients_1/truediv_4_grad/Reshape_1,^gradients_1/truediv_4_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/truediv_4_grad/Reshape_1
I
 gradients_1/truediv_5_grad/ShapeShapeMul_3*
T0*
out_type0
K
"gradients_1/truediv_5_grad/Shape_1ShapeSum_4*
T0*
out_type0
�
0gradients_1/truediv_5_grad/BroadcastGradientArgsBroadcastGradientArgs gradients_1/truediv_5_grad/Shape"gradients_1/truediv_5_grad/Shape_1*
T0
o
"gradients_1/truediv_5_grad/RealDivRealDiv0gradients_1/add_13_grad/tuple/control_dependencySum_4*
T0
�
gradients_1/truediv_5_grad/SumSum"gradients_1/truediv_5_grad/RealDiv0gradients_1/truediv_5_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
"gradients_1/truediv_5_grad/ReshapeReshapegradients_1/truediv_5_grad/Sum gradients_1/truediv_5_grad/Shape*
T0*
Tshape0
5
gradients_1/truediv_5_grad/NegNegMul_3*
T0
_
$gradients_1/truediv_5_grad/RealDiv_1RealDivgradients_1/truediv_5_grad/NegSum_4*
T0
e
$gradients_1/truediv_5_grad/RealDiv_2RealDiv$gradients_1/truediv_5_grad/RealDiv_1Sum_4*
T0
�
gradients_1/truediv_5_grad/mulMul0gradients_1/add_13_grad/tuple/control_dependency$gradients_1/truediv_5_grad/RealDiv_2*
T0
�
 gradients_1/truediv_5_grad/Sum_1Sumgradients_1/truediv_5_grad/mul2gradients_1/truediv_5_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
$gradients_1/truediv_5_grad/Reshape_1Reshape gradients_1/truediv_5_grad/Sum_1"gradients_1/truediv_5_grad/Shape_1*
T0*
Tshape0

+gradients_1/truediv_5_grad/tuple/group_depsNoOp#^gradients_1/truediv_5_grad/Reshape%^gradients_1/truediv_5_grad/Reshape_1
�
3gradients_1/truediv_5_grad/tuple/control_dependencyIdentity"gradients_1/truediv_5_grad/Reshape,^gradients_1/truediv_5_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/truediv_5_grad/Reshape
�
5gradients_1/truediv_5_grad/tuple/control_dependency_1Identity$gradients_1/truediv_5_grad/Reshape_1,^gradients_1/truediv_5_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/truediv_5_grad/Reshape_1
E
gradients_1/Sum_2_grad/ShapeShapeMul_1*
T0*
out_type0
v
gradients_1/Sum_2_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_2_grad/addAddV2Sum_2/reduction_indicesgradients_1/Sum_2_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
�
gradients_1/Sum_2_grad/modFloorModgradients_1/Sum_2_grad/addgradients_1/Sum_2_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
x
gradients_1/Sum_2_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_2_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_2_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_2_grad/rangeRange"gradients_1/Sum_2_grad/range/startgradients_1/Sum_2_grad/Size"gradients_1/Sum_2_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
|
!gradients_1/Sum_2_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_2_grad/FillFillgradients_1/Sum_2_grad/Shape_1!gradients_1/Sum_2_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*

index_type0
�
$gradients_1/Sum_2_grad/DynamicStitchDynamicStitchgradients_1/Sum_2_grad/rangegradients_1/Sum_2_grad/modgradients_1/Sum_2_grad/Shapegradients_1/Sum_2_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
N
{
 gradients_1/Sum_2_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_2_grad/MaximumMaximum$gradients_1/Sum_2_grad/DynamicStitch gradients_1/Sum_2_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
�
gradients_1/Sum_2_grad/floordivFloorDivgradients_1/Sum_2_grad/Shapegradients_1/Sum_2_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
�
gradients_1/Sum_2_grad/ReshapeReshape5gradients_1/truediv_3_grad/tuple/control_dependency_1$gradients_1/Sum_2_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_2_grad/TileTilegradients_1/Sum_2_grad/Reshapegradients_1/Sum_2_grad/floordiv*

Tmultiples0*
T0
E
gradients_1/Sum_3_grad/ShapeShapeMul_2*
T0*
out_type0
v
gradients_1/Sum_3_grad/SizeConst*
dtype0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :
�
gradients_1/Sum_3_grad/addAddV2Sum_3/reduction_indicesgradients_1/Sum_3_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
�
gradients_1/Sum_3_grad/modFloorModgradients_1/Sum_3_grad/addgradients_1/Sum_3_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
x
gradients_1/Sum_3_grad/Shape_1Const*
dtype0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
valueB 
}
"gradients_1/Sum_3_grad/range/startConst*
dtype0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B : 
}
"gradients_1/Sum_3_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_3_grad/rangeRange"gradients_1/Sum_3_grad/range/startgradients_1/Sum_3_grad/Size"gradients_1/Sum_3_grad/range/delta*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*

Tidx0
|
!gradients_1/Sum_3_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_3_grad/FillFillgradients_1/Sum_3_grad/Shape_1!gradients_1/Sum_3_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*

index_type0
�
$gradients_1/Sum_3_grad/DynamicStitchDynamicStitchgradients_1/Sum_3_grad/rangegradients_1/Sum_3_grad/modgradients_1/Sum_3_grad/Shapegradients_1/Sum_3_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
N
{
 gradients_1/Sum_3_grad/Maximum/yConst*
dtype0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :
�
gradients_1/Sum_3_grad/MaximumMaximum$gradients_1/Sum_3_grad/DynamicStitch gradients_1/Sum_3_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
�
gradients_1/Sum_3_grad/floordivFloorDivgradients_1/Sum_3_grad/Shapegradients_1/Sum_3_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
�
gradients_1/Sum_3_grad/ReshapeReshape5gradients_1/truediv_4_grad/tuple/control_dependency_1$gradients_1/Sum_3_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_3_grad/TileTilegradients_1/Sum_3_grad/Reshapegradients_1/Sum_3_grad/floordiv*
T0*

Tmultiples0
E
gradients_1/Sum_4_grad/ShapeShapeMul_3*
T0*
out_type0
v
gradients_1/Sum_4_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_4_grad/addAddV2Sum_4/reduction_indicesgradients_1/Sum_4_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape
�
gradients_1/Sum_4_grad/modFloorModgradients_1/Sum_4_grad/addgradients_1/Sum_4_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape
x
gradients_1/Sum_4_grad/Shape_1Const*
dtype0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
valueB 
}
"gradients_1/Sum_4_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_4_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_4_grad/rangeRange"gradients_1/Sum_4_grad/range/startgradients_1/Sum_4_grad/Size"gradients_1/Sum_4_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape
|
!gradients_1/Sum_4_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_4_grad/FillFillgradients_1/Sum_4_grad/Shape_1!gradients_1/Sum_4_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*

index_type0
�
$gradients_1/Sum_4_grad/DynamicStitchDynamicStitchgradients_1/Sum_4_grad/rangegradients_1/Sum_4_grad/modgradients_1/Sum_4_grad/Shapegradients_1/Sum_4_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
N
{
 gradients_1/Sum_4_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape*
value	B :*
dtype0
�
gradients_1/Sum_4_grad/MaximumMaximum$gradients_1/Sum_4_grad/DynamicStitch gradients_1/Sum_4_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape
�
gradients_1/Sum_4_grad/floordivFloorDivgradients_1/Sum_4_grad/Shapegradients_1/Sum_4_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_4_grad/Shape
�
gradients_1/Sum_4_grad/ReshapeReshape5gradients_1/truediv_5_grad/tuple/control_dependency_1$gradients_1/Sum_4_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_4_grad/TileTilegradients_1/Sum_4_grad/Reshapegradients_1/Sum_4_grad/floordiv*

Tmultiples0*
T0
�
gradients_1/AddN_4AddN3gradients_1/truediv_3_grad/tuple/control_dependencygradients_1/Sum_2_grad/Tile*
T0*5
_class+
)'loc:@gradients_1/truediv_3_grad/Reshape*
N
E
gradients_1/Mul_1_grad/ShapeShapeadd_5*
T0*
out_type0
Q
gradients_1/Mul_1_grad/Shape_1Shapestrided_slice_8*
T0*
out_type0
�
,gradients_1/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Mul_1_grad/Shapegradients_1/Mul_1_grad/Shape_1*
T0
O
gradients_1/Mul_1_grad/MulMulgradients_1/AddN_4strided_slice_8*
T0
�
gradients_1/Mul_1_grad/SumSumgradients_1/Mul_1_grad/Mul,gradients_1/Mul_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/Mul_1_grad/ReshapeReshapegradients_1/Mul_1_grad/Sumgradients_1/Mul_1_grad/Shape*
T0*
Tshape0
G
gradients_1/Mul_1_grad/Mul_1Muladd_5gradients_1/AddN_4*
T0
�
gradients_1/Mul_1_grad/Sum_1Sumgradients_1/Mul_1_grad/Mul_1.gradients_1/Mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/Mul_1_grad/Reshape_1Reshapegradients_1/Mul_1_grad/Sum_1gradients_1/Mul_1_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/Mul_1_grad/tuple/group_depsNoOp^gradients_1/Mul_1_grad/Reshape!^gradients_1/Mul_1_grad/Reshape_1
�
/gradients_1/Mul_1_grad/tuple/control_dependencyIdentitygradients_1/Mul_1_grad/Reshape(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/Mul_1_grad/Reshape
�
1gradients_1/Mul_1_grad/tuple/control_dependency_1Identity gradients_1/Mul_1_grad/Reshape_1(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Mul_1_grad/Reshape_1
�
gradients_1/AddN_5AddN3gradients_1/truediv_4_grad/tuple/control_dependencygradients_1/Sum_3_grad/Tile*
N*
T0*5
_class+
)'loc:@gradients_1/truediv_4_grad/Reshape
E
gradients_1/Mul_2_grad/ShapeShapeadd_6*
T0*
out_type0
Q
gradients_1/Mul_2_grad/Shape_1Shapestrided_slice_9*
T0*
out_type0
�
,gradients_1/Mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Mul_2_grad/Shapegradients_1/Mul_2_grad/Shape_1*
T0
O
gradients_1/Mul_2_grad/MulMulgradients_1/AddN_5strided_slice_9*
T0
�
gradients_1/Mul_2_grad/SumSumgradients_1/Mul_2_grad/Mul,gradients_1/Mul_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/Mul_2_grad/ReshapeReshapegradients_1/Mul_2_grad/Sumgradients_1/Mul_2_grad/Shape*
T0*
Tshape0
G
gradients_1/Mul_2_grad/Mul_1Muladd_6gradients_1/AddN_5*
T0
�
gradients_1/Mul_2_grad/Sum_1Sumgradients_1/Mul_2_grad/Mul_1.gradients_1/Mul_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/Mul_2_grad/Reshape_1Reshapegradients_1/Mul_2_grad/Sum_1gradients_1/Mul_2_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/Mul_2_grad/tuple/group_depsNoOp^gradients_1/Mul_2_grad/Reshape!^gradients_1/Mul_2_grad/Reshape_1
�
/gradients_1/Mul_2_grad/tuple/control_dependencyIdentitygradients_1/Mul_2_grad/Reshape(^gradients_1/Mul_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/Mul_2_grad/Reshape
�
1gradients_1/Mul_2_grad/tuple/control_dependency_1Identity gradients_1/Mul_2_grad/Reshape_1(^gradients_1/Mul_2_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Mul_2_grad/Reshape_1
�
gradients_1/AddN_6AddN3gradients_1/truediv_5_grad/tuple/control_dependencygradients_1/Sum_4_grad/Tile*
T0*5
_class+
)'loc:@gradients_1/truediv_5_grad/Reshape*
N
E
gradients_1/Mul_3_grad/ShapeShapeadd_7*
T0*
out_type0
R
gradients_1/Mul_3_grad/Shape_1Shapestrided_slice_10*
T0*
out_type0
�
,gradients_1/Mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Mul_3_grad/Shapegradients_1/Mul_3_grad/Shape_1*
T0
P
gradients_1/Mul_3_grad/MulMulgradients_1/AddN_6strided_slice_10*
T0
�
gradients_1/Mul_3_grad/SumSumgradients_1/Mul_3_grad/Mul,gradients_1/Mul_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients_1/Mul_3_grad/ReshapeReshapegradients_1/Mul_3_grad/Sumgradients_1/Mul_3_grad/Shape*
T0*
Tshape0
G
gradients_1/Mul_3_grad/Mul_1Muladd_7gradients_1/AddN_6*
T0
�
gradients_1/Mul_3_grad/Sum_1Sumgradients_1/Mul_3_grad/Mul_1.gradients_1/Mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/Mul_3_grad/Reshape_1Reshapegradients_1/Mul_3_grad/Sum_1gradients_1/Mul_3_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/Mul_3_grad/tuple/group_depsNoOp^gradients_1/Mul_3_grad/Reshape!^gradients_1/Mul_3_grad/Reshape_1
�
/gradients_1/Mul_3_grad/tuple/control_dependencyIdentitygradients_1/Mul_3_grad/Reshape(^gradients_1/Mul_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/Mul_3_grad/Reshape
�
1gradients_1/Mul_3_grad/tuple/control_dependency_1Identity gradients_1/Mul_3_grad/Reshape_1(^gradients_1/Mul_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Mul_3_grad/Reshape_1
G
gradients_1/add_5_grad/ShapeShapeSoftmax*
T0*
out_type0
I
gradients_1/add_5_grad/Shape_1Shapeadd_5/y*
T0*
out_type0
�
,gradients_1/add_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_5_grad/Shapegradients_1/add_5_grad/Shape_1*
T0
�
gradients_1/add_5_grad/SumSum/gradients_1/Mul_1_grad/tuple/control_dependency,gradients_1/add_5_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients_1/add_5_grad/ReshapeReshapegradients_1/add_5_grad/Sumgradients_1/add_5_grad/Shape*
T0*
Tshape0
�
gradients_1/add_5_grad/Sum_1Sum/gradients_1/Mul_1_grad/tuple/control_dependency.gradients_1/add_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/add_5_grad/Reshape_1Reshapegradients_1/add_5_grad/Sum_1gradients_1/add_5_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/add_5_grad/tuple/group_depsNoOp^gradients_1/add_5_grad/Reshape!^gradients_1/add_5_grad/Reshape_1
�
/gradients_1/add_5_grad/tuple/control_dependencyIdentitygradients_1/add_5_grad/Reshape(^gradients_1/add_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_5_grad/Reshape
�
1gradients_1/add_5_grad/tuple/control_dependency_1Identity gradients_1/add_5_grad/Reshape_1(^gradients_1/add_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_5_grad/Reshape_1
I
gradients_1/add_6_grad/ShapeShape	Softmax_1*
T0*
out_type0
I
gradients_1/add_6_grad/Shape_1Shapeadd_6/y*
T0*
out_type0
�
,gradients_1/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_6_grad/Shapegradients_1/add_6_grad/Shape_1*
T0
�
gradients_1/add_6_grad/SumSum/gradients_1/Mul_2_grad/tuple/control_dependency,gradients_1/add_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/add_6_grad/ReshapeReshapegradients_1/add_6_grad/Sumgradients_1/add_6_grad/Shape*
T0*
Tshape0
�
gradients_1/add_6_grad/Sum_1Sum/gradients_1/Mul_2_grad/tuple/control_dependency.gradients_1/add_6_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
 gradients_1/add_6_grad/Reshape_1Reshapegradients_1/add_6_grad/Sum_1gradients_1/add_6_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/add_6_grad/tuple/group_depsNoOp^gradients_1/add_6_grad/Reshape!^gradients_1/add_6_grad/Reshape_1
�
/gradients_1/add_6_grad/tuple/control_dependencyIdentitygradients_1/add_6_grad/Reshape(^gradients_1/add_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_6_grad/Reshape
�
1gradients_1/add_6_grad/tuple/control_dependency_1Identity gradients_1/add_6_grad/Reshape_1(^gradients_1/add_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_6_grad/Reshape_1
I
gradients_1/add_7_grad/ShapeShape	Softmax_2*
T0*
out_type0
I
gradients_1/add_7_grad/Shape_1Shapeadd_7/y*
T0*
out_type0
�
,gradients_1/add_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_7_grad/Shapegradients_1/add_7_grad/Shape_1*
T0
�
gradients_1/add_7_grad/SumSum/gradients_1/Mul_3_grad/tuple/control_dependency,gradients_1/add_7_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
z
gradients_1/add_7_grad/ReshapeReshapegradients_1/add_7_grad/Sumgradients_1/add_7_grad/Shape*
T0*
Tshape0
�
gradients_1/add_7_grad/Sum_1Sum/gradients_1/Mul_3_grad/tuple/control_dependency.gradients_1/add_7_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/add_7_grad/Reshape_1Reshapegradients_1/add_7_grad/Sum_1gradients_1/add_7_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/add_7_grad/tuple/group_depsNoOp^gradients_1/add_7_grad/Reshape!^gradients_1/add_7_grad/Reshape_1
�
/gradients_1/add_7_grad/tuple/control_dependencyIdentitygradients_1/add_7_grad/Reshape(^gradients_1/add_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_7_grad/Reshape
�
1gradients_1/add_7_grad/tuple/control_dependency_1Identity gradients_1/add_7_grad/Reshape_1(^gradients_1/add_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_7_grad/Reshape_1
f
gradients_1/Softmax_grad/mulMul/gradients_1/add_5_grad/tuple/control_dependencySoftmax*
T0
a
.gradients_1/Softmax_grad/Sum/reduction_indicesConst*
dtype0*
valueB :
���������
�
gradients_1/Softmax_grad/SumSumgradients_1/Softmax_grad/mul.gradients_1/Softmax_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
{
gradients_1/Softmax_grad/subSub/gradients_1/add_5_grad/tuple/control_dependencygradients_1/Softmax_grad/Sum*
T0
U
gradients_1/Softmax_grad/mul_1Mulgradients_1/Softmax_grad/subSoftmax*
T0
j
gradients_1/Softmax_1_grad/mulMul/gradients_1/add_6_grad/tuple/control_dependency	Softmax_1*
T0
c
0gradients_1/Softmax_1_grad/Sum/reduction_indicesConst*
dtype0*
valueB :
���������
�
gradients_1/Softmax_1_grad/SumSumgradients_1/Softmax_1_grad/mul0gradients_1/Softmax_1_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(

gradients_1/Softmax_1_grad/subSub/gradients_1/add_6_grad/tuple/control_dependencygradients_1/Softmax_1_grad/Sum*
T0
[
 gradients_1/Softmax_1_grad/mul_1Mulgradients_1/Softmax_1_grad/sub	Softmax_1*
T0
j
gradients_1/Softmax_2_grad/mulMul/gradients_1/add_7_grad/tuple/control_dependency	Softmax_2*
T0
c
0gradients_1/Softmax_2_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
gradients_1/Softmax_2_grad/SumSumgradients_1/Softmax_2_grad/mul0gradients_1/Softmax_2_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0

gradients_1/Softmax_2_grad/subSub/gradients_1/add_7_grad/tuple/control_dependencygradients_1/Softmax_2_grad/Sum*
T0
[
 gradients_1/Softmax_2_grad/mul_1Mulgradients_1/Softmax_2_grad/sub	Softmax_2*
T0
V
&gradients_1/strided_slice_5_grad/ShapeShapeaction_probs*
T0*
out_type0
�
1gradients_1/strided_slice_5_grad/StridedSliceGradStridedSliceGrad&gradients_1/strided_slice_5_grad/Shapestrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2gradients_1/Softmax_grad/mul_1*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
V
&gradients_1/strided_slice_6_grad/ShapeShapeaction_probs*
T0*
out_type0
�
1gradients_1/strided_slice_6_grad/StridedSliceGradStridedSliceGrad&gradients_1/strided_slice_6_grad/Shapestrided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2 gradients_1/Softmax_1_grad/mul_1*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
V
&gradients_1/strided_slice_7_grad/ShapeShapeaction_probs*
T0*
out_type0
�
1gradients_1/strided_slice_7_grad/StridedSliceGradStridedSliceGrad&gradients_1/strided_slice_7_grad/Shapestrided_slice_7/stackstrided_slice_7/stack_1strided_slice_7/stack_2 gradients_1/Softmax_2_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
�
gradients_1/AddN_7AddN2gradients_1/strided_slice_21_grad/StridedSliceGrad2gradients_1/strided_slice_23_grad/StridedSliceGrad2gradients_1/strided_slice_25_grad/StridedSliceGrad2gradients_1/strided_slice_20_grad/StridedSliceGrad2gradients_1/strided_slice_22_grad/StridedSliceGrad2gradients_1/strided_slice_24_grad/StridedSliceGrad1gradients_1/strided_slice_5_grad/StridedSliceGrad1gradients_1/strided_slice_6_grad/StridedSliceGrad1gradients_1/strided_slice_7_grad/StridedSliceGrad*
N	*
T0*E
_class;
97loc:@gradients_1/strided_slice_21_grad/StridedSliceGrad
L
"gradients_1/action_probs_grad/RankConst*
value	B :*
dtype0
m
!gradients_1/action_probs_grad/modFloorModaction_probs/axis"gradients_1/action_probs_grad/Rank*
T0
S
#gradients_1/action_probs_grad/ShapeShapedense/MatMul*
T0*
out_type0
~
$gradients_1/action_probs_grad/ShapeNShapeNdense/MatMuldense_1/MatMuldense_2/MatMul*
N*
T0*
out_type0
�
*gradients_1/action_probs_grad/ConcatOffsetConcatOffset!gradients_1/action_probs_grad/mod$gradients_1/action_probs_grad/ShapeN&gradients_1/action_probs_grad/ShapeN:1&gradients_1/action_probs_grad/ShapeN:2*
N
�
#gradients_1/action_probs_grad/SliceSlicegradients_1/AddN_7*gradients_1/action_probs_grad/ConcatOffset$gradients_1/action_probs_grad/ShapeN*
T0*
Index0
�
%gradients_1/action_probs_grad/Slice_1Slicegradients_1/AddN_7,gradients_1/action_probs_grad/ConcatOffset:1&gradients_1/action_probs_grad/ShapeN:1*
T0*
Index0
�
%gradients_1/action_probs_grad/Slice_2Slicegradients_1/AddN_7,gradients_1/action_probs_grad/ConcatOffset:2&gradients_1/action_probs_grad/ShapeN:2*
T0*
Index0
�
.gradients_1/action_probs_grad/tuple/group_depsNoOp$^gradients_1/action_probs_grad/Slice&^gradients_1/action_probs_grad/Slice_1&^gradients_1/action_probs_grad/Slice_2
�
6gradients_1/action_probs_grad/tuple/control_dependencyIdentity#gradients_1/action_probs_grad/Slice/^gradients_1/action_probs_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients_1/action_probs_grad/Slice
�
8gradients_1/action_probs_grad/tuple/control_dependency_1Identity%gradients_1/action_probs_grad/Slice_1/^gradients_1/action_probs_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/action_probs_grad/Slice_1
�
8gradients_1/action_probs_grad/tuple/control_dependency_2Identity%gradients_1/action_probs_grad/Slice_2/^gradients_1/action_probs_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/action_probs_grad/Slice_2
�
$gradients_1/dense/MatMul_grad/MatMulMatMul6gradients_1/action_probs_grad/tuple/control_dependencydense/kernel/read*
transpose_a( *
transpose_b(*
T0
�
&gradients_1/dense/MatMul_grad/MatMul_1MatMul	Reshape_26gradients_1/action_probs_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
.gradients_1/dense/MatMul_grad/tuple/group_depsNoOp%^gradients_1/dense/MatMul_grad/MatMul'^gradients_1/dense/MatMul_grad/MatMul_1
�
6gradients_1/dense/MatMul_grad/tuple/control_dependencyIdentity$gradients_1/dense/MatMul_grad/MatMul/^gradients_1/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/dense/MatMul_grad/MatMul
�
8gradients_1/dense/MatMul_grad/tuple/control_dependency_1Identity&gradients_1/dense/MatMul_grad/MatMul_1/^gradients_1/dense/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/dense/MatMul_grad/MatMul_1
�
&gradients_1/dense_1/MatMul_grad/MatMulMatMul8gradients_1/action_probs_grad/tuple/control_dependency_1dense_1/kernel/read*
T0*
transpose_a( *
transpose_b(
�
(gradients_1/dense_1/MatMul_grad/MatMul_1MatMul	Reshape_28gradients_1/action_probs_grad/tuple/control_dependency_1*
transpose_b( *
T0*
transpose_a(
�
0gradients_1/dense_1/MatMul_grad/tuple/group_depsNoOp'^gradients_1/dense_1/MatMul_grad/MatMul)^gradients_1/dense_1/MatMul_grad/MatMul_1
�
8gradients_1/dense_1/MatMul_grad/tuple/control_dependencyIdentity&gradients_1/dense_1/MatMul_grad/MatMul1^gradients_1/dense_1/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/dense_1/MatMul_grad/MatMul
�
:gradients_1/dense_1/MatMul_grad/tuple/control_dependency_1Identity(gradients_1/dense_1/MatMul_grad/MatMul_11^gradients_1/dense_1/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/dense_1/MatMul_grad/MatMul_1
�
&gradients_1/dense_2/MatMul_grad/MatMulMatMul8gradients_1/action_probs_grad/tuple/control_dependency_2dense_2/kernel/read*
T0*
transpose_a( *
transpose_b(
�
(gradients_1/dense_2/MatMul_grad/MatMul_1MatMul	Reshape_28gradients_1/action_probs_grad/tuple/control_dependency_2*
T0*
transpose_a(*
transpose_b( 
�
0gradients_1/dense_2/MatMul_grad/tuple/group_depsNoOp'^gradients_1/dense_2/MatMul_grad/MatMul)^gradients_1/dense_2/MatMul_grad/MatMul_1
�
8gradients_1/dense_2/MatMul_grad/tuple/control_dependencyIdentity&gradients_1/dense_2/MatMul_grad/MatMul1^gradients_1/dense_2/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/dense_2/MatMul_grad/MatMul
�
:gradients_1/dense_2/MatMul_grad/tuple/control_dependency_1Identity(gradients_1/dense_2/MatMul_grad/MatMul_11^gradients_1/dense_2/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/dense_2/MatMul_grad/MatMul_1
�
gradients_1/AddN_8AddN@gradients_1/extrinsic_value/MatMul_grad/tuple/control_dependency@gradients_1/curiosity_value/MatMul_grad/tuple/control_dependency6gradients_1/dense/MatMul_grad/tuple/control_dependency8gradients_1/dense_1/MatMul_grad/tuple/control_dependency8gradients_1/dense_2/MatMul_grad/tuple/control_dependency*
T0*A
_class7
53loc:@gradients_1/extrinsic_value/MatMul_grad/MatMul*
N
X
 gradients_1/Reshape_2_grad/ShapeShapelstm/rnn/transpose_1*
T0*
out_type0
z
"gradients_1/Reshape_2_grad/ReshapeReshapegradients_1/AddN_8 gradients_1/Reshape_2_grad/Shape*
T0*
Tshape0
h
7gradients_1/lstm/rnn/transpose_1_grad/InvertPermutationInvertPermutationlstm/rnn/concat_2*
T0
�
/gradients_1/lstm/rnn/transpose_1_grad/transpose	Transpose"gradients_1/Reshape_2_grad/Reshape7gradients_1/lstm/rnn/transpose_1_grad/InvertPermutation*
Tperm0*
T0
�
`gradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3lstm/rnn/TensorArraylstm/rnn/while/Exit_2*'
_class
loc:@lstm/rnn/TensorArray*
sourcegradients_1
�
\gradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/gradient_flowIdentitylstm/rnn/while/Exit_2a^gradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*'
_class
loc:@lstm/rnn/TensorArray
�
fgradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3`gradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/TensorArrayGradV3lstm/rnn/TensorArrayStack/range/gradients_1/lstm/rnn/transpose_1_grad/transpose\gradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayGrad/gradient_flow*
T0
F
gradients_1/zeros_like_10	ZerosLikelstm/rnn/while/Exit_3*
T0
F
gradients_1/zeros_like_11	ZerosLikelstm/rnn/while/Exit_4*
T0
�
-gradients_1/lstm/rnn/while/Exit_2_grad/b_exitEnterfgradients_1/lstm/rnn/TensorArrayStack/TensorArrayGatherV3_grad/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant( *
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
-gradients_1/lstm/rnn/while/Exit_3_grad/b_exitEntergradients_1/zeros_like_10*
T0*
is_constant( *
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
-gradients_1/lstm/rnn/while/Exit_4_grad/b_exitEntergradients_1/zeros_like_11*
T0*
is_constant( *
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
1gradients_1/lstm/rnn/while/Switch_2_grad/b_switchMerge-gradients_1/lstm/rnn/while/Exit_2_grad/b_exit8gradients_1/lstm/rnn/while/Switch_2_grad_1/NextIteration*
N*
T0
�
1gradients_1/lstm/rnn/while/Switch_3_grad/b_switchMerge-gradients_1/lstm/rnn/while/Exit_3_grad/b_exit8gradients_1/lstm/rnn/while/Switch_3_grad_1/NextIteration*
T0*
N
�
1gradients_1/lstm/rnn/while/Switch_4_grad/b_switchMerge-gradients_1/lstm/rnn/while/Exit_4_grad/b_exit8gradients_1/lstm/rnn/while/Switch_4_grad_1/NextIteration*
T0*
N
�
.gradients_1/lstm/rnn/while/Merge_2_grad/SwitchSwitch1gradients_1/lstm/rnn/while/Switch_2_grad/b_switchgradients_1/b_count_2*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_2_grad/b_switch
q
8gradients_1/lstm/rnn/while/Merge_2_grad/tuple/group_depsNoOp/^gradients_1/lstm/rnn/while/Merge_2_grad/Switch
�
@gradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependencyIdentity.gradients_1/lstm/rnn/while/Merge_2_grad/Switch9^gradients_1/lstm/rnn/while/Merge_2_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_2_grad/b_switch
�
Bgradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1Identity0gradients_1/lstm/rnn/while/Merge_2_grad/Switch:19^gradients_1/lstm/rnn/while/Merge_2_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_2_grad/b_switch
�
.gradients_1/lstm/rnn/while/Merge_3_grad/SwitchSwitch1gradients_1/lstm/rnn/while/Switch_3_grad/b_switchgradients_1/b_count_2*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_3_grad/b_switch
q
8gradients_1/lstm/rnn/while/Merge_3_grad/tuple/group_depsNoOp/^gradients_1/lstm/rnn/while/Merge_3_grad/Switch
�
@gradients_1/lstm/rnn/while/Merge_3_grad/tuple/control_dependencyIdentity.gradients_1/lstm/rnn/while/Merge_3_grad/Switch9^gradients_1/lstm/rnn/while/Merge_3_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_3_grad/b_switch
�
Bgradients_1/lstm/rnn/while/Merge_3_grad/tuple/control_dependency_1Identity0gradients_1/lstm/rnn/while/Merge_3_grad/Switch:19^gradients_1/lstm/rnn/while/Merge_3_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_3_grad/b_switch
�
.gradients_1/lstm/rnn/while/Merge_4_grad/SwitchSwitch1gradients_1/lstm/rnn/while/Switch_4_grad/b_switchgradients_1/b_count_2*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_4_grad/b_switch
q
8gradients_1/lstm/rnn/while/Merge_4_grad/tuple/group_depsNoOp/^gradients_1/lstm/rnn/while/Merge_4_grad/Switch
�
@gradients_1/lstm/rnn/while/Merge_4_grad/tuple/control_dependencyIdentity.gradients_1/lstm/rnn/while/Merge_4_grad/Switch9^gradients_1/lstm/rnn/while/Merge_4_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_4_grad/b_switch
�
Bgradients_1/lstm/rnn/while/Merge_4_grad/tuple/control_dependency_1Identity0gradients_1/lstm/rnn/while/Merge_4_grad/Switch:19^gradients_1/lstm/rnn/while/Merge_4_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_4_grad/b_switch

,gradients_1/lstm/rnn/while/Enter_2_grad/ExitExit@gradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependency*
T0

,gradients_1/lstm/rnn/while/Enter_3_grad/ExitExit@gradients_1/lstm/rnn/while/Merge_3_grad/tuple/control_dependency*
T0

,gradients_1/lstm/rnn/while/Enter_4_grad/ExitExit@gradients_1/lstm/rnn/while/Merge_4_grad/tuple/control_dependency*
T0
�
egradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3kgradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterBgradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2*
sourcegradients_1
�
kgradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEnterlstm/rnn/TensorArray*
T0*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
agradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/gradient_flowIdentityBgradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1f^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*7
_class-
+)loc:@lstm/rnn/while/basic_lstm_cell/Mul_2
�
Ugradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3TensorArrayReadV3egradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/TensorArrayGradV3`gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2agradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayGrad/gradient_flow*
dtype0
�
[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/ConstConst*,
_class"
 loc:@lstm/rnn/while/Identity_1*
valueB :
���������*
dtype0
�
[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/f_accStackV2[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/Const*,
_class"
 loc:@lstm/rnn/while/Identity_1*

stack_name *
	elem_type0
�
[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/EnterEnter[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
agradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPushV2StackPushV2[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/Enterlstm/rnn/while/Identity_1^gradients_1/Add*
T0*
swap_memory( 
�
`gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2
StackPopV2fgradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
fgradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2/EnterEnter[gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/f_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant(
�
\gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/b_syncControlTriggera^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2W^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2Y^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1U^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2W^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1K^gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2W^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2Y^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1E^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2G^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2W^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2Y^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1E^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2G^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2U^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2W^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1C^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2E^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2I^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2K^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1
�
Tgradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/group_depsNoOpC^gradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1V^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3
�
\gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependencyIdentityUgradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3U^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/group_deps*
T0*h
_class^
\Zloc:@gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3
�
^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependency_1IdentityBgradients_1/lstm/rnn/while/Merge_2_grad/tuple/control_dependency_1U^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_2_grad/b_switch
�
gradients_1/AddN_9AddNBgradients_1/lstm/rnn/while/Merge_4_grad/tuple/control_dependency_1\gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependency*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_4_grad/b_switch*
N
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/ShapeShape%lstm/rnn/while/basic_lstm_cell/Tanh_1*
T0*
out_type0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1Shape(lstm/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
out_type0
�
Kgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsVgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2Xgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/ConstConst*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape*
valueB :
���������*
dtype0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_accStackV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Const*

stack_name *
	elem_type0*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Wgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2StackPushV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Enter;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape^gradients_1/Add*
T0*
swap_memory( 
�
Vgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2
StackPopV2\gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
\gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Const_1Const*
dtype0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1*
valueB :
���������
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc_1StackV2Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Const_1*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1*

stack_name *
	elem_type0
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Enter_1EnterSgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ygradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/Enter_1=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Shape_1^gradients_1/Add*
T0*
swap_memory( 
�
Xgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients_1/Sub*
	elem_type0
�
^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterSgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/MulMulgradients_1/AddN_9Dgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2*
T0
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/ConstConst*
dtype0*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_2*
valueB :
���������
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/f_accStackV2?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/Const*

stack_name *
	elem_type0*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_2
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/EnterEnter?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPushV2StackPushV2?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/Enter(lstm/rnn/while/basic_lstm_cell/Sigmoid_2^gradients_1/Add*
T0*
swap_memory( 
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2
StackPopV2Jgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Jgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2/EnterEnter?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/SumSum9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/MulKgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/ReshapeReshape9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/SumVgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1MulFgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2gradients_1/AddN_9*
T0
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/ConstConst*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/Tanh_1*
valueB :
���������*
dtype0
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/f_accStackV2Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/Const*

stack_name *
	elem_type0*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/Tanh_1
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/EnterEnterAgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ggradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPushV2StackPushV2Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/Enter%lstm/rnn/while/basic_lstm_cell/Tanh_1^gradients_1/Add*
T0*
swap_memory( 
�
Fgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2
StackPopV2Lgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Lgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2/EnterEnterAgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Sum_1Sum;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1Mgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1Reshape;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Sum_1Xgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Fgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/group_depsNoOp>^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape@^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1
�
Ngradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependencyIdentity=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/ReshapeG^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape
�
Pgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependency_1Identity?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1G^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Reshape_1
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Tanh_1_grad/TanhGradTanhGradFgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul_1/StackPopV2Ngradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependency*
T0
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_2_grad/SigmoidGradSigmoidGradDgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/Mul/StackPopV2Pgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_2_grad/tuple/control_dependency_1*
T0
�
8gradients_1/lstm/rnn/while/Switch_2_grad_1/NextIterationNextIteration^gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_10AddNBgradients_1/lstm/rnn/while/Merge_3_grad/tuple/control_dependency_1?gradients_1/lstm/rnn/while/basic_lstm_cell/Tanh_1_grad/TanhGrad*
T0*D
_class:
86loc:@gradients_1/lstm/rnn/while/Switch_3_grad/b_switch*
N
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/ShapeShape"lstm/rnn/while/basic_lstm_cell/Mul*
T0*
out_type0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1Shape$lstm/rnn/while/basic_lstm_cell/Mul_1*
T0*
out_type0
�
Kgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgsBroadcastGradientArgsVgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2Xgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/ConstConst*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape*
valueB :
���������*
dtype0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_accStackV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Const*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape*

stack_name *
	elem_type0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Wgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2StackPushV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Enter;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape^gradients_1/Add*
T0*
swap_memory( 
�
Vgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2
StackPopV2\gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
\gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant(
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Const_1Const*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1*
valueB :
���������*
dtype0
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc_1StackV2Sgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Const_1*
	elem_type0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1*

stack_name 
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Enter_1EnterSgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ygradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Sgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/Enter_1=gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Shape_1^gradients_1/Add*
T0*
swap_memory( 
�
Xgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients_1/Sub*
	elem_type0
�
^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterSgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/SumSumgradients_1/AddN_10Kgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/ReshapeReshape9gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/SumVgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Sum_1Sumgradients_1/AddN_10Mgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1Reshape;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Sum_1Xgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Fgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/group_depsNoOp>^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape@^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1
�
Ngradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependencyIdentity=gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/ReshapeG^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape
�
Pgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency_1Identity?gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1G^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/Reshape_1
v
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/ShapeShapelstm/rnn/while/Identity_3*
T0*
out_type0
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1Shape&lstm/rnn/while/basic_lstm_cell/Sigmoid*
T0*
out_type0
�
Igradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsTgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2Vgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/ConstConst*L
_classB
@>loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape*
valueB :
���������*
dtype0
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_accStackV2Ogradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Const*

stack_name *
	elem_type0*L
_classB
@>loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/EnterEnterOgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *,

frame_namelstm/rnn/while/while_context*
T0*
is_constant(
�
Ugradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2StackPushV2Ogradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Enter9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape^gradients_1/Add*
swap_memory( *
T0
�
Tgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Zgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Zgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2/EnterEnterOgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Const_1Const*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1*
valueB :
���������*
dtype0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc_1StackV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Const_1*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1*

stack_name *
	elem_type0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Enter_1EnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Wgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/Enter_1;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Shape_1^gradients_1/Add*
swap_memory( *
T0
�
Vgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2\gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients_1/Sub*
	elem_type0
�
\gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
7gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/MulMulNgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependencyBgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2*
T0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/ConstConst*9
_class/
-+loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid*
valueB :
���������*
dtype0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/f_accStackV2=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/Const*9
_class/
-+loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid*

stack_name *
	elem_type0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/EnterEnter=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPushV2StackPushV2=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/Enter&lstm/rnn/while/basic_lstm_cell/Sigmoid^gradients_1/Add*
T0*
swap_memory( 
�
Bgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2
StackPopV2Hgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Hgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2/EnterEnter=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
7gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/SumSum7gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/MulIgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/ReshapeReshape7gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/SumTgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1MulDgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2Ngradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency*
T0
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/ConstConst*,
_class"
 loc:@lstm/rnn/while/Identity_3*
valueB :
���������*
dtype0
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/f_accStackV2?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/Const*
	elem_type0*,
_class"
 loc:@lstm/rnn/while/Identity_3*

stack_name 
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/EnterEnter?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPushV2StackPushV2?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/Enterlstm/rnn/while/Identity_3^gradients_1/Add*
swap_memory( *
T0
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2
StackPopV2Jgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Jgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/StackPopV2/EnterEnter?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Sum_1Sum9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul_1Kgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1Reshape9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Sum_1Vgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/group_depsNoOp<^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape>^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1
�
Lgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependencyIdentity;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/ReshapeE^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape
�
Ngradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependency_1Identity=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1E^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Reshape_1
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/ShapeShape(lstm/rnn/while/basic_lstm_cell/Sigmoid_1*
T0*
out_type0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1Shape#lstm/rnn/while/basic_lstm_cell/Tanh*
T0*
out_type0
�
Kgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsVgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2Xgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/ConstConst*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape*
valueB :
���������*
dtype0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_accStackV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Const*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape*

stack_name *
	elem_type0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Wgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2StackPushV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Enter;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape^gradients_1/Add*
T0*
swap_memory( 
�
Vgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2
StackPopV2\gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
\gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant(
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Const_1Const*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1*
valueB :
���������*
dtype0
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc_1StackV2Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Const_1*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1*

stack_name *
	elem_type0
�
Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Enter_1EnterSgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ygradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Sgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/Enter_1=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Shape_1^gradients_1/Add*
T0*
swap_memory( 
�
Xgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients_1/Sub*
	elem_type0
�
^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterSgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/f_acc_1*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant(
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/MulMulPgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency_1Dgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2*
T0
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/ConstConst*6
_class,
*(loc:@lstm/rnn/while/basic_lstm_cell/Tanh*
valueB :
���������*
dtype0
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/f_accStackV2?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/Const*6
_class,
*(loc:@lstm/rnn/while/basic_lstm_cell/Tanh*

stack_name *
	elem_type0
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/EnterEnter?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPushV2StackPushV2?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/Enter#lstm/rnn/while/basic_lstm_cell/Tanh^gradients_1/Add*
T0*
swap_memory( 
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2
StackPopV2Jgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Jgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2/EnterEnter?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/SumSum9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/MulKgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/ReshapeReshape9gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/SumVgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1MulFgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2Pgradients_1/lstm/rnn/while/basic_lstm_cell/Add_1_grad/tuple/control_dependency_1*
T0
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/ConstConst*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_1*
valueB :
���������*
dtype0
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/f_accStackV2Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/Const*;
_class1
/-loc:@lstm/rnn/while/basic_lstm_cell/Sigmoid_1*

stack_name *
	elem_type0
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/EnterEnterAgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ggradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPushV2StackPushV2Agradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/Enter(lstm/rnn/while/basic_lstm_cell/Sigmoid_1^gradients_1/Add*
T0*
swap_memory( 
�
Fgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2
StackPopV2Lgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Lgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2/EnterEnterAgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Sum_1Sum;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1Mgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1Reshape;gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Sum_1Xgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Fgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/group_depsNoOp>^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape@^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1
�
Ngradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependencyIdentity=gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/ReshapeG^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape
�
Pgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependency_1Identity?gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1G^gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Reshape_1
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_grad/SigmoidGradSigmoidGradBgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/Mul/StackPopV2Ngradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependency_1*
T0
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_1_grad/SigmoidGradSigmoidGradFgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul_1/StackPopV2Ngradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependency*
T0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Tanh_grad/TanhGradTanhGradDgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/Mul/StackPopV2Pgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_1_grad/tuple/control_dependency_1*
T0
�
8gradients_1/lstm/rnn/while/Switch_3_grad_1/NextIterationNextIterationLgradients_1/lstm/rnn/while/basic_lstm_cell/Mul_grad/tuple/control_dependency*
T0
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/ShapeShape&lstm/rnn/while/basic_lstm_cell/split:2*
T0*
out_type0
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1Shape&lstm/rnn/while/basic_lstm_cell/Const_2*
T0*
out_type0
�
Igradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgsBroadcastGradientArgsTgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2Vgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1*
T0
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/ConstConst*L
_classB
@>loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape*
valueB :
���������*
dtype0
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_accStackV2Ogradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Const*L
_classB
@>loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape*

stack_name *
	elem_type0
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/EnterEnterOgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Ugradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2StackPushV2Ogradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Enter9gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape^gradients_1/Add*
T0*
swap_memory( 
�
Tgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2
StackPopV2Zgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Zgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2/EnterEnterOgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Const_1Const*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1*
valueB :
���������*
dtype0
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc_1StackV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Const_1*
	elem_type0*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1*

stack_name 
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Enter_1EnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Wgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPushV2_1StackPushV2Qgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/Enter_1;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Shape_1^gradients_1/Add*
swap_memory( *
T0
�
Vgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1
StackPopV2\gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1/Enter^gradients_1/Sub*
	elem_type0
�
\gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1/EnterEnterQgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/f_acc_1*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
7gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/SumSumCgradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_grad/SigmoidGradIgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/ReshapeReshape7gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/SumTgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2*
T0*
Tshape0
�
9gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Sum_1SumCgradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_grad/SigmoidGradKgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1Reshape9gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Sum_1Vgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/BroadcastGradientArgs/StackPopV2_1*
T0*
Tshape0
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/group_depsNoOp<^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape>^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1
�
Lgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/control_dependencyIdentity;gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/ReshapeE^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape
�
Ngradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/control_dependency_1Identity=gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1E^gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/Reshape_1
�
<gradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concatConcatV2Egradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_1_grad/SigmoidGrad=gradients_1/lstm/rnn/while/basic_lstm_cell/Tanh_grad/TanhGradLgradients_1/lstm/rnn/while/basic_lstm_cell/Add_grad/tuple/control_dependencyEgradients_1/lstm/rnn/while/basic_lstm_cell/Sigmoid_2_grad/SigmoidGradBgradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concat/Const*
T0*
N*

Tidx0
~
Bgradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concat/ConstConst^gradients_1/Sub*
value	B :*
dtype0
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGradBiasAddGrad<gradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concat*
data_formatNHWC*
T0
�
Hgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/group_depsNoOpD^gradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGrad=^gradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concat
�
Pgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependencyIdentity<gradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concatI^gradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/split_grad/concat
�
Rgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependency_1IdentityCgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGradI^gradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/group_deps*
T0*V
_classL
JHloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/BiasAddGrad
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMulMatMulPgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependencyCgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul/Enter*
T0*
transpose_a( *
transpose_b(
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul/EnterEnter$lstm/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
?gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1MatMulJgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2Pgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/ConstConst*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/concat*
valueB :
���������*
dtype0
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/f_accStackV2Egradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/Const*8
_class.
,*loc:@lstm/rnn/while/basic_lstm_cell/concat*

stack_name *
	elem_type0
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/EnterEnterEgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Kgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPushV2StackPushV2Egradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/Enter%lstm/rnn/while/basic_lstm_cell/concat^gradients_1/Add*
swap_memory( *
T0
�
Jgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2
StackPopV2Pgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Pgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/StackPopV2/EnterEnterEgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1/f_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant(
�
Ggradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/group_depsNoOp>^gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul@^gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependencyIdentity=gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMulH^gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependency_1Identity?gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1H^gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/MatMul_1
u
Cgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_accConst*
dtype0*
valueB�*    
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_1EnterCgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant( 
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_2MergeEgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_1Kgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/NextIteration*
T0*
N
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/SwitchSwitchEgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_2gradients_1/b_count_2*
T0
�
Agradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/AddAddFgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/Switch:1Rgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd_grad/tuple/control_dependency_1*
T0
�
Kgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/NextIterationNextIterationAgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/Add*
T0
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_3ExitDgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/Switch*
T0
x
<gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ConstConst^gradients_1/Sub*
dtype0*
value	B :
w
;gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/RankConst^gradients_1/Sub*
value	B :*
dtype0
�
:gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/modFloorMod<gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Const;gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Rank*
T0
�
<gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeShape lstm/rnn/while/TensorArrayReadV3*
T0*
out_type0
�
=gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeNShapeNHgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2Jgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1*
T0*
out_type0*
N
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/ConstConst*3
_class)
'%loc:@lstm/rnn/while/TensorArrayReadV3*
valueB :
���������*
dtype0
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_accStackV2Cgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Const*
	elem_type0*3
_class)
'%loc:@lstm/rnn/while/TensorArrayReadV3*

stack_name 
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/EnterEnterCgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Igradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2StackPushV2Cgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Enter lstm/rnn/while/TensorArrayReadV3^gradients_1/Add*
T0*
swap_memory( 
�
Hgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2
StackPopV2Ngradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2/Enter^gradients_1/Sub*
	elem_type0
�
Ngradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2/EnterEnterCgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Const_1Const*,
_class"
 loc:@lstm/rnn/while/Identity_4*
valueB :
���������*
dtype0
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc_1StackV2Egradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Const_1*

stack_name *
	elem_type0*,
_class"
 loc:@lstm/rnn/while/Identity_4
�
Egradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Enter_1EnterEgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc_1*
T0*
is_constant(*
parallel_iterations *,

frame_namelstm/rnn/while/while_context
�
Kgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPushV2_1StackPushV2Egradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/Enter_1lstm/rnn/while/Identity_4^gradients_1/Add*
T0*
swap_memory( 
�
Jgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1
StackPopV2Pgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1/Enter^gradients_1/Sub*
	elem_type0
�
Pgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/StackPopV2_1/EnterEnterEgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN/f_acc_1*
T0*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ConcatOffsetConcatOffset:gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/mod=gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN?gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN:1*
N
�
<gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/SliceSliceOgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependencyCgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ConcatOffset=gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN*
T0*
Index0
�
>gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1SliceOgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependencyEgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ConcatOffset:1?gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/ShapeN:1*
T0*
Index0
�
Ggradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/group_depsNoOp=^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice?^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1
�
Ogradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependencyIdentity<gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/SliceH^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice
�
Qgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependency_1Identity>gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1H^gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/Slice_1
y
Bgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_accConst*
valueB
��*    *
dtype0
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_1EnterBgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant( 
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_2MergeDgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_1Jgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/NextIteration*
N*
T0
�
Cgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/SwitchSwitchDgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_2gradients_1/b_count_2*
T0
�
@gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/AddAddEgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/Switch:1Qgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul_grad/tuple/control_dependency_1*
T0
�
Jgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/NextIterationNextIteration@gradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/Add*
T0
�
Dgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_3ExitCgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/Switch*
T0
�
Sgradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3Ygradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter[gradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1^gradients_1/Sub*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter*
sourcegradients_1
�
Ygradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEnterlstm/rnn/TensorArray_1*
T0*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter*
is_constant(*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context
�
[gradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1EnterClstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter*
is_constant(
�
Ogradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flowIdentity[gradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1T^gradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*9
_class/
-+loc:@lstm/rnn/while/TensorArrayReadV3/Enter
�
Ugradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3Sgradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3`gradients_1/lstm/rnn/while/TensorArrayWrite/TensorArrayWriteV3_grad/TensorArrayReadV3/StackPopV2Ogradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependencyOgradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flow*
T0
l
?gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_accConst*
valueB
 *    *
dtype0
�
Agradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Enter?gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc*
parallel_iterations *8

frame_name*(gradients_1/lstm/rnn/while/while_context*
T0*
is_constant( 
�
Agradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2MergeAgradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Ggradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIteration*
T0*
N
�
@gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/SwitchSwitchAgradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2gradients_1/b_count_2*
T0
�
=gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/AddAddBgradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch:1Ugradients_1/lstm/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3*
T0
�
Ggradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIterationNextIteration=gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/Add*
T0
�
Agradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3Exit@gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch*
T0
�
8gradients_1/lstm/rnn/while/Switch_4_grad_1/NextIterationNextIterationQgradients_1/lstm/rnn/while/basic_lstm_cell/concat_grad/tuple/control_dependency_1*
T0
�
vgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3lstm/rnn/TensorArray_1Agradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*)
_class
loc:@lstm/rnn/TensorArray_1*
sourcegradients_1
�
rgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flowIdentityAgradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3w^gradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*)
_class
loc:@lstm/rnn/TensorArray_1
�
hgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3TensorArrayGatherV3vgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3!lstm/rnn/TensorArrayUnstack/rangergradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flow*
dtype0*
element_shape:
�
egradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_depsNoOpi^gradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3B^gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3
�
mgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependencyIdentityhgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3f^gradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*{
_classq
omloc:@gradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3
�
ogradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency_1IdentityAgradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3f^gradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_1/lstm/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3
d
5gradients_1/lstm/rnn/transpose_grad/InvertPermutationInvertPermutationlstm/rnn/concat*
T0
�
-gradients_1/lstm/rnn/transpose_grad/transpose	Transposemgradients_1/lstm/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency5gradients_1/lstm/rnn/transpose_grad/InvertPermutation*
Tperm0*
T0
J
gradients_1/Reshape_grad/ShapeShapeconcat_1*
T0*
out_type0
�
 gradients_1/Reshape_grad/ReshapeReshape-gradients_1/lstm/rnn/transpose_grad/transposegradients_1/Reshape_grad/Shape*
T0*
Tshape0
H
gradients_1/concat_1_grad/RankConst*
value	B :*
dtype0
a
gradients_1/concat_1_grad/modFloorModconcat_1/axisgradients_1/concat_1_grad/Rank*
T0
\
gradients_1/concat_1_grad/ShapeShapemain_graph_0/hidden_1/Mul*
T0*
out_type0
o
 gradients_1/concat_1_grad/ShapeNShapeNmain_graph_0/hidden_1/Mulconcat*
T0*
out_type0*
N
�
&gradients_1/concat_1_grad/ConcatOffsetConcatOffsetgradients_1/concat_1_grad/mod gradients_1/concat_1_grad/ShapeN"gradients_1/concat_1_grad/ShapeN:1*
N
�
gradients_1/concat_1_grad/SliceSlice gradients_1/Reshape_grad/Reshape&gradients_1/concat_1_grad/ConcatOffset gradients_1/concat_1_grad/ShapeN*
T0*
Index0
�
!gradients_1/concat_1_grad/Slice_1Slice gradients_1/Reshape_grad/Reshape(gradients_1/concat_1_grad/ConcatOffset:1"gradients_1/concat_1_grad/ShapeN:1*
T0*
Index0
x
*gradients_1/concat_1_grad/tuple/group_depsNoOp ^gradients_1/concat_1_grad/Slice"^gradients_1/concat_1_grad/Slice_1
�
2gradients_1/concat_1_grad/tuple/control_dependencyIdentitygradients_1/concat_1_grad/Slice+^gradients_1/concat_1_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/concat_1_grad/Slice
�
4gradients_1/concat_1_grad/tuple/control_dependency_1Identity!gradients_1/concat_1_grad/Slice_1+^gradients_1/concat_1_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/concat_1_grad/Slice_1
q
0gradients_1/main_graph_0/hidden_1/Mul_grad/ShapeShapemain_graph_0/hidden_1/BiasAdd*
T0*
out_type0
s
2gradients_1/main_graph_0/hidden_1/Mul_grad/Shape_1Shapemain_graph_0/hidden_1/Sigmoid*
T0*
out_type0
�
@gradients_1/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs0gradients_1/main_graph_0/hidden_1/Mul_grad/Shape2gradients_1/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0
�
.gradients_1/main_graph_0/hidden_1/Mul_grad/MulMul2gradients_1/concat_1_grad/tuple/control_dependencymain_graph_0/hidden_1/Sigmoid*
T0
�
.gradients_1/main_graph_0/hidden_1/Mul_grad/SumSum.gradients_1/main_graph_0/hidden_1/Mul_grad/Mul@gradients_1/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
2gradients_1/main_graph_0/hidden_1/Mul_grad/ReshapeReshape.gradients_1/main_graph_0/hidden_1/Mul_grad/Sum0gradients_1/main_graph_0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
0gradients_1/main_graph_0/hidden_1/Mul_grad/Mul_1Mulmain_graph_0/hidden_1/BiasAdd2gradients_1/concat_1_grad/tuple/control_dependency*
T0
�
0gradients_1/main_graph_0/hidden_1/Mul_grad/Sum_1Sum0gradients_1/main_graph_0/hidden_1/Mul_grad/Mul_1Bgradients_1/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
4gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1Reshape0gradients_1/main_graph_0/hidden_1/Mul_grad/Sum_12gradients_1/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
;gradients_1/main_graph_0/hidden_1/Mul_grad/tuple/group_depsNoOp3^gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape5^gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1
�
Cgradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyIdentity2gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape<^gradients_1/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape
�
Egradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1Identity4gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1<^gradients_1/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1
�
:gradients_1/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_1/SigmoidEgradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_11AddNCgradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency:gradients_1/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGrad*
N*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape
~
:gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_11*
T0*
data_formatNHWC
�
?gradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_11;^gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
�
Ggradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_11@^gradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape
�
Igradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identity:gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad@^gradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
�
4gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMulMatMulGgradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_1/kernel/read*
T0*
transpose_a( *
transpose_b(
�
6gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_0/MulGgradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
>gradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/group_depsNoOp5^gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul7^gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1
�
Fgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencyIdentity4gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul?^gradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul
�
Hgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1Identity6gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1?^gradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1
q
0gradients_1/main_graph_0/hidden_0/Mul_grad/ShapeShapemain_graph_0/hidden_0/BiasAdd*
T0*
out_type0
s
2gradients_1/main_graph_0/hidden_0/Mul_grad/Shape_1Shapemain_graph_0/hidden_0/Sigmoid*
T0*
out_type0
�
@gradients_1/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs0gradients_1/main_graph_0/hidden_0/Mul_grad/Shape2gradients_1/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0
�
.gradients_1/main_graph_0/hidden_0/Mul_grad/MulMulFgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_0/Sigmoid*
T0
�
.gradients_1/main_graph_0/hidden_0/Mul_grad/SumSum.gradients_1/main_graph_0/hidden_0/Mul_grad/Mul@gradients_1/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
2gradients_1/main_graph_0/hidden_0/Mul_grad/ReshapeReshape.gradients_1/main_graph_0/hidden_0/Mul_grad/Sum0gradients_1/main_graph_0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
0gradients_1/main_graph_0/hidden_0/Mul_grad/Mul_1Mulmain_graph_0/hidden_0/BiasAddFgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
0gradients_1/main_graph_0/hidden_0/Mul_grad/Sum_1Sum0gradients_1/main_graph_0/hidden_0/Mul_grad/Mul_1Bgradients_1/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
4gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1Reshape0gradients_1/main_graph_0/hidden_0/Mul_grad/Sum_12gradients_1/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
;gradients_1/main_graph_0/hidden_0/Mul_grad/tuple/group_depsNoOp3^gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape5^gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1
�
Cgradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyIdentity2gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape<^gradients_1/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape
�
Egradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1Identity4gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1<^gradients_1/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1
�
:gradients_1/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_0/SigmoidEgradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_12AddNCgradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency:gradients_1/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape*
N
~
:gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_12*
data_formatNHWC*
T0
�
?gradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_12;^gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
�
Ggradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_12@^gradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape
�
Igradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identity:gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad@^gradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
�
4gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMulMatMulGgradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_0/kernel/read*
transpose_a( *
transpose_b(*
T0
�
6gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1MatMulnormalized_stateGgradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
>gradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/group_depsNoOp5^gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul7^gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1
�
Fgradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependencyIdentity4gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul?^gradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul
�
Hgradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1Identity6gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1?^gradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1
o
beta1_power/initial_valueConst*
dtype0*'
_class
loc:@curiosity_value/bias*
valueB
 *fff?
�
beta1_power
VariableV2*
dtype0*
	container *
shape: *
shared_name *'
_class
loc:@curiosity_value/bias
�
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(*
use_locking(
[
beta1_power/readIdentitybeta1_power*
T0*'
_class
loc:@curiosity_value/bias
o
beta2_power/initial_valueConst*
dtype0*'
_class
loc:@curiosity_value/bias*
valueB
 *w�?
�
beta2_power
VariableV2*
shape: *
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container 
�
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
[
beta2_power/readIdentitybeta2_power*
T0*'
_class
loc:@curiosity_value/bias
�
Cmain_graph_0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"�     */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0
�
9main_graph_0/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
3main_graph_0/hidden_0/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
!main_graph_0/hidden_0/kernel/Adam
VariableV2*
shape:
��*
shared_name */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
	container 
�
(main_graph_0/hidden_0/kernel/Adam/AssignAssign!main_graph_0/hidden_0/kernel/Adam3main_graph_0/hidden_0/kernel/Adam/Initializer/zeros*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(*
use_locking(
�
&main_graph_0/hidden_0/kernel/Adam/readIdentity!main_graph_0/hidden_0/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
Emain_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"�     */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0
�
;main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
5main_graph_0/hidden_0/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
#main_graph_0/hidden_0/kernel/Adam_1
VariableV2*
dtype0*
	container *
shape:
��*
shared_name */
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
*main_graph_0/hidden_0/kernel/Adam_1/AssignAssign#main_graph_0/hidden_0/kernel/Adam_15main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(
�
(main_graph_0/hidden_0/kernel/Adam_1/readIdentity#main_graph_0/hidden_0/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
1main_graph_0/hidden_0/bias/Adam/Initializer/zerosConst*
dtype0*
valueB�*    *-
_class#
!loc:@main_graph_0/hidden_0/bias
�
main_graph_0/hidden_0/bias/Adam
VariableV2*
dtype0*
	container *
shape:�*
shared_name *-
_class#
!loc:@main_graph_0/hidden_0/bias
�
&main_graph_0/hidden_0/bias/Adam/AssignAssignmain_graph_0/hidden_0/bias/Adam1main_graph_0/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
�
$main_graph_0/hidden_0/bias/Adam/readIdentitymain_graph_0/hidden_0/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
�
3main_graph_0/hidden_0/bias/Adam_1/Initializer/zerosConst*
dtype0*
valueB�*    *-
_class#
!loc:@main_graph_0/hidden_0/bias
�
!main_graph_0/hidden_0/bias/Adam_1
VariableV2*
shared_name *-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0*
	container *
shape:�
�
(main_graph_0/hidden_0/bias/Adam_1/AssignAssign!main_graph_0/hidden_0/bias/Adam_13main_graph_0/hidden_0/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
�
&main_graph_0/hidden_0/bias/Adam_1/readIdentity!main_graph_0/hidden_0/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
�
Cmain_graph_0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0
�
9main_graph_0/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0
�
3main_graph_0/hidden_1/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
!main_graph_0/hidden_1/kernel/Adam
VariableV2*
shape:
��*
shared_name */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
	container 
�
(main_graph_0/hidden_1/kernel/Adam/AssignAssign!main_graph_0/hidden_1/kernel/Adam3main_graph_0/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(
�
&main_graph_0/hidden_1/kernel/Adam/readIdentity!main_graph_0/hidden_1/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
Emain_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0
�
;main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0
�
5main_graph_0/hidden_1/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
#main_graph_0/hidden_1/kernel/Adam_1
VariableV2*
shape:
��*
shared_name */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
	container 
�
*main_graph_0/hidden_1/kernel/Adam_1/AssignAssign#main_graph_0/hidden_1/kernel/Adam_15main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
(main_graph_0/hidden_1/kernel/Adam_1/readIdentity#main_graph_0/hidden_1/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
1main_graph_0/hidden_1/bias/Adam/Initializer/zerosConst*
valueB�*    *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0
�
main_graph_0/hidden_1/bias/Adam
VariableV2*-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0*
	container *
shape:�*
shared_name 
�
&main_graph_0/hidden_1/bias/Adam/AssignAssignmain_graph_0/hidden_1/bias/Adam1main_graph_0/hidden_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(
�
$main_graph_0/hidden_1/bias/Adam/readIdentitymain_graph_0/hidden_1/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
�
3main_graph_0/hidden_1/bias/Adam_1/Initializer/zerosConst*
valueB�*    *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0
�
!main_graph_0/hidden_1/bias/Adam_1
VariableV2*
shared_name *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0*
	container *
shape:�
�
(main_graph_0/hidden_1/bias/Adam_1/AssignAssign!main_graph_0/hidden_1/bias/Adam_13main_graph_0/hidden_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(
�
&main_graph_0/hidden_1/bias/Adam_1/readIdentity!main_graph_0/hidden_1/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
�
Flstm/rnn/basic_lstm_cell/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"�     *2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
dtype0
�
<lstm/rnn/basic_lstm_cell/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
dtype0
�
6lstm/rnn/basic_lstm_cell/kernel/Adam/Initializer/zerosFillFlstm/rnn/basic_lstm_cell/kernel/Adam/Initializer/zeros/shape_as_tensor<lstm/rnn/basic_lstm_cell/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
$lstm/rnn/basic_lstm_cell/kernel/Adam
VariableV2*
shape:
��*
shared_name *2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
dtype0*
	container 
�
+lstm/rnn/basic_lstm_cell/kernel/Adam/AssignAssign$lstm/rnn/basic_lstm_cell/kernel/Adam6lstm/rnn/basic_lstm_cell/kernel/Adam/Initializer/zeros*
use_locking(*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
validate_shape(
�
)lstm/rnn/basic_lstm_cell/kernel/Adam/readIdentity$lstm/rnn/basic_lstm_cell/kernel/Adam*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
Hlstm/rnn/basic_lstm_cell/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"�     *2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
>lstm/rnn/basic_lstm_cell/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
8lstm/rnn/basic_lstm_cell/kernel/Adam_1/Initializer/zerosFillHlstm/rnn/basic_lstm_cell/kernel/Adam_1/Initializer/zeros/shape_as_tensor>lstm/rnn/basic_lstm_cell/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
&lstm/rnn/basic_lstm_cell/kernel/Adam_1
VariableV2*
dtype0*
	container *
shape:
��*
shared_name *2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
-lstm/rnn/basic_lstm_cell/kernel/Adam_1/AssignAssign&lstm/rnn/basic_lstm_cell/kernel/Adam_18lstm/rnn/basic_lstm_cell/kernel/Adam_1/Initializer/zeros*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
validate_shape(*
use_locking(
�
+lstm/rnn/basic_lstm_cell/kernel/Adam_1/readIdentity&lstm/rnn/basic_lstm_cell/kernel/Adam_1*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel
�
4lstm/rnn/basic_lstm_cell/bias/Adam/Initializer/zerosConst*
valueB�*    *0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
dtype0
�
"lstm/rnn/basic_lstm_cell/bias/Adam
VariableV2*
shared_name *0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
dtype0*
	container *
shape:�
�
)lstm/rnn/basic_lstm_cell/bias/Adam/AssignAssign"lstm/rnn/basic_lstm_cell/bias/Adam4lstm/rnn/basic_lstm_cell/bias/Adam/Initializer/zeros*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
validate_shape(*
use_locking(
�
'lstm/rnn/basic_lstm_cell/bias/Adam/readIdentity"lstm/rnn/basic_lstm_cell/bias/Adam*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias
�
6lstm/rnn/basic_lstm_cell/bias/Adam_1/Initializer/zerosConst*
valueB�*    *0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
dtype0
�
$lstm/rnn/basic_lstm_cell/bias/Adam_1
VariableV2*
dtype0*
	container *
shape:�*
shared_name *0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias
�
+lstm/rnn/basic_lstm_cell/bias/Adam_1/AssignAssign$lstm/rnn/basic_lstm_cell/bias/Adam_16lstm/rnn/basic_lstm_cell/bias/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias
�
)lstm/rnn/basic_lstm_cell/bias/Adam_1/readIdentity$lstm/rnn/basic_lstm_cell/bias/Adam_1*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias
z
#dense/kernel/Adam/Initializer/zerosConst*
valueB	�*    *
_class
loc:@dense/kernel*
dtype0
�
dense/kernel/Adam
VariableV2*
dtype0*
	container *
shape:	�*
shared_name *
_class
loc:@dense/kernel
�
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
_
dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel
|
%dense/kernel/Adam_1/Initializer/zerosConst*
valueB	�*    *
_class
loc:@dense/kernel*
dtype0
�
dense/kernel/Adam_1
VariableV2*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container *
shape:	�
�
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense/kernel
c
dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel
~
%dense_1/kernel/Adam/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_1/kernel*
dtype0
�
dense_1/kernel/Adam
VariableV2*!
_class
loc:@dense_1/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
dense_1/kernel/Adam/AssignAssigndense_1/kernel/Adam%dense_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
e
dense_1/kernel/Adam/readIdentitydense_1/kernel/Adam*
T0*!
_class
loc:@dense_1/kernel
�
'dense_1/kernel/Adam_1/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_1/kernel*
dtype0
�
dense_1/kernel/Adam_1
VariableV2*
shape:	�*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
�
dense_1/kernel/Adam_1/AssignAssigndense_1/kernel/Adam_1'dense_1/kernel/Adam_1/Initializer/zeros*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(*
use_locking(
i
dense_1/kernel/Adam_1/readIdentitydense_1/kernel/Adam_1*
T0*!
_class
loc:@dense_1/kernel
~
%dense_2/kernel/Adam/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_2/kernel*
dtype0
�
dense_2/kernel/Adam
VariableV2*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container *
shape:	�
�
dense_2/kernel/Adam/AssignAssigndense_2/kernel/Adam%dense_2/kernel/Adam/Initializer/zeros*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(*
use_locking(
e
dense_2/kernel/Adam/readIdentitydense_2/kernel/Adam*
T0*!
_class
loc:@dense_2/kernel
�
'dense_2/kernel/Adam_1/Initializer/zerosConst*
dtype0*
valueB	�*    *!
_class
loc:@dense_2/kernel
�
dense_2/kernel/Adam_1
VariableV2*!
_class
loc:@dense_2/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
dense_2/kernel/Adam_1/AssignAssigndense_2/kernel/Adam_1'dense_2/kernel/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_2/kernel
i
dense_2/kernel/Adam_1/readIdentitydense_2/kernel/Adam_1*
T0*!
_class
loc:@dense_2/kernel
�
-extrinsic_value/kernel/Adam/Initializer/zerosConst*
valueB	�*    *)
_class
loc:@extrinsic_value/kernel*
dtype0
�
extrinsic_value/kernel/Adam
VariableV2*)
_class
loc:@extrinsic_value/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
"extrinsic_value/kernel/Adam/AssignAssignextrinsic_value/kernel/Adam-extrinsic_value/kernel/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel
}
 extrinsic_value/kernel/Adam/readIdentityextrinsic_value/kernel/Adam*
T0*)
_class
loc:@extrinsic_value/kernel
�
/extrinsic_value/kernel/Adam_1/Initializer/zerosConst*
valueB	�*    *)
_class
loc:@extrinsic_value/kernel*
dtype0
�
extrinsic_value/kernel/Adam_1
VariableV2*
shared_name *)
_class
loc:@extrinsic_value/kernel*
dtype0*
	container *
shape:	�
�
$extrinsic_value/kernel/Adam_1/AssignAssignextrinsic_value/kernel/Adam_1/extrinsic_value/kernel/Adam_1/Initializer/zeros*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(*
use_locking(
�
"extrinsic_value/kernel/Adam_1/readIdentityextrinsic_value/kernel/Adam_1*
T0*)
_class
loc:@extrinsic_value/kernel
�
+extrinsic_value/bias/Adam/Initializer/zerosConst*
dtype0*
valueB*    *'
_class
loc:@extrinsic_value/bias
�
extrinsic_value/bias/Adam
VariableV2*
shape:*
shared_name *'
_class
loc:@extrinsic_value/bias*
dtype0*
	container 
�
 extrinsic_value/bias/Adam/AssignAssignextrinsic_value/bias/Adam+extrinsic_value/bias/Adam/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
w
extrinsic_value/bias/Adam/readIdentityextrinsic_value/bias/Adam*
T0*'
_class
loc:@extrinsic_value/bias
�
-extrinsic_value/bias/Adam_1/Initializer/zerosConst*
valueB*    *'
_class
loc:@extrinsic_value/bias*
dtype0
�
extrinsic_value/bias/Adam_1
VariableV2*
shared_name *'
_class
loc:@extrinsic_value/bias*
dtype0*
	container *
shape:
�
"extrinsic_value/bias/Adam_1/AssignAssignextrinsic_value/bias/Adam_1-extrinsic_value/bias/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias
{
 extrinsic_value/bias/Adam_1/readIdentityextrinsic_value/bias/Adam_1*
T0*'
_class
loc:@extrinsic_value/bias
�
-curiosity_value/kernel/Adam/Initializer/zerosConst*
valueB	�*    *)
_class
loc:@curiosity_value/kernel*
dtype0
�
curiosity_value/kernel/Adam
VariableV2*
dtype0*
	container *
shape:	�*
shared_name *)
_class
loc:@curiosity_value/kernel
�
"curiosity_value/kernel/Adam/AssignAssigncuriosity_value/kernel/Adam-curiosity_value/kernel/Adam/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
}
 curiosity_value/kernel/Adam/readIdentitycuriosity_value/kernel/Adam*
T0*)
_class
loc:@curiosity_value/kernel
�
/curiosity_value/kernel/Adam_1/Initializer/zerosConst*
valueB	�*    *)
_class
loc:@curiosity_value/kernel*
dtype0
�
curiosity_value/kernel/Adam_1
VariableV2*)
_class
loc:@curiosity_value/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
$curiosity_value/kernel/Adam_1/AssignAssigncuriosity_value/kernel/Adam_1/curiosity_value/kernel/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel
�
"curiosity_value/kernel/Adam_1/readIdentitycuriosity_value/kernel/Adam_1*
T0*)
_class
loc:@curiosity_value/kernel
�
+curiosity_value/bias/Adam/Initializer/zerosConst*
valueB*    *'
_class
loc:@curiosity_value/bias*
dtype0
�
curiosity_value/bias/Adam
VariableV2*'
_class
loc:@curiosity_value/bias*
dtype0*
	container *
shape:*
shared_name 
�
 curiosity_value/bias/Adam/AssignAssigncuriosity_value/bias/Adam+curiosity_value/bias/Adam/Initializer/zeros*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(*
use_locking(
w
curiosity_value/bias/Adam/readIdentitycuriosity_value/bias/Adam*
T0*'
_class
loc:@curiosity_value/bias
�
-curiosity_value/bias/Adam_1/Initializer/zerosConst*
valueB*    *'
_class
loc:@curiosity_value/bias*
dtype0
�
curiosity_value/bias/Adam_1
VariableV2*
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container *
shape:
�
"curiosity_value/bias/Adam_1/AssignAssigncuriosity_value/bias/Adam_1-curiosity_value/bias/Adam_1/Initializer/zeros*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(*
use_locking(
{
 curiosity_value/bias/Adam_1/readIdentitycuriosity_value/bias/Adam_1*
T0*'
_class
loc:@curiosity_value/bias
7

Adam/beta1Const*
valueB
 *fff?*
dtype0
7

Adam/beta2Const*
valueB
 *w�?*
dtype0
9
Adam/epsilonConst*
valueB
 *w�+2*
dtype0
�
2Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_0/kernel!main_graph_0/hidden_0/kernel/Adam#main_graph_0/hidden_0/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonHgradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
use_nesterov( *
use_locking( 
�
0Adam/update_main_graph_0/hidden_0/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_0/biasmain_graph_0/hidden_0/bias/Adam!main_graph_0/hidden_0/bias/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonIgradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
use_nesterov( 
�
2Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_1/kernel!main_graph_0/hidden_1/kernel/Adam#main_graph_0/hidden_1/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonHgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
0Adam/update_main_graph_0/hidden_1/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_1/biasmain_graph_0/hidden_1/bias/Adam!main_graph_0/hidden_1/bias/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonIgradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
�
5Adam/update_lstm/rnn/basic_lstm_cell/kernel/ApplyAdam	ApplyAdamlstm/rnn/basic_lstm_cell/kernel$lstm/rnn/basic_lstm_cell/kernel/Adam&lstm/rnn/basic_lstm_cell/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonDgradients_1/lstm/rnn/while/basic_lstm_cell/MatMul/Enter_grad/b_acc_3*
use_locking( *
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
use_nesterov( 
�
3Adam/update_lstm/rnn/basic_lstm_cell/bias/ApplyAdam	ApplyAdamlstm/rnn/basic_lstm_cell/bias"lstm/rnn/basic_lstm_cell/bias/Adam$lstm/rnn/basic_lstm_cell/bias/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonEgradients_1/lstm/rnn/while/basic_lstm_cell/BiasAdd/Enter_grad/b_acc_3*
use_nesterov( *
use_locking( *
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias
�
"Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilon8gradients_1/dense/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense/kernel*
use_nesterov( 
�
$Adam/update_dense_1/kernel/ApplyAdam	ApplyAdamdense_1/kerneldense_1/kernel/Adamdense_1/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilon:gradients_1/dense_1/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*!
_class
loc:@dense_1/kernel
�
$Adam/update_dense_2/kernel/ApplyAdam	ApplyAdamdense_2/kerneldense_2/kernel/Adamdense_2/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilon:gradients_1/dense_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_2/kernel*
use_nesterov( 
�
,Adam/update_extrinsic_value/kernel/ApplyAdam	ApplyAdamextrinsic_value/kernelextrinsic_value/kernel/Adamextrinsic_value/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonBgradients_1/extrinsic_value/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*)
_class
loc:@extrinsic_value/kernel*
use_nesterov( 
�
*Adam/update_extrinsic_value/bias/ApplyAdam	ApplyAdamextrinsic_value/biasextrinsic_value/bias/Adamextrinsic_value/bias/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonCgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*'
_class
loc:@extrinsic_value/bias
�
,Adam/update_curiosity_value/kernel/ApplyAdam	ApplyAdamcuriosity_value/kernelcuriosity_value/kernel/Adamcuriosity_value/kernel/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonBgradients_1/curiosity_value/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*)
_class
loc:@curiosity_value/kernel*
use_nesterov( 
�
*Adam/update_curiosity_value/bias/ApplyAdam	ApplyAdamcuriosity_value/biascuriosity_value/bias/Adamcuriosity_value/bias/Adam_1beta1_power/readbeta2_power/readVariable/read
Adam/beta1
Adam/beta2Adam/epsilonCgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@curiosity_value/bias*
use_nesterov( 
�
Adam/mulMulbeta1_power/read
Adam/beta1+^Adam/update_curiosity_value/bias/ApplyAdam-^Adam/update_curiosity_value/kernel/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam%^Adam/update_dense_1/kernel/ApplyAdam%^Adam/update_dense_2/kernel/ApplyAdam+^Adam/update_extrinsic_value/bias/ApplyAdam-^Adam/update_extrinsic_value/kernel/ApplyAdam4^Adam/update_lstm/rnn/basic_lstm_cell/bias/ApplyAdam6^Adam/update_lstm/rnn/basic_lstm_cell/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam*
T0*'
_class
loc:@curiosity_value/bias
�
Adam/AssignAssignbeta1_powerAdam/mul*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(*
use_locking( 
�

Adam/mul_1Mulbeta2_power/read
Adam/beta2+^Adam/update_curiosity_value/bias/ApplyAdam-^Adam/update_curiosity_value/kernel/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam%^Adam/update_dense_1/kernel/ApplyAdam%^Adam/update_dense_2/kernel/ApplyAdam+^Adam/update_extrinsic_value/bias/ApplyAdam-^Adam/update_extrinsic_value/kernel/ApplyAdam4^Adam/update_lstm/rnn/basic_lstm_cell/bias/ApplyAdam6^Adam/update_lstm/rnn/basic_lstm_cell/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam*
T0*'
_class
loc:@curiosity_value/bias
�
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
validate_shape(*
use_locking( *
T0*'
_class
loc:@curiosity_value/bias
�
AdamNoOp^Adam/Assign^Adam/Assign_1+^Adam/update_curiosity_value/bias/ApplyAdam-^Adam/update_curiosity_value/kernel/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam%^Adam/update_dense_1/kernel/ApplyAdam%^Adam/update_dense_2/kernel/ApplyAdam+^Adam/update_extrinsic_value/bias/ApplyAdam-^Adam/update_extrinsic_value/kernel/ApplyAdam4^Adam/update_lstm/rnn/basic_lstm_cell/bias/ApplyAdam6^Adam/update_lstm/rnn/basic_lstm_cell/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam
\
!curiosity_next_vector_observationPlaceholder*
dtype0*
shape:����������
�
Ocuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB"�     *
dtype0
�
Ncuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB
 *    *
dtype0
�
Pcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB
 *��Q=*
dtype0
�
Ycuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
seed2�*
seed�$
�
Mcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mulMulYcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalPcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Icuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normalAddMcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mulNcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
,curiosity_vector_obs_encoder/hidden_0/kernel
VariableV2*
dtype0*
	container *
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
3curiosity_vector_obs_encoder/hidden_0/kernel/AssignAssign,curiosity_vector_obs_encoder/hidden_0/kernelIcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal*
validate_shape(*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
1curiosity_vector_obs_encoder/hidden_0/kernel/readIdentity,curiosity_vector_obs_encoder/hidden_0/kernel*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
<curiosity_vector_obs_encoder/hidden_0/bias/Initializer/zerosConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB�*    *
dtype0
�
*curiosity_vector_obs_encoder/hidden_0/bias
VariableV2*
dtype0*
	container *
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
1curiosity_vector_obs_encoder/hidden_0/bias/AssignAssign*curiosity_vector_obs_encoder/hidden_0/bias<curiosity_vector_obs_encoder/hidden_0/bias/Initializer/zeros*
validate_shape(*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
/curiosity_vector_obs_encoder/hidden_0/bias/readIdentity*curiosity_vector_obs_encoder/hidden_0/bias*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
,curiosity_vector_obs_encoder/hidden_0/MatMulMatMulvector_observation1curiosity_vector_obs_encoder/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b( 
�
-curiosity_vector_obs_encoder/hidden_0/BiasAddBiasAdd,curiosity_vector_obs_encoder/hidden_0/MatMul/curiosity_vector_obs_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
p
-curiosity_vector_obs_encoder/hidden_0/SigmoidSigmoid-curiosity_vector_obs_encoder/hidden_0/BiasAdd*
T0
�
)curiosity_vector_obs_encoder/hidden_0/MulMul-curiosity_vector_obs_encoder/hidden_0/BiasAdd-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0
�
Ocuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB"      *
dtype0
�
Ncuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB
 *    *
dtype0
�
Pcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*
dtype0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB
 *6��=
�
Ycuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
seed2�*
seed�$
�
Mcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mulMulYcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalPcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
Icuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normalAddMcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mulNcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
,curiosity_vector_obs_encoder/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
�
3curiosity_vector_obs_encoder/hidden_1/kernel/AssignAssign,curiosity_vector_obs_encoder/hidden_1/kernelIcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
1curiosity_vector_obs_encoder/hidden_1/kernel/readIdentity,curiosity_vector_obs_encoder/hidden_1/kernel*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
<curiosity_vector_obs_encoder/hidden_1/bias/Initializer/zerosConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
valueB�*    *
dtype0
�
*curiosity_vector_obs_encoder/hidden_1/bias
VariableV2*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container *
shape:�
�
1curiosity_vector_obs_encoder/hidden_1/bias/AssignAssign*curiosity_vector_obs_encoder/hidden_1/bias<curiosity_vector_obs_encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
/curiosity_vector_obs_encoder/hidden_1/bias/readIdentity*curiosity_vector_obs_encoder/hidden_1/bias*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
,curiosity_vector_obs_encoder/hidden_1/MatMulMatMul)curiosity_vector_obs_encoder/hidden_0/Mul1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_a( *
transpose_b( *
T0
�
-curiosity_vector_obs_encoder/hidden_1/BiasAddBiasAdd,curiosity_vector_obs_encoder/hidden_1/MatMul/curiosity_vector_obs_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
p
-curiosity_vector_obs_encoder/hidden_1/SigmoidSigmoid-curiosity_vector_obs_encoder/hidden_1/BiasAdd*
T0
�
)curiosity_vector_obs_encoder/hidden_1/MulMul-curiosity_vector_obs_encoder/hidden_1/BiasAdd-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0
�
.curiosity_vector_obs_encoder_1/hidden_0/MatMulMatMul!curiosity_next_vector_observation1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_a( *
transpose_b( *
T0
�
/curiosity_vector_obs_encoder_1/hidden_0/BiasAddBiasAdd.curiosity_vector_obs_encoder_1/hidden_0/MatMul/curiosity_vector_obs_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
t
/curiosity_vector_obs_encoder_1/hidden_0/SigmoidSigmoid/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd*
T0
�
+curiosity_vector_obs_encoder_1/hidden_0/MulMul/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0
�
.curiosity_vector_obs_encoder_1/hidden_1/MatMulMatMul+curiosity_vector_obs_encoder_1/hidden_0/Mul1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_a( *
transpose_b( *
T0
�
/curiosity_vector_obs_encoder_1/hidden_1/BiasAddBiasAdd.curiosity_vector_obs_encoder_1/hidden_1/MatMul/curiosity_vector_obs_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
t
/curiosity_vector_obs_encoder_1/hidden_1/SigmoidSigmoid/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd*
T0
�
+curiosity_vector_obs_encoder_1/hidden_1/MulMul/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0
>
concat_10/concat_dimConst*
value	B :*
dtype0
P
concat_10/concatIdentity)curiosity_vector_obs_encoder/hidden_1/Mul*
T0
>
concat_11/concat_dimConst*
value	B :*
dtype0
R
concat_11/concatIdentity+curiosity_vector_obs_encoder_1/hidden_1/Mul*
T0
8
concat_12/axisConst*
value	B :*
dtype0
g
	concat_12ConcatV2concat_10/concatconcat_11/concatconcat_12/axis*

Tidx0*
T0*
N
�
/dense_3/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_3/kernel*
valueB"      *
dtype0
}
-dense_3/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_3/kernel*
valueB
 *���*
dtype0
}
-dense_3/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_3/kernel*
valueB
 *��=*
dtype0
�
7dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_3/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_3/kernel*
dtype0*
seed2�*
seed�$
�
-dense_3/kernel/Initializer/random_uniform/subSub-dense_3/kernel/Initializer/random_uniform/max-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel
�
-dense_3/kernel/Initializer/random_uniform/mulMul7dense_3/kernel/Initializer/random_uniform/RandomUniform-dense_3/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_3/kernel
�
)dense_3/kernel/Initializer/random_uniformAdd-dense_3/kernel/Initializer/random_uniform/mul-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel
�
dense_3/kernel
VariableV2*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container *
shape:
��
�
dense_3/kernel/AssignAssigndense_3/kernel)dense_3/kernel/Initializer/random_uniform*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_3/kernel
[
dense_3/kernel/readIdentitydense_3/kernel*
T0*!
_class
loc:@dense_3/kernel
q
dense_3/bias/Initializer/zerosConst*
_class
loc:@dense_3/bias*
valueB�*    *
dtype0
~
dense_3/bias
VariableV2*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container *
shape:�
�
dense_3/bias/AssignAssigndense_3/biasdense_3/bias/Initializer/zeros*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense_3/bias
U
dense_3/bias/readIdentitydense_3/bias*
T0*
_class
loc:@dense_3/bias
g
dense_3/MatMulMatMul	concat_12dense_3/kernel/read*
T0*
transpose_a( *
transpose_b( 
]
dense_3/BiasAddBiasAdddense_3/MatMuldense_3/bias/read*
data_formatNHWC*
T0
4
dense_3/SigmoidSigmoiddense_3/BiasAdd*
T0
=
dense_3/MulMuldense_3/BiasAdddense_3/Sigmoid*
T0
�
/dense_4/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_4/kernel*
valueB"      *
dtype0
}
-dense_4/kernel/Initializer/random_uniform/minConst*
dtype0*!
_class
loc:@dense_4/kernel*
valueB
 *V��
}
-dense_4/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_4/kernel*
valueB
 *V�>*
dtype0
�
7dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_4/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_4/kernel*
dtype0*
seed2�*
seed�$
�
-dense_4/kernel/Initializer/random_uniform/subSub-dense_4/kernel/Initializer/random_uniform/max-dense_4/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_4/kernel
�
-dense_4/kernel/Initializer/random_uniform/mulMul7dense_4/kernel/Initializer/random_uniform/RandomUniform-dense_4/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_4/kernel
�
)dense_4/kernel/Initializer/random_uniformAdd-dense_4/kernel/Initializer/random_uniform/mul-dense_4/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_4/kernel
�
dense_4/kernel
VariableV2*
shape:	�*
shared_name *!
_class
loc:@dense_4/kernel*
dtype0*
	container 
�
dense_4/kernel/AssignAssigndense_4/kernel)dense_4/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
[
dense_4/kernel/readIdentitydense_4/kernel*
T0*!
_class
loc:@dense_4/kernel
p
dense_4/bias/Initializer/zerosConst*
_class
loc:@dense_4/bias*
valueB*    *
dtype0
}
dense_4/bias
VariableV2*
shape:*
shared_name *
_class
loc:@dense_4/bias*
dtype0*
	container 
�
dense_4/bias/AssignAssigndense_4/biasdense_4/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
U
dense_4/bias/readIdentitydense_4/bias*
T0*
_class
loc:@dense_4/bias
i
dense_4/MatMulMatMuldense_3/Muldense_4/kernel/read*
transpose_a( *
transpose_b( *
T0
]
dense_4/BiasAddBiasAdddense_4/MatMuldense_4/bias/read*
T0*
data_formatNHWC
4
dense_4/SoftmaxSoftmaxdense_4/BiasAdd*
T0
�
/dense_5/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_5/kernel*
valueB"      *
dtype0
}
-dense_5/kernel/Initializer/random_uniform/minConst*
dtype0*!
_class
loc:@dense_5/kernel*
valueB
 *V��
}
-dense_5/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_5/kernel*
valueB
 *V�>*
dtype0
�
7dense_5/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_5/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_5/kernel*
dtype0*
seed2�*
seed�$
�
-dense_5/kernel/Initializer/random_uniform/subSub-dense_5/kernel/Initializer/random_uniform/max-dense_5/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_5/kernel
�
-dense_5/kernel/Initializer/random_uniform/mulMul7dense_5/kernel/Initializer/random_uniform/RandomUniform-dense_5/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_5/kernel
�
)dense_5/kernel/Initializer/random_uniformAdd-dense_5/kernel/Initializer/random_uniform/mul-dense_5/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_5/kernel
�
dense_5/kernel
VariableV2*!
_class
loc:@dense_5/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
dense_5/kernel/AssignAssigndense_5/kernel)dense_5/kernel/Initializer/random_uniform*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_5/kernel
[
dense_5/kernel/readIdentitydense_5/kernel*
T0*!
_class
loc:@dense_5/kernel
p
dense_5/bias/Initializer/zerosConst*
_class
loc:@dense_5/bias*
valueB*    *
dtype0
}
dense_5/bias
VariableV2*
_class
loc:@dense_5/bias*
dtype0*
	container *
shape:*
shared_name 
�
dense_5/bias/AssignAssigndense_5/biasdense_5/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_5/bias*
validate_shape(
U
dense_5/bias/readIdentitydense_5/bias*
T0*
_class
loc:@dense_5/bias
i
dense_5/MatMulMatMuldense_3/Muldense_5/kernel/read*
T0*
transpose_a( *
transpose_b( 
]
dense_5/BiasAddBiasAdddense_5/MatMuldense_5/bias/read*
T0*
data_formatNHWC
4
dense_5/SoftmaxSoftmaxdense_5/BiasAdd*
T0
�
/dense_6/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_6/kernel*
valueB"      *
dtype0
}
-dense_6/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_6/kernel*
valueB
 *V��*
dtype0
}
-dense_6/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_6/kernel*
valueB
 *V�>*
dtype0
�
7dense_6/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_6/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_6/kernel*
dtype0*
seed2�*
seed�$
�
-dense_6/kernel/Initializer/random_uniform/subSub-dense_6/kernel/Initializer/random_uniform/max-dense_6/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_6/kernel
�
-dense_6/kernel/Initializer/random_uniform/mulMul7dense_6/kernel/Initializer/random_uniform/RandomUniform-dense_6/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_6/kernel
�
)dense_6/kernel/Initializer/random_uniformAdd-dense_6/kernel/Initializer/random_uniform/mul-dense_6/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_6/kernel
�
dense_6/kernel
VariableV2*
dtype0*
	container *
shape:	�*
shared_name *!
_class
loc:@dense_6/kernel
�
dense_6/kernel/AssignAssigndense_6/kernel)dense_6/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_6/kernel*
validate_shape(
[
dense_6/kernel/readIdentitydense_6/kernel*
T0*!
_class
loc:@dense_6/kernel
p
dense_6/bias/Initializer/zerosConst*
dtype0*
_class
loc:@dense_6/bias*
valueB*    
}
dense_6/bias
VariableV2*
dtype0*
	container *
shape:*
shared_name *
_class
loc:@dense_6/bias
�
dense_6/bias/AssignAssigndense_6/biasdense_6/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_6/bias*
validate_shape(
U
dense_6/bias/readIdentitydense_6/bias*
T0*
_class
loc:@dense_6/bias
i
dense_6/MatMulMatMuldense_3/Muldense_6/kernel/read*
transpose_a( *
transpose_b( *
T0
]
dense_6/BiasAddBiasAdddense_6/MatMuldense_6/bias/read*
T0*
data_formatNHWC
4
dense_6/SoftmaxSoftmaxdense_6/BiasAdd*
T0
8
concat_13/axisConst*
value	B :*
dtype0
v
	concat_13ConcatV2dense_4/Softmaxdense_5/Softmaxdense_6/Softmaxconcat_13/axis*

Tidx0*
T0*
N
5
add_27/yConst*
valueB
 *���.*
dtype0
-
add_27AddV2	concat_13add_27/y*
T0

Log_12Logadd_27*
T0

Neg_9NegLog_12*
T0
+
mul_11MulNeg_9StopGradient*
T0
B
Sum_15/reduction_indicesConst*
value	B :*
dtype0
U
Sum_15Summul_11Sum_15/reduction_indices*

Tidx0*
	keep_dims( *
T0
S
DynamicPartition_4DynamicPartitionSum_15Cast*
T0*
num_partitions
5
Const_4Const*
dtype0*
valueB: 
S
Mean_6MeanDynamicPartition_4:1Const_4*

Tidx0*
	keep_dims( *
T0
8
concat_14/axisConst*
value	B :*
dtype0
c
	concat_14ConcatV2concat_10/concatStopGradientconcat_14/axis*
T0*
N*

Tidx0
�
/dense_7/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_7/kernel*
valueB"	     *
dtype0
}
-dense_7/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_7/kernel*
valueB
 *~�۽*
dtype0
}
-dense_7/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_7/kernel*
valueB
 *~��=*
dtype0
�
7dense_7/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_7/kernel/Initializer/random_uniform/shape*
seed�$*
T0*!
_class
loc:@dense_7/kernel*
dtype0*
seed2�
�
-dense_7/kernel/Initializer/random_uniform/subSub-dense_7/kernel/Initializer/random_uniform/max-dense_7/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_7/kernel
�
-dense_7/kernel/Initializer/random_uniform/mulMul7dense_7/kernel/Initializer/random_uniform/RandomUniform-dense_7/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_7/kernel
�
)dense_7/kernel/Initializer/random_uniformAdd-dense_7/kernel/Initializer/random_uniform/mul-dense_7/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_7/kernel
�
dense_7/kernel
VariableV2*!
_class
loc:@dense_7/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
dense_7/kernel/AssignAssigndense_7/kernel)dense_7/kernel/Initializer/random_uniform*
T0*!
_class
loc:@dense_7/kernel*
validate_shape(*
use_locking(
[
dense_7/kernel/readIdentitydense_7/kernel*
T0*!
_class
loc:@dense_7/kernel
q
dense_7/bias/Initializer/zerosConst*
_class
loc:@dense_7/bias*
valueB�*    *
dtype0
~
dense_7/bias
VariableV2*
dtype0*
	container *
shape:�*
shared_name *
_class
loc:@dense_7/bias
�
dense_7/bias/AssignAssigndense_7/biasdense_7/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_7/bias*
validate_shape(
U
dense_7/bias/readIdentitydense_7/bias*
T0*
_class
loc:@dense_7/bias
g
dense_7/MatMulMatMul	concat_14dense_7/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_7/BiasAddBiasAdddense_7/MatMuldense_7/bias/read*
T0*
data_formatNHWC
4
dense_7/SigmoidSigmoiddense_7/BiasAdd*
T0
=
dense_7/MulMuldense_7/BiasAdddense_7/Sigmoid*
T0
�
/dense_8/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_8/kernel*
valueB"      *
dtype0
}
-dense_8/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_8/kernel*
valueB
 *׳ݽ*
dtype0
}
-dense_8/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_8/kernel*
valueB
 *׳�=*
dtype0
�
7dense_8/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_8/kernel/Initializer/random_uniform/shape*
dtype0*
seed2�*
seed�$*
T0*!
_class
loc:@dense_8/kernel
�
-dense_8/kernel/Initializer/random_uniform/subSub-dense_8/kernel/Initializer/random_uniform/max-dense_8/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_8/kernel
�
-dense_8/kernel/Initializer/random_uniform/mulMul7dense_8/kernel/Initializer/random_uniform/RandomUniform-dense_8/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_8/kernel
�
)dense_8/kernel/Initializer/random_uniformAdd-dense_8/kernel/Initializer/random_uniform/mul-dense_8/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_8/kernel
�
dense_8/kernel
VariableV2*!
_class
loc:@dense_8/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
dense_8/kernel/AssignAssigndense_8/kernel)dense_8/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_8/kernel*
validate_shape(
[
dense_8/kernel/readIdentitydense_8/kernel*
T0*!
_class
loc:@dense_8/kernel
q
dense_8/bias/Initializer/zerosConst*
_class
loc:@dense_8/bias*
valueB�*    *
dtype0
~
dense_8/bias
VariableV2*
_class
loc:@dense_8/bias*
dtype0*
	container *
shape:�*
shared_name 
�
dense_8/bias/AssignAssigndense_8/biasdense_8/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_8/bias*
validate_shape(
U
dense_8/bias/readIdentitydense_8/bias*
T0*
_class
loc:@dense_8/bias
i
dense_8/MatMulMatMuldense_7/Muldense_8/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_8/BiasAddBiasAdddense_8/MatMuldense_8/bias/read*
data_formatNHWC*
T0
T
SquaredDifference_4SquaredDifferencedense_8/BiasAddconcat_11/concat*
T0
B
Sum_16/reduction_indicesConst*
value	B :*
dtype0
b
Sum_16SumSquaredDifference_4Sum_16/reduction_indices*

Tidx0*
	keep_dims( *
T0
5
mul_12/xConst*
valueB
 *   ?*
dtype0
(
mul_12Mulmul_12/xSum_16*
T0
S
DynamicPartition_5DynamicPartitionmul_12Cast*
num_partitions*
T0
5
Const_5Const*
valueB: *
dtype0
S
Mean_7MeanDynamicPartition_5:1Const_5*

Tidx0*
	keep_dims( *
T0
5
mul_13/xConst*
valueB
 *��L>*
dtype0
(
mul_13Mulmul_13/xMean_7*
T0
5
mul_14/xConst*
valueB
 *��L?*
dtype0
(
mul_14Mulmul_14/xMean_6*
T0
(
add_28AddV2mul_13mul_14*
T0
5
mul_15/xConst*
valueB
 *   A*
dtype0
(
mul_15Mulmul_15/xadd_28*
T0
:
gradients_2/ShapeConst*
valueB *
dtype0
B
gradients_2/grad_ys_0Const*
valueB
 *  �?*
dtype0
]
gradients_2/FillFillgradients_2/Shapegradients_2/grad_ys_0*
T0*

index_type0
E
gradients_2/mul_15_grad/MulMulgradients_2/Filladd_28*
T0
I
gradients_2/mul_15_grad/Mul_1Mulgradients_2/Fillmul_15/x*
T0
n
(gradients_2/mul_15_grad/tuple/group_depsNoOp^gradients_2/mul_15_grad/Mul^gradients_2/mul_15_grad/Mul_1
�
0gradients_2/mul_15_grad/tuple/control_dependencyIdentitygradients_2/mul_15_grad/Mul)^gradients_2/mul_15_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_15_grad/Mul
�
2gradients_2/mul_15_grad/tuple/control_dependency_1Identitygradients_2/mul_15_grad/Mul_1)^gradients_2/mul_15_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_15_grad/Mul_1
e
(gradients_2/add_28_grad/tuple/group_depsNoOp3^gradients_2/mul_15_grad/tuple/control_dependency_1
�
0gradients_2/add_28_grad/tuple/control_dependencyIdentity2gradients_2/mul_15_grad/tuple/control_dependency_1)^gradients_2/add_28_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_15_grad/Mul_1
�
2gradients_2/add_28_grad/tuple/control_dependency_1Identity2gradients_2/mul_15_grad/tuple/control_dependency_1)^gradients_2/add_28_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_15_grad/Mul_1
e
gradients_2/mul_13_grad/MulMul0gradients_2/add_28_grad/tuple/control_dependencyMean_7*
T0
i
gradients_2/mul_13_grad/Mul_1Mul0gradients_2/add_28_grad/tuple/control_dependencymul_13/x*
T0
n
(gradients_2/mul_13_grad/tuple/group_depsNoOp^gradients_2/mul_13_grad/Mul^gradients_2/mul_13_grad/Mul_1
�
0gradients_2/mul_13_grad/tuple/control_dependencyIdentitygradients_2/mul_13_grad/Mul)^gradients_2/mul_13_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_13_grad/Mul
�
2gradients_2/mul_13_grad/tuple/control_dependency_1Identitygradients_2/mul_13_grad/Mul_1)^gradients_2/mul_13_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_13_grad/Mul_1
g
gradients_2/mul_14_grad/MulMul2gradients_2/add_28_grad/tuple/control_dependency_1Mean_6*
T0
k
gradients_2/mul_14_grad/Mul_1Mul2gradients_2/add_28_grad/tuple/control_dependency_1mul_14/x*
T0
n
(gradients_2/mul_14_grad/tuple/group_depsNoOp^gradients_2/mul_14_grad/Mul^gradients_2/mul_14_grad/Mul_1
�
0gradients_2/mul_14_grad/tuple/control_dependencyIdentitygradients_2/mul_14_grad/Mul)^gradients_2/mul_14_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_14_grad/Mul
�
2gradients_2/mul_14_grad/tuple/control_dependency_1Identitygradients_2/mul_14_grad/Mul_1)^gradients_2/mul_14_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_14_grad/Mul_1
S
%gradients_2/Mean_7_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients_2/Mean_7_grad/ReshapeReshape2gradients_2/mul_13_grad/tuple/control_dependency_1%gradients_2/Mean_7_grad/Reshape/shape*
T0*
Tshape0
U
gradients_2/Mean_7_grad/ShapeShapeDynamicPartition_5:1*
T0*
out_type0

gradients_2/Mean_7_grad/TileTilegradients_2/Mean_7_grad/Reshapegradients_2/Mean_7_grad/Shape*

Tmultiples0*
T0
W
gradients_2/Mean_7_grad/Shape_1ShapeDynamicPartition_5:1*
T0*
out_type0
H
gradients_2/Mean_7_grad/Shape_2Const*
valueB *
dtype0
K
gradients_2/Mean_7_grad/ConstConst*
valueB: *
dtype0
�
gradients_2/Mean_7_grad/ProdProdgradients_2/Mean_7_grad/Shape_1gradients_2/Mean_7_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_2/Mean_7_grad/Const_1Const*
valueB: *
dtype0
�
gradients_2/Mean_7_grad/Prod_1Prodgradients_2/Mean_7_grad/Shape_2gradients_2/Mean_7_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_2/Mean_7_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_2/Mean_7_grad/MaximumMaximumgradients_2/Mean_7_grad/Prod_1!gradients_2/Mean_7_grad/Maximum/y*
T0
t
 gradients_2/Mean_7_grad/floordivFloorDivgradients_2/Mean_7_grad/Prodgradients_2/Mean_7_grad/Maximum*
T0
n
gradients_2/Mean_7_grad/CastCast gradients_2/Mean_7_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_7_grad/truedivRealDivgradients_2/Mean_7_grad/Tilegradients_2/Mean_7_grad/Cast*
T0
S
%gradients_2/Mean_6_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients_2/Mean_6_grad/ReshapeReshape2gradients_2/mul_14_grad/tuple/control_dependency_1%gradients_2/Mean_6_grad/Reshape/shape*
T0*
Tshape0
U
gradients_2/Mean_6_grad/ShapeShapeDynamicPartition_4:1*
T0*
out_type0

gradients_2/Mean_6_grad/TileTilegradients_2/Mean_6_grad/Reshapegradients_2/Mean_6_grad/Shape*

Tmultiples0*
T0
W
gradients_2/Mean_6_grad/Shape_1ShapeDynamicPartition_4:1*
T0*
out_type0
H
gradients_2/Mean_6_grad/Shape_2Const*
dtype0*
valueB 
K
gradients_2/Mean_6_grad/ConstConst*
dtype0*
valueB: 
�
gradients_2/Mean_6_grad/ProdProdgradients_2/Mean_6_grad/Shape_1gradients_2/Mean_6_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_2/Mean_6_grad/Const_1Const*
valueB: *
dtype0
�
gradients_2/Mean_6_grad/Prod_1Prodgradients_2/Mean_6_grad/Shape_2gradients_2/Mean_6_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
K
!gradients_2/Mean_6_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_2/Mean_6_grad/MaximumMaximumgradients_2/Mean_6_grad/Prod_1!gradients_2/Mean_6_grad/Maximum/y*
T0
t
 gradients_2/Mean_6_grad/floordivFloorDivgradients_2/Mean_6_grad/Prodgradients_2/Mean_6_grad/Maximum*
T0
n
gradients_2/Mean_6_grad/CastCast gradients_2/Mean_6_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_6_grad/truedivRealDivgradients_2/Mean_6_grad/Tilegradients_2/Mean_6_grad/Cast*
T0
@
gradients_2/zeros_like	ZerosLikeDynamicPartition_5*
T0
Q
)gradients_2/DynamicPartition_5_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_2/DynamicPartition_5_grad/ConstConst*
valueB: *
dtype0
�
(gradients_2/DynamicPartition_5_grad/ProdProd)gradients_2/DynamicPartition_5_grad/Shape)gradients_2/DynamicPartition_5_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_2/DynamicPartition_5_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_2/DynamicPartition_5_grad/range/deltaConst*
value	B :*
dtype0
�
)gradients_2/DynamicPartition_5_grad/rangeRange/gradients_2/DynamicPartition_5_grad/range/start(gradients_2/DynamicPartition_5_grad/Prod/gradients_2/DynamicPartition_5_grad/range/delta*

Tidx0
�
+gradients_2/DynamicPartition_5_grad/ReshapeReshape)gradients_2/DynamicPartition_5_grad/range)gradients_2/DynamicPartition_5_grad/Shape*
T0*
Tshape0
�
4gradients_2/DynamicPartition_5_grad/DynamicPartitionDynamicPartition+gradients_2/DynamicPartition_5_grad/ReshapeCast*
T0*
num_partitions
�
1gradients_2/DynamicPartition_5_grad/DynamicStitchDynamicStitch4gradients_2/DynamicPartition_5_grad/DynamicPartition6gradients_2/DynamicPartition_5_grad/DynamicPartition:1gradients_2/zeros_likegradients_2/Mean_7_grad/truediv*
N*
T0
U
+gradients_2/DynamicPartition_5_grad/Shape_1Shapemul_12*
T0*
out_type0
�
-gradients_2/DynamicPartition_5_grad/Reshape_1Reshape1gradients_2/DynamicPartition_5_grad/DynamicStitch+gradients_2/DynamicPartition_5_grad/Shape_1*
T0*
Tshape0
B
gradients_2/zeros_like_1	ZerosLikeDynamicPartition_4*
T0
Q
)gradients_2/DynamicPartition_4_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_2/DynamicPartition_4_grad/ConstConst*
dtype0*
valueB: 
�
(gradients_2/DynamicPartition_4_grad/ProdProd)gradients_2/DynamicPartition_4_grad/Shape)gradients_2/DynamicPartition_4_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_2/DynamicPartition_4_grad/range/startConst*
dtype0*
value	B : 
Y
/gradients_2/DynamicPartition_4_grad/range/deltaConst*
dtype0*
value	B :
�
)gradients_2/DynamicPartition_4_grad/rangeRange/gradients_2/DynamicPartition_4_grad/range/start(gradients_2/DynamicPartition_4_grad/Prod/gradients_2/DynamicPartition_4_grad/range/delta*

Tidx0
�
+gradients_2/DynamicPartition_4_grad/ReshapeReshape)gradients_2/DynamicPartition_4_grad/range)gradients_2/DynamicPartition_4_grad/Shape*
T0*
Tshape0
�
4gradients_2/DynamicPartition_4_grad/DynamicPartitionDynamicPartition+gradients_2/DynamicPartition_4_grad/ReshapeCast*
num_partitions*
T0
�
1gradients_2/DynamicPartition_4_grad/DynamicStitchDynamicStitch4gradients_2/DynamicPartition_4_grad/DynamicPartition6gradients_2/DynamicPartition_4_grad/DynamicPartition:1gradients_2/zeros_like_1gradients_2/Mean_6_grad/truediv*
T0*
N
U
+gradients_2/DynamicPartition_4_grad/Shape_1ShapeSum_15*
T0*
out_type0
�
-gradients_2/DynamicPartition_4_grad/Reshape_1Reshape1gradients_2/DynamicPartition_4_grad/DynamicStitch+gradients_2/DynamicPartition_4_grad/Shape_1*
T0*
Tshape0
I
gradients_2/mul_12_grad/ShapeShapemul_12/x*
T0*
out_type0
I
gradients_2/mul_12_grad/Shape_1ShapeSum_16*
T0*
out_type0
�
-gradients_2/mul_12_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_12_grad/Shapegradients_2/mul_12_grad/Shape_1*
T0
b
gradients_2/mul_12_grad/MulMul-gradients_2/DynamicPartition_5_grad/Reshape_1Sum_16*
T0
�
gradients_2/mul_12_grad/SumSumgradients_2/mul_12_grad/Mul-gradients_2/mul_12_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
}
gradients_2/mul_12_grad/ReshapeReshapegradients_2/mul_12_grad/Sumgradients_2/mul_12_grad/Shape*
T0*
Tshape0
f
gradients_2/mul_12_grad/Mul_1Mulmul_12/x-gradients_2/DynamicPartition_5_grad/Reshape_1*
T0
�
gradients_2/mul_12_grad/Sum_1Sumgradients_2/mul_12_grad/Mul_1/gradients_2/mul_12_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
!gradients_2/mul_12_grad/Reshape_1Reshapegradients_2/mul_12_grad/Sum_1gradients_2/mul_12_grad/Shape_1*
T0*
Tshape0
v
(gradients_2/mul_12_grad/tuple/group_depsNoOp ^gradients_2/mul_12_grad/Reshape"^gradients_2/mul_12_grad/Reshape_1
�
0gradients_2/mul_12_grad/tuple/control_dependencyIdentitygradients_2/mul_12_grad/Reshape)^gradients_2/mul_12_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_12_grad/Reshape
�
2gradients_2/mul_12_grad/tuple/control_dependency_1Identity!gradients_2/mul_12_grad/Reshape_1)^gradients_2/mul_12_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_12_grad/Reshape_1
G
gradients_2/Sum_15_grad/ShapeShapemul_11*
T0*
out_type0
x
gradients_2/Sum_15_grad/SizeConst*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_15_grad/addAddV2Sum_15/reduction_indicesgradients_2/Sum_15_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape
�
gradients_2/Sum_15_grad/modFloorModgradients_2/Sum_15_grad/addgradients_2/Sum_15_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape
z
gradients_2/Sum_15_grad/Shape_1Const*
dtype0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
valueB 

#gradients_2/Sum_15_grad/range/startConst*
dtype0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
value	B : 

#gradients_2/Sum_15_grad/range/deltaConst*
dtype0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
value	B :
�
gradients_2/Sum_15_grad/rangeRange#gradients_2/Sum_15_grad/range/startgradients_2/Sum_15_grad/Size#gradients_2/Sum_15_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape
~
"gradients_2/Sum_15_grad/Fill/valueConst*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_15_grad/FillFillgradients_2/Sum_15_grad/Shape_1"gradients_2/Sum_15_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*

index_type0
�
%gradients_2/Sum_15_grad/DynamicStitchDynamicStitchgradients_2/Sum_15_grad/rangegradients_2/Sum_15_grad/modgradients_2/Sum_15_grad/Shapegradients_2/Sum_15_grad/Fill*
T0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
N
}
!gradients_2/Sum_15_grad/Maximum/yConst*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_15_grad/MaximumMaximum%gradients_2/Sum_15_grad/DynamicStitch!gradients_2/Sum_15_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape
�
 gradients_2/Sum_15_grad/floordivFloorDivgradients_2/Sum_15_grad/Shapegradients_2/Sum_15_grad/Maximum*
T0*0
_class&
$"loc:@gradients_2/Sum_15_grad/Shape
�
gradients_2/Sum_15_grad/ReshapeReshape-gradients_2/DynamicPartition_4_grad/Reshape_1%gradients_2/Sum_15_grad/DynamicStitch*
T0*
Tshape0
�
gradients_2/Sum_15_grad/TileTilegradients_2/Sum_15_grad/Reshape gradients_2/Sum_15_grad/floordiv*

Tmultiples0*
T0
T
gradients_2/Sum_16_grad/ShapeShapeSquaredDifference_4*
T0*
out_type0
x
gradients_2/Sum_16_grad/SizeConst*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_16_grad/addAddV2Sum_16/reduction_indicesgradients_2/Sum_16_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape
�
gradients_2/Sum_16_grad/modFloorModgradients_2/Sum_16_grad/addgradients_2/Sum_16_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape
z
gradients_2/Sum_16_grad/Shape_1Const*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
valueB *
dtype0

#gradients_2/Sum_16_grad/range/startConst*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
value	B : *
dtype0

#gradients_2/Sum_16_grad/range/deltaConst*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_16_grad/rangeRange#gradients_2/Sum_16_grad/range/startgradients_2/Sum_16_grad/Size#gradients_2/Sum_16_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape
~
"gradients_2/Sum_16_grad/Fill/valueConst*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_16_grad/FillFillgradients_2/Sum_16_grad/Shape_1"gradients_2/Sum_16_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*

index_type0
�
%gradients_2/Sum_16_grad/DynamicStitchDynamicStitchgradients_2/Sum_16_grad/rangegradients_2/Sum_16_grad/modgradients_2/Sum_16_grad/Shapegradients_2/Sum_16_grad/Fill*
T0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
N
}
!gradients_2/Sum_16_grad/Maximum/yConst*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape*
value	B :*
dtype0
�
gradients_2/Sum_16_grad/MaximumMaximum%gradients_2/Sum_16_grad/DynamicStitch!gradients_2/Sum_16_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape
�
 gradients_2/Sum_16_grad/floordivFloorDivgradients_2/Sum_16_grad/Shapegradients_2/Sum_16_grad/Maximum*
T0*0
_class&
$"loc:@gradients_2/Sum_16_grad/Shape
�
gradients_2/Sum_16_grad/ReshapeReshape2gradients_2/mul_12_grad/tuple/control_dependency_1%gradients_2/Sum_16_grad/DynamicStitch*
T0*
Tshape0
�
gradients_2/Sum_16_grad/TileTilegradients_2/Sum_16_grad/Reshape gradients_2/Sum_16_grad/floordiv*

Tmultiples0*
T0
F
gradients_2/mul_11_grad/ShapeShapeNeg_9*
T0*
out_type0
O
gradients_2/mul_11_grad/Shape_1ShapeStopGradient*
T0*
out_type0
�
-gradients_2/mul_11_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_11_grad/Shapegradients_2/mul_11_grad/Shape_1*
T0
W
gradients_2/mul_11_grad/MulMulgradients_2/Sum_15_grad/TileStopGradient*
T0
�
gradients_2/mul_11_grad/SumSumgradients_2/mul_11_grad/Mul-gradients_2/mul_11_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/mul_11_grad/ReshapeReshapegradients_2/mul_11_grad/Sumgradients_2/mul_11_grad/Shape*
T0*
Tshape0
R
gradients_2/mul_11_grad/Mul_1MulNeg_9gradients_2/Sum_15_grad/Tile*
T0
�
gradients_2/mul_11_grad/Sum_1Sumgradients_2/mul_11_grad/Mul_1/gradients_2/mul_11_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/mul_11_grad/Reshape_1Reshapegradients_2/mul_11_grad/Sum_1gradients_2/mul_11_grad/Shape_1*
T0*
Tshape0
v
(gradients_2/mul_11_grad/tuple/group_depsNoOp ^gradients_2/mul_11_grad/Reshape"^gradients_2/mul_11_grad/Reshape_1
�
0gradients_2/mul_11_grad/tuple/control_dependencyIdentitygradients_2/mul_11_grad/Reshape)^gradients_2/mul_11_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_11_grad/Reshape
�
2gradients_2/mul_11_grad/tuple/control_dependency_1Identity!gradients_2/mul_11_grad/Reshape_1)^gradients_2/mul_11_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_11_grad/Reshape_1
w
+gradients_2/SquaredDifference_4_grad/scalarConst^gradients_2/Sum_16_grad/Tile*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_4_grad/MulMul+gradients_2/SquaredDifference_4_grad/scalargradients_2/Sum_16_grad/Tile*
T0
z
(gradients_2/SquaredDifference_4_grad/subSubdense_8/BiasAddconcat_11/concat^gradients_2/Sum_16_grad/Tile*
T0
�
*gradients_2/SquaredDifference_4_grad/mul_1Mul(gradients_2/SquaredDifference_4_grad/Mul(gradients_2/SquaredDifference_4_grad/sub*
T0
]
*gradients_2/SquaredDifference_4_grad/ShapeShapedense_8/BiasAdd*
T0*
out_type0
`
,gradients_2/SquaredDifference_4_grad/Shape_1Shapeconcat_11/concat*
T0*
out_type0
�
:gradients_2/SquaredDifference_4_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_4_grad/Shape,gradients_2/SquaredDifference_4_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_4_grad/SumSum*gradients_2/SquaredDifference_4_grad/mul_1:gradients_2/SquaredDifference_4_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
,gradients_2/SquaredDifference_4_grad/ReshapeReshape(gradients_2/SquaredDifference_4_grad/Sum*gradients_2/SquaredDifference_4_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_4_grad/Sum_1Sum*gradients_2/SquaredDifference_4_grad/mul_1<gradients_2/SquaredDifference_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_4_grad/Reshape_1Reshape*gradients_2/SquaredDifference_4_grad/Sum_1,gradients_2/SquaredDifference_4_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_4_grad/NegNeg.gradients_2/SquaredDifference_4_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_4_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_4_grad/Neg-^gradients_2/SquaredDifference_4_grad/Reshape
�
=gradients_2/SquaredDifference_4_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_4_grad/Reshape6^gradients_2/SquaredDifference_4_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_4_grad/Reshape
�
?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_4_grad/Neg6^gradients_2/SquaredDifference_4_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_4_grad/Neg
\
gradients_2/Neg_9_grad/NegNeg0gradients_2/mul_11_grad/tuple/control_dependency*
T0
�
,gradients_2/dense_8/BiasAdd_grad/BiasAddGradBiasAddGrad=gradients_2/SquaredDifference_4_grad/tuple/control_dependency*
data_formatNHWC*
T0
�
1gradients_2/dense_8/BiasAdd_grad/tuple/group_depsNoOp>^gradients_2/SquaredDifference_4_grad/tuple/control_dependency-^gradients_2/dense_8/BiasAdd_grad/BiasAddGrad
�
9gradients_2/dense_8/BiasAdd_grad/tuple/control_dependencyIdentity=gradients_2/SquaredDifference_4_grad/tuple/control_dependency2^gradients_2/dense_8/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_4_grad/Reshape
�
;gradients_2/dense_8/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_8/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_8/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_8/BiasAdd_grad/BiasAddGrad
^
"gradients_2/Log_12_grad/Reciprocal
Reciprocaladd_27^gradients_2/Neg_9_grad/Neg*
T0
k
gradients_2/Log_12_grad/mulMulgradients_2/Neg_9_grad/Neg"gradients_2/Log_12_grad/Reciprocal*
T0
�
&gradients_2/dense_8/MatMul_grad/MatMulMatMul9gradients_2/dense_8/BiasAdd_grad/tuple/control_dependencydense_8/kernel/read*
transpose_a( *
transpose_b(*
T0
�
(gradients_2/dense_8/MatMul_grad/MatMul_1MatMuldense_7/Mul9gradients_2/dense_8/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
0gradients_2/dense_8/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_8/MatMul_grad/MatMul)^gradients_2/dense_8/MatMul_grad/MatMul_1
�
8gradients_2/dense_8/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_8/MatMul_grad/MatMul1^gradients_2/dense_8/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_8/MatMul_grad/MatMul
�
:gradients_2/dense_8/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_8/MatMul_grad/MatMul_11^gradients_2/dense_8/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_8/MatMul_grad/MatMul_1
J
gradients_2/add_27_grad/ShapeShape	concat_13*
T0*
out_type0
K
gradients_2/add_27_grad/Shape_1Shapeadd_27/y*
T0*
out_type0
�
-gradients_2/add_27_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/add_27_grad/Shapegradients_2/add_27_grad/Shape_1*
T0
�
gradients_2/add_27_grad/SumSumgradients_2/Log_12_grad/mul-gradients_2/add_27_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/add_27_grad/ReshapeReshapegradients_2/add_27_grad/Sumgradients_2/add_27_grad/Shape*
T0*
Tshape0
�
gradients_2/add_27_grad/Sum_1Sumgradients_2/Log_12_grad/mul/gradients_2/add_27_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/add_27_grad/Reshape_1Reshapegradients_2/add_27_grad/Sum_1gradients_2/add_27_grad/Shape_1*
T0*
Tshape0
v
(gradients_2/add_27_grad/tuple/group_depsNoOp ^gradients_2/add_27_grad/Reshape"^gradients_2/add_27_grad/Reshape_1
�
0gradients_2/add_27_grad/tuple/control_dependencyIdentitygradients_2/add_27_grad/Reshape)^gradients_2/add_27_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/add_27_grad/Reshape
�
2gradients_2/add_27_grad/tuple/control_dependency_1Identity!gradients_2/add_27_grad/Reshape_1)^gradients_2/add_27_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/add_27_grad/Reshape_1
U
"gradients_2/dense_7/Mul_grad/ShapeShapedense_7/BiasAdd*
T0*
out_type0
W
$gradients_2/dense_7/Mul_grad/Shape_1Shapedense_7/Sigmoid*
T0*
out_type0
�
2gradients_2/dense_7/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients_2/dense_7/Mul_grad/Shape$gradients_2/dense_7/Mul_grad/Shape_1*
T0
{
 gradients_2/dense_7/Mul_grad/MulMul8gradients_2/dense_8/MatMul_grad/tuple/control_dependencydense_7/Sigmoid*
T0
�
 gradients_2/dense_7/Mul_grad/SumSum gradients_2/dense_7/Mul_grad/Mul2gradients_2/dense_7/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
$gradients_2/dense_7/Mul_grad/ReshapeReshape gradients_2/dense_7/Mul_grad/Sum"gradients_2/dense_7/Mul_grad/Shape*
T0*
Tshape0
}
"gradients_2/dense_7/Mul_grad/Mul_1Muldense_7/BiasAdd8gradients_2/dense_8/MatMul_grad/tuple/control_dependency*
T0
�
"gradients_2/dense_7/Mul_grad/Sum_1Sum"gradients_2/dense_7/Mul_grad/Mul_14gradients_2/dense_7/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
&gradients_2/dense_7/Mul_grad/Reshape_1Reshape"gradients_2/dense_7/Mul_grad/Sum_1$gradients_2/dense_7/Mul_grad/Shape_1*
T0*
Tshape0
�
-gradients_2/dense_7/Mul_grad/tuple/group_depsNoOp%^gradients_2/dense_7/Mul_grad/Reshape'^gradients_2/dense_7/Mul_grad/Reshape_1
�
5gradients_2/dense_7/Mul_grad/tuple/control_dependencyIdentity$gradients_2/dense_7/Mul_grad/Reshape.^gradients_2/dense_7/Mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_7/Mul_grad/Reshape
�
7gradients_2/dense_7/Mul_grad/tuple/control_dependency_1Identity&gradients_2/dense_7/Mul_grad/Reshape_1.^gradients_2/dense_7/Mul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_7/Mul_grad/Reshape_1
I
gradients_2/concat_13_grad/RankConst*
value	B :*
dtype0
d
gradients_2/concat_13_grad/modFloorModconcat_13/axisgradients_2/concat_13_grad/Rank*
T0
S
 gradients_2/concat_13_grad/ShapeShapedense_4/Softmax*
T0*
out_type0
�
!gradients_2/concat_13_grad/ShapeNShapeNdense_4/Softmaxdense_5/Softmaxdense_6/Softmax*
T0*
out_type0*
N
�
'gradients_2/concat_13_grad/ConcatOffsetConcatOffsetgradients_2/concat_13_grad/mod!gradients_2/concat_13_grad/ShapeN#gradients_2/concat_13_grad/ShapeN:1#gradients_2/concat_13_grad/ShapeN:2*
N
�
 gradients_2/concat_13_grad/SliceSlice0gradients_2/add_27_grad/tuple/control_dependency'gradients_2/concat_13_grad/ConcatOffset!gradients_2/concat_13_grad/ShapeN*
T0*
Index0
�
"gradients_2/concat_13_grad/Slice_1Slice0gradients_2/add_27_grad/tuple/control_dependency)gradients_2/concat_13_grad/ConcatOffset:1#gradients_2/concat_13_grad/ShapeN:1*
T0*
Index0
�
"gradients_2/concat_13_grad/Slice_2Slice0gradients_2/add_27_grad/tuple/control_dependency)gradients_2/concat_13_grad/ConcatOffset:2#gradients_2/concat_13_grad/ShapeN:2*
T0*
Index0
�
+gradients_2/concat_13_grad/tuple/group_depsNoOp!^gradients_2/concat_13_grad/Slice#^gradients_2/concat_13_grad/Slice_1#^gradients_2/concat_13_grad/Slice_2
�
3gradients_2/concat_13_grad/tuple/control_dependencyIdentity gradients_2/concat_13_grad/Slice,^gradients_2/concat_13_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/concat_13_grad/Slice
�
5gradients_2/concat_13_grad/tuple/control_dependency_1Identity"gradients_2/concat_13_grad/Slice_1,^gradients_2/concat_13_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_2/concat_13_grad/Slice_1
�
5gradients_2/concat_13_grad/tuple/control_dependency_2Identity"gradients_2/concat_13_grad/Slice_2,^gradients_2/concat_13_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_2/concat_13_grad/Slice_2
�
,gradients_2/dense_7/Sigmoid_grad/SigmoidGradSigmoidGraddense_7/Sigmoid7gradients_2/dense_7/Mul_grad/tuple/control_dependency_1*
T0
z
$gradients_2/dense_4/Softmax_grad/mulMul3gradients_2/concat_13_grad/tuple/control_dependencydense_4/Softmax*
T0
i
6gradients_2/dense_4/Softmax_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
$gradients_2/dense_4/Softmax_grad/SumSum$gradients_2/dense_4/Softmax_grad/mul6gradients_2/dense_4/Softmax_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
$gradients_2/dense_4/Softmax_grad/subSub3gradients_2/concat_13_grad/tuple/control_dependency$gradients_2/dense_4/Softmax_grad/Sum*
T0
m
&gradients_2/dense_4/Softmax_grad/mul_1Mul$gradients_2/dense_4/Softmax_grad/subdense_4/Softmax*
T0
|
$gradients_2/dense_5/Softmax_grad/mulMul5gradients_2/concat_13_grad/tuple/control_dependency_1dense_5/Softmax*
T0
i
6gradients_2/dense_5/Softmax_grad/Sum/reduction_indicesConst*
dtype0*
valueB :
���������
�
$gradients_2/dense_5/Softmax_grad/SumSum$gradients_2/dense_5/Softmax_grad/mul6gradients_2/dense_5/Softmax_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
$gradients_2/dense_5/Softmax_grad/subSub5gradients_2/concat_13_grad/tuple/control_dependency_1$gradients_2/dense_5/Softmax_grad/Sum*
T0
m
&gradients_2/dense_5/Softmax_grad/mul_1Mul$gradients_2/dense_5/Softmax_grad/subdense_5/Softmax*
T0
|
$gradients_2/dense_6/Softmax_grad/mulMul5gradients_2/concat_13_grad/tuple/control_dependency_2dense_6/Softmax*
T0
i
6gradients_2/dense_6/Softmax_grad/Sum/reduction_indicesConst*
valueB :
���������*
dtype0
�
$gradients_2/dense_6/Softmax_grad/SumSum$gradients_2/dense_6/Softmax_grad/mul6gradients_2/dense_6/Softmax_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
�
$gradients_2/dense_6/Softmax_grad/subSub5gradients_2/concat_13_grad/tuple/control_dependency_2$gradients_2/dense_6/Softmax_grad/Sum*
T0
m
&gradients_2/dense_6/Softmax_grad/mul_1Mul$gradients_2/dense_6/Softmax_grad/subdense_6/Softmax*
T0
�
gradients_2/AddNAddN5gradients_2/dense_7/Mul_grad/tuple/control_dependency,gradients_2/dense_7/Sigmoid_grad/SigmoidGrad*
T0*7
_class-
+)loc:@gradients_2/dense_7/Mul_grad/Reshape*
N
m
,gradients_2/dense_7/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN*
T0*
data_formatNHWC
{
1gradients_2/dense_7/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN-^gradients_2/dense_7/BiasAdd_grad/BiasAddGrad
�
9gradients_2/dense_7/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN2^gradients_2/dense_7/BiasAdd_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_7/Mul_grad/Reshape
�
;gradients_2/dense_7/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_7/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_7/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_7/BiasAdd_grad/BiasAddGrad
�
,gradients_2/dense_4/BiasAdd_grad/BiasAddGradBiasAddGrad&gradients_2/dense_4/Softmax_grad/mul_1*
data_formatNHWC*
T0
�
1gradients_2/dense_4/BiasAdd_grad/tuple/group_depsNoOp-^gradients_2/dense_4/BiasAdd_grad/BiasAddGrad'^gradients_2/dense_4/Softmax_grad/mul_1
�
9gradients_2/dense_4/BiasAdd_grad/tuple/control_dependencyIdentity&gradients_2/dense_4/Softmax_grad/mul_12^gradients_2/dense_4/BiasAdd_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_4/Softmax_grad/mul_1
�
;gradients_2/dense_4/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_4/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_4/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_4/BiasAdd_grad/BiasAddGrad
�
,gradients_2/dense_5/BiasAdd_grad/BiasAddGradBiasAddGrad&gradients_2/dense_5/Softmax_grad/mul_1*
T0*
data_formatNHWC
�
1gradients_2/dense_5/BiasAdd_grad/tuple/group_depsNoOp-^gradients_2/dense_5/BiasAdd_grad/BiasAddGrad'^gradients_2/dense_5/Softmax_grad/mul_1
�
9gradients_2/dense_5/BiasAdd_grad/tuple/control_dependencyIdentity&gradients_2/dense_5/Softmax_grad/mul_12^gradients_2/dense_5/BiasAdd_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_5/Softmax_grad/mul_1
�
;gradients_2/dense_5/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_5/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_5/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_5/BiasAdd_grad/BiasAddGrad
�
,gradients_2/dense_6/BiasAdd_grad/BiasAddGradBiasAddGrad&gradients_2/dense_6/Softmax_grad/mul_1*
T0*
data_formatNHWC
�
1gradients_2/dense_6/BiasAdd_grad/tuple/group_depsNoOp-^gradients_2/dense_6/BiasAdd_grad/BiasAddGrad'^gradients_2/dense_6/Softmax_grad/mul_1
�
9gradients_2/dense_6/BiasAdd_grad/tuple/control_dependencyIdentity&gradients_2/dense_6/Softmax_grad/mul_12^gradients_2/dense_6/BiasAdd_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_6/Softmax_grad/mul_1
�
;gradients_2/dense_6/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_6/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_6/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_6/BiasAdd_grad/BiasAddGrad
�
&gradients_2/dense_7/MatMul_grad/MatMulMatMul9gradients_2/dense_7/BiasAdd_grad/tuple/control_dependencydense_7/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
(gradients_2/dense_7/MatMul_grad/MatMul_1MatMul	concat_149gradients_2/dense_7/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
�
0gradients_2/dense_7/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_7/MatMul_grad/MatMul)^gradients_2/dense_7/MatMul_grad/MatMul_1
�
8gradients_2/dense_7/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_7/MatMul_grad/MatMul1^gradients_2/dense_7/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_7/MatMul_grad/MatMul
�
:gradients_2/dense_7/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_7/MatMul_grad/MatMul_11^gradients_2/dense_7/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_7/MatMul_grad/MatMul_1
�
&gradients_2/dense_4/MatMul_grad/MatMulMatMul9gradients_2/dense_4/BiasAdd_grad/tuple/control_dependencydense_4/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
(gradients_2/dense_4/MatMul_grad/MatMul_1MatMuldense_3/Mul9gradients_2/dense_4/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
0gradients_2/dense_4/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_4/MatMul_grad/MatMul)^gradients_2/dense_4/MatMul_grad/MatMul_1
�
8gradients_2/dense_4/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_4/MatMul_grad/MatMul1^gradients_2/dense_4/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_4/MatMul_grad/MatMul
�
:gradients_2/dense_4/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_4/MatMul_grad/MatMul_11^gradients_2/dense_4/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_4/MatMul_grad/MatMul_1
�
&gradients_2/dense_5/MatMul_grad/MatMulMatMul9gradients_2/dense_5/BiasAdd_grad/tuple/control_dependencydense_5/kernel/read*
transpose_a( *
transpose_b(*
T0
�
(gradients_2/dense_5/MatMul_grad/MatMul_1MatMuldense_3/Mul9gradients_2/dense_5/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
0gradients_2/dense_5/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_5/MatMul_grad/MatMul)^gradients_2/dense_5/MatMul_grad/MatMul_1
�
8gradients_2/dense_5/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_5/MatMul_grad/MatMul1^gradients_2/dense_5/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_5/MatMul_grad/MatMul
�
:gradients_2/dense_5/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_5/MatMul_grad/MatMul_11^gradients_2/dense_5/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_5/MatMul_grad/MatMul_1
�
&gradients_2/dense_6/MatMul_grad/MatMulMatMul9gradients_2/dense_6/BiasAdd_grad/tuple/control_dependencydense_6/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
(gradients_2/dense_6/MatMul_grad/MatMul_1MatMuldense_3/Mul9gradients_2/dense_6/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
0gradients_2/dense_6/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_6/MatMul_grad/MatMul)^gradients_2/dense_6/MatMul_grad/MatMul_1
�
8gradients_2/dense_6/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_6/MatMul_grad/MatMul1^gradients_2/dense_6/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_6/MatMul_grad/MatMul
�
:gradients_2/dense_6/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_6/MatMul_grad/MatMul_11^gradients_2/dense_6/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_6/MatMul_grad/MatMul_1
I
gradients_2/concat_14_grad/RankConst*
value	B :*
dtype0
d
gradients_2/concat_14_grad/modFloorModconcat_14/axisgradients_2/concat_14_grad/Rank*
T0
T
 gradients_2/concat_14_grad/ShapeShapeconcat_10/concat*
T0*
out_type0
m
!gradients_2/concat_14_grad/ShapeNShapeNconcat_10/concatStopGradient*
T0*
out_type0*
N
�
'gradients_2/concat_14_grad/ConcatOffsetConcatOffsetgradients_2/concat_14_grad/mod!gradients_2/concat_14_grad/ShapeN#gradients_2/concat_14_grad/ShapeN:1*
N
�
 gradients_2/concat_14_grad/SliceSlice8gradients_2/dense_7/MatMul_grad/tuple/control_dependency'gradients_2/concat_14_grad/ConcatOffset!gradients_2/concat_14_grad/ShapeN*
T0*
Index0
�
"gradients_2/concat_14_grad/Slice_1Slice8gradients_2/dense_7/MatMul_grad/tuple/control_dependency)gradients_2/concat_14_grad/ConcatOffset:1#gradients_2/concat_14_grad/ShapeN:1*
T0*
Index0
{
+gradients_2/concat_14_grad/tuple/group_depsNoOp!^gradients_2/concat_14_grad/Slice#^gradients_2/concat_14_grad/Slice_1
�
3gradients_2/concat_14_grad/tuple/control_dependencyIdentity gradients_2/concat_14_grad/Slice,^gradients_2/concat_14_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/concat_14_grad/Slice
�
5gradients_2/concat_14_grad/tuple/control_dependency_1Identity"gradients_2/concat_14_grad/Slice_1,^gradients_2/concat_14_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_2/concat_14_grad/Slice_1
�
gradients_2/AddN_1AddN8gradients_2/dense_4/MatMul_grad/tuple/control_dependency8gradients_2/dense_5/MatMul_grad/tuple/control_dependency8gradients_2/dense_6/MatMul_grad/tuple/control_dependency*
T0*9
_class/
-+loc:@gradients_2/dense_4/MatMul_grad/MatMul*
N
U
"gradients_2/dense_3/Mul_grad/ShapeShapedense_3/BiasAdd*
T0*
out_type0
W
$gradients_2/dense_3/Mul_grad/Shape_1Shapedense_3/Sigmoid*
T0*
out_type0
�
2gradients_2/dense_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients_2/dense_3/Mul_grad/Shape$gradients_2/dense_3/Mul_grad/Shape_1*
T0
U
 gradients_2/dense_3/Mul_grad/MulMulgradients_2/AddN_1dense_3/Sigmoid*
T0
�
 gradients_2/dense_3/Mul_grad/SumSum gradients_2/dense_3/Mul_grad/Mul2gradients_2/dense_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
$gradients_2/dense_3/Mul_grad/ReshapeReshape gradients_2/dense_3/Mul_grad/Sum"gradients_2/dense_3/Mul_grad/Shape*
T0*
Tshape0
W
"gradients_2/dense_3/Mul_grad/Mul_1Muldense_3/BiasAddgradients_2/AddN_1*
T0
�
"gradients_2/dense_3/Mul_grad/Sum_1Sum"gradients_2/dense_3/Mul_grad/Mul_14gradients_2/dense_3/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
&gradients_2/dense_3/Mul_grad/Reshape_1Reshape"gradients_2/dense_3/Mul_grad/Sum_1$gradients_2/dense_3/Mul_grad/Shape_1*
T0*
Tshape0
�
-gradients_2/dense_3/Mul_grad/tuple/group_depsNoOp%^gradients_2/dense_3/Mul_grad/Reshape'^gradients_2/dense_3/Mul_grad/Reshape_1
�
5gradients_2/dense_3/Mul_grad/tuple/control_dependencyIdentity$gradients_2/dense_3/Mul_grad/Reshape.^gradients_2/dense_3/Mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_3/Mul_grad/Reshape
�
7gradients_2/dense_3/Mul_grad/tuple/control_dependency_1Identity&gradients_2/dense_3/Mul_grad/Reshape_1.^gradients_2/dense_3/Mul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_3/Mul_grad/Reshape_1
�
,gradients_2/dense_3/Sigmoid_grad/SigmoidGradSigmoidGraddense_3/Sigmoid7gradients_2/dense_3/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_2AddN5gradients_2/dense_3/Mul_grad/tuple/control_dependency,gradients_2/dense_3/Sigmoid_grad/SigmoidGrad*
T0*7
_class-
+)loc:@gradients_2/dense_3/Mul_grad/Reshape*
N
o
,gradients_2/dense_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_2*
data_formatNHWC*
T0
}
1gradients_2/dense_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_2-^gradients_2/dense_3/BiasAdd_grad/BiasAddGrad
�
9gradients_2/dense_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_22^gradients_2/dense_3/BiasAdd_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_3/Mul_grad/Reshape
�
;gradients_2/dense_3/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_3/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_3/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_3/BiasAdd_grad/BiasAddGrad
�
&gradients_2/dense_3/MatMul_grad/MatMulMatMul9gradients_2/dense_3/BiasAdd_grad/tuple/control_dependencydense_3/kernel/read*
T0*
transpose_a( *
transpose_b(
�
(gradients_2/dense_3/MatMul_grad/MatMul_1MatMul	concat_129gradients_2/dense_3/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
0gradients_2/dense_3/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_3/MatMul_grad/MatMul)^gradients_2/dense_3/MatMul_grad/MatMul_1
�
8gradients_2/dense_3/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_3/MatMul_grad/MatMul1^gradients_2/dense_3/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_3/MatMul_grad/MatMul
�
:gradients_2/dense_3/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_3/MatMul_grad/MatMul_11^gradients_2/dense_3/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_3/MatMul_grad/MatMul_1
I
gradients_2/concat_12_grad/RankConst*
dtype0*
value	B :
d
gradients_2/concat_12_grad/modFloorModconcat_12/axisgradients_2/concat_12_grad/Rank*
T0
T
 gradients_2/concat_12_grad/ShapeShapeconcat_10/concat*
T0*
out_type0
q
!gradients_2/concat_12_grad/ShapeNShapeNconcat_10/concatconcat_11/concat*
T0*
out_type0*
N
�
'gradients_2/concat_12_grad/ConcatOffsetConcatOffsetgradients_2/concat_12_grad/mod!gradients_2/concat_12_grad/ShapeN#gradients_2/concat_12_grad/ShapeN:1*
N
�
 gradients_2/concat_12_grad/SliceSlice8gradients_2/dense_3/MatMul_grad/tuple/control_dependency'gradients_2/concat_12_grad/ConcatOffset!gradients_2/concat_12_grad/ShapeN*
T0*
Index0
�
"gradients_2/concat_12_grad/Slice_1Slice8gradients_2/dense_3/MatMul_grad/tuple/control_dependency)gradients_2/concat_12_grad/ConcatOffset:1#gradients_2/concat_12_grad/ShapeN:1*
T0*
Index0
{
+gradients_2/concat_12_grad/tuple/group_depsNoOp!^gradients_2/concat_12_grad/Slice#^gradients_2/concat_12_grad/Slice_1
�
3gradients_2/concat_12_grad/tuple/control_dependencyIdentity gradients_2/concat_12_grad/Slice,^gradients_2/concat_12_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/concat_12_grad/Slice
�
5gradients_2/concat_12_grad/tuple/control_dependency_1Identity"gradients_2/concat_12_grad/Slice_1,^gradients_2/concat_12_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_2/concat_12_grad/Slice_1
�
gradients_2/AddN_3AddN3gradients_2/concat_14_grad/tuple/control_dependency3gradients_2/concat_12_grad/tuple/control_dependency*
T0*3
_class)
'%loc:@gradients_2/concat_14_grad/Slice*
N
�
gradients_2/AddN_4AddN?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_15gradients_2/concat_12_grad/tuple/control_dependency_1*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_4_grad/Neg*
N
�
@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ShapeShape-curiosity_vector_obs_encoder/hidden_1/BiasAdd*
T0*
out_type0
�
Bgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1Shape-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0*
out_type0
�
Pgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ShapeBgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1*
T0
�
>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/MulMulgradients_2/AddN_3-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0
�
>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/SumSum>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/MulPgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Bgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeReshape>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Mul_1Mul-curiosity_vector_obs_encoder/hidden_1/BiasAddgradients_2/AddN_3*
T0
�
@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum_1Sum@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Mul_1Rgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Dgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1Reshape@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum_1Bgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Kgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_depsNoOpC^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeE^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1
�
Sgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentityBgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeL^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape
�
Ugradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependency_1IdentityDgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1L^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1
�
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ShapeShape/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd*
T0*
out_type0
�
Dgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1Shape/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0*
out_type0
�
Rgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ShapeDgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1*
T0
�
@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/MulMulgradients_2/AddN_4/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0
�
@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/SumSum@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/MulRgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Dgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeReshape@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Mul_1Mul/curiosity_vector_obs_encoder_1/hidden_1/BiasAddgradients_2/AddN_4*
T0
�
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum_1SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Mul_1Tgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Fgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1ReshapeBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum_1Dgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Mgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeG^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1
�
Ugradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeN^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
�
Wgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1N^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1
�
Jgradients_2/curiosity_vector_obs_encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad-curiosity_vector_obs_encoder/hidden_1/SigmoidUgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
Lgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad/curiosity_vector_obs_encoder_1/hidden_1/SigmoidWgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_5AddNSgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependencyJgradients_2/curiosity_vector_obs_encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape*
N
�
Jgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_5*
T0*
data_formatNHWC
�
Ogradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_5K^gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
Wgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_5P^gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape
�
Ygradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityJgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGradP^gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_6AddNUgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependencyLgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid_grad/SigmoidGrad*
N*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
�
Lgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_6*
T0*
data_formatNHWC
�
Qgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_6M^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad
�
Ygradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_6R^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
�
[gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityLgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGradR^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*_
_classU
SQloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad
�
Dgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulMatMulWgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_a( *
transpose_b(*
T0
�
Fgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1MatMul)curiosity_vector_obs_encoder/hidden_0/MulWgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Ngradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulG^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1
�
Vgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulO^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul
�
Xgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1O^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1
�
Fgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulMatMulYgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_1/kernel/read*
T0*
transpose_a( *
transpose_b(
�
Hgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1MatMul+curiosity_vector_obs_encoder_1/hidden_0/MulYgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
�
Pgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_depsNoOpG^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulI^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1
�
Xgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependencyIdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulQ^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul
�
Zgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityHgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1Q^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1
�
gradients_2/AddN_7AddNYgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1[gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad*
N
�
@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ShapeShape-curiosity_vector_obs_encoder/hidden_0/BiasAdd*
T0*
out_type0
�
Bgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1Shape-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0*
out_type0
�
Pgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ShapeBgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1*
T0
�
>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/MulMulVgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0
�
>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/SumSum>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/MulPgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
Bgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeReshape>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Mul_1Mul-curiosity_vector_obs_encoder/hidden_0/BiasAddVgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum_1Sum@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Mul_1Rgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
Dgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1Reshape@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum_1Bgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Kgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_depsNoOpC^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeE^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1
�
Sgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentityBgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeL^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
�
Ugradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependency_1IdentityDgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1L^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1
�
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ShapeShape/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd*
T0*
out_type0
�
Dgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1Shape/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0*
out_type0
�
Rgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ShapeDgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1*
T0
�
@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/MulMulXgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0
�
@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/SumSum@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/MulRgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
�
Dgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeReshape@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Mul_1Mul/curiosity_vector_obs_encoder_1/hidden_0/BiasAddXgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum_1SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Mul_1Tgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
�
Fgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1ReshapeBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum_1Dgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Mgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeG^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1
�
Ugradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeN^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
�
Wgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1N^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1
�
gradients_2/AddN_8AddNXgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1Zgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency_1*
N*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1
�
Jgradients_2/curiosity_vector_obs_encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad-curiosity_vector_obs_encoder/hidden_0/SigmoidUgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
Lgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad/curiosity_vector_obs_encoder_1/hidden_0/SigmoidWgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_9AddNSgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependencyJgradients_2/curiosity_vector_obs_encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
N*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
�
Jgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_9*
T0*
data_formatNHWC
�
Ogradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_9K^gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
Wgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_9P^gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
�
Ygradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityJgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGradP^gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_10AddNUgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependencyLgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid_grad/SigmoidGrad*
N*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
�
Lgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_10*
T0*
data_formatNHWC
�
Qgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_10M^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad
�
Ygradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_10R^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
�
[gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityLgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGradR^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*_
_classU
SQloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad
�
Dgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulMatMulWgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b(
�
Fgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1MatMulvector_observationWgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
�
Ngradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulG^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1
�
Vgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulO^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul
�
Xgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1O^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1
�
Fgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulMatMulYgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b(
�
Hgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1MatMul!curiosity_next_vector_observationYgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
Pgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_depsNoOpG^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulI^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1
�
Xgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependencyIdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulQ^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul
�
Zgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityHgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1Q^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1
�
gradients_2/AddN_11AddNYgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1[gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad*
N
�
gradients_2/AddN_12AddNXgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1Zgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependency_1*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1*
N
�
beta1_power_1/initial_valueConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB
 *fff?*
dtype0
�
beta1_power_1
VariableV2*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container *
shape: *
shared_name 
�
beta1_power_1/AssignAssignbeta1_power_1beta1_power_1/initial_value*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
u
beta1_power_1/readIdentitybeta1_power_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
beta2_power_1/initial_valueConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB
 *w�?*
dtype0
�
beta2_power_1
VariableV2*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container *
shape: *
shared_name 
�
beta2_power_1/AssignAssignbeta2_power_1beta2_power_1/initial_value*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(*
use_locking(
u
beta2_power_1/readIdentitybeta2_power_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Scuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"�     *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Icuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Ccuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zerosFillScuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorIcuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
1curiosity_vector_obs_encoder/hidden_0/kernel/Adam
VariableV2*
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
�
8curiosity_vector_obs_encoder/hidden_0/kernel/Adam/AssignAssign1curiosity_vector_obs_encoder/hidden_0/kernel/AdamCcuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
6curiosity_vector_obs_encoder/hidden_0/kernel/Adam/readIdentity1curiosity_vector_obs_encoder/hidden_0/kernel/Adam*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Ucuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"�     *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Kcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Ecuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zerosFillUcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorKcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1
VariableV2*
dtype0*
	container *
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
:curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/AssignAssign3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1Ecuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(*
use_locking(
�
8curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/readIdentity3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Acuriosity_vector_obs_encoder/hidden_0/bias/Adam/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0
�
/curiosity_vector_obs_encoder/hidden_0/bias/Adam
VariableV2*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container *
shape:�
�
6curiosity_vector_obs_encoder/hidden_0/bias/Adam/AssignAssign/curiosity_vector_obs_encoder/hidden_0/bias/AdamAcuriosity_vector_obs_encoder/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
4curiosity_vector_obs_encoder/hidden_0/bias/Adam/readIdentity/curiosity_vector_obs_encoder/hidden_0/bias/Adam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Ccuriosity_vector_obs_encoder/hidden_0/bias/Adam_1/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0
�
1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1
VariableV2*
dtype0*
	container *
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
8curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/AssignAssign1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1Ccuriosity_vector_obs_encoder/hidden_0/bias/Adam_1/Initializer/zeros*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(*
use_locking(
�
6curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/readIdentity1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Scuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Icuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Ccuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zerosFillScuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorIcuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
1curiosity_vector_obs_encoder/hidden_1/kernel/Adam
VariableV2*
dtype0*
	container *
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
8curiosity_vector_obs_encoder/hidden_1/kernel/Adam/AssignAssign1curiosity_vector_obs_encoder/hidden_1/kernel/AdamCcuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
6curiosity_vector_obs_encoder/hidden_1/kernel/Adam/readIdentity1curiosity_vector_obs_encoder/hidden_1/kernel/Adam*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
Ucuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Kcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Ecuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zerosFillUcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorKcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1
VariableV2*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
:curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/AssignAssign3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Ecuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
8curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/readIdentity3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
Acuriosity_vector_obs_encoder/hidden_1/bias/Adam/Initializer/zerosConst*
dtype0*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
/curiosity_vector_obs_encoder/hidden_1/bias/Adam
VariableV2*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container *
shape:�*
shared_name 
�
6curiosity_vector_obs_encoder/hidden_1/bias/Adam/AssignAssign/curiosity_vector_obs_encoder/hidden_1/bias/AdamAcuriosity_vector_obs_encoder/hidden_1/bias/Adam/Initializer/zeros*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(*
use_locking(
�
4curiosity_vector_obs_encoder/hidden_1/bias/Adam/readIdentity/curiosity_vector_obs_encoder/hidden_1/bias/Adam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
Ccuriosity_vector_obs_encoder/hidden_1/bias/Adam_1/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0
�
1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 
�
8curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/AssignAssign1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1Ccuriosity_vector_obs_encoder/hidden_1/bias/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
6curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/readIdentity1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
5dense_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"      *!
_class
loc:@dense_3/kernel
{
+dense_3/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_3/kernel*
dtype0
�
%dense_3/kernel/Adam/Initializer/zerosFill5dense_3/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_3/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_3/kernel
�
dense_3/kernel/Adam
VariableV2*!
_class
loc:@dense_3/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
dense_3/kernel/Adam/AssignAssigndense_3/kernel/Adam%dense_3/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
e
dense_3/kernel/Adam/readIdentitydense_3/kernel/Adam*
T0*!
_class
loc:@dense_3/kernel
�
7dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_3/kernel*
dtype0
}
-dense_3/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_3/kernel*
dtype0
�
'dense_3/kernel/Adam_1/Initializer/zerosFill7dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_3/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_3/kernel
�
dense_3/kernel/Adam_1
VariableV2*!
_class
loc:@dense_3/kernel*
dtype0*
	container *
shape:
��*
shared_name 
�
dense_3/kernel/Adam_1/AssignAssigndense_3/kernel/Adam_1'dense_3/kernel/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_3/kernel
i
dense_3/kernel/Adam_1/readIdentitydense_3/kernel/Adam_1*
T0*!
_class
loc:@dense_3/kernel
v
#dense_3/bias/Adam/Initializer/zerosConst*
dtype0*
valueB�*    *
_class
loc:@dense_3/bias
�
dense_3/bias/Adam
VariableV2*
dtype0*
	container *
shape:�*
shared_name *
_class
loc:@dense_3/bias
�
dense_3/bias/Adam/AssignAssigndense_3/bias/Adam#dense_3/bias/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense_3/bias
_
dense_3/bias/Adam/readIdentitydense_3/bias/Adam*
T0*
_class
loc:@dense_3/bias
x
%dense_3/bias/Adam_1/Initializer/zerosConst*
dtype0*
valueB�*    *
_class
loc:@dense_3/bias
�
dense_3/bias/Adam_1
VariableV2*
_class
loc:@dense_3/bias*
dtype0*
	container *
shape:�*
shared_name 
�
dense_3/bias/Adam_1/AssignAssigndense_3/bias/Adam_1%dense_3/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
c
dense_3/bias/Adam_1/readIdentitydense_3/bias/Adam_1*
T0*
_class
loc:@dense_3/bias
~
%dense_4/kernel/Adam/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_4/kernel*
dtype0
�
dense_4/kernel/Adam
VariableV2*
shared_name *!
_class
loc:@dense_4/kernel*
dtype0*
	container *
shape:	�
�
dense_4/kernel/Adam/AssignAssigndense_4/kernel/Adam%dense_4/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
e
dense_4/kernel/Adam/readIdentitydense_4/kernel/Adam*
T0*!
_class
loc:@dense_4/kernel
�
'dense_4/kernel/Adam_1/Initializer/zerosConst*
dtype0*
valueB	�*    *!
_class
loc:@dense_4/kernel
�
dense_4/kernel/Adam_1
VariableV2*
shared_name *!
_class
loc:@dense_4/kernel*
dtype0*
	container *
shape:	�
�
dense_4/kernel/Adam_1/AssignAssigndense_4/kernel/Adam_1'dense_4/kernel/Adam_1/Initializer/zeros*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(*
use_locking(
i
dense_4/kernel/Adam_1/readIdentitydense_4/kernel/Adam_1*
T0*!
_class
loc:@dense_4/kernel
u
#dense_4/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_4/bias*
dtype0
�
dense_4/bias/Adam
VariableV2*
dtype0*
	container *
shape:*
shared_name *
_class
loc:@dense_4/bias
�
dense_4/bias/Adam/AssignAssigndense_4/bias/Adam#dense_4/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
_
dense_4/bias/Adam/readIdentitydense_4/bias/Adam*
T0*
_class
loc:@dense_4/bias
w
%dense_4/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_4/bias*
dtype0
�
dense_4/bias/Adam_1
VariableV2*
shared_name *
_class
loc:@dense_4/bias*
dtype0*
	container *
shape:
�
dense_4/bias/Adam_1/AssignAssigndense_4/bias/Adam_1%dense_4/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
c
dense_4/bias/Adam_1/readIdentitydense_4/bias/Adam_1*
T0*
_class
loc:@dense_4/bias
~
%dense_5/kernel/Adam/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_5/kernel*
dtype0
�
dense_5/kernel/Adam
VariableV2*
dtype0*
	container *
shape:	�*
shared_name *!
_class
loc:@dense_5/kernel
�
dense_5/kernel/Adam/AssignAssigndense_5/kernel/Adam%dense_5/kernel/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_5/kernel
e
dense_5/kernel/Adam/readIdentitydense_5/kernel/Adam*
T0*!
_class
loc:@dense_5/kernel
�
'dense_5/kernel/Adam_1/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_5/kernel*
dtype0
�
dense_5/kernel/Adam_1
VariableV2*!
_class
loc:@dense_5/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
dense_5/kernel/Adam_1/AssignAssigndense_5/kernel/Adam_1'dense_5/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_5/kernel*
validate_shape(
i
dense_5/kernel/Adam_1/readIdentitydense_5/kernel/Adam_1*
T0*!
_class
loc:@dense_5/kernel
u
#dense_5/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_5/bias*
dtype0
�
dense_5/bias/Adam
VariableV2*
dtype0*
	container *
shape:*
shared_name *
_class
loc:@dense_5/bias
�
dense_5/bias/Adam/AssignAssigndense_5/bias/Adam#dense_5/bias/Adam/Initializer/zeros*
T0*
_class
loc:@dense_5/bias*
validate_shape(*
use_locking(
_
dense_5/bias/Adam/readIdentitydense_5/bias/Adam*
T0*
_class
loc:@dense_5/bias
w
%dense_5/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_5/bias*
dtype0
�
dense_5/bias/Adam_1
VariableV2*
shape:*
shared_name *
_class
loc:@dense_5/bias*
dtype0*
	container 
�
dense_5/bias/Adam_1/AssignAssigndense_5/bias/Adam_1%dense_5/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_5/bias*
validate_shape(
c
dense_5/bias/Adam_1/readIdentitydense_5/bias/Adam_1*
T0*
_class
loc:@dense_5/bias
~
%dense_6/kernel/Adam/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_6/kernel*
dtype0
�
dense_6/kernel/Adam
VariableV2*!
_class
loc:@dense_6/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
dense_6/kernel/Adam/AssignAssigndense_6/kernel/Adam%dense_6/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_6/kernel*
validate_shape(
e
dense_6/kernel/Adam/readIdentitydense_6/kernel/Adam*
T0*!
_class
loc:@dense_6/kernel
�
'dense_6/kernel/Adam_1/Initializer/zerosConst*
valueB	�*    *!
_class
loc:@dense_6/kernel*
dtype0
�
dense_6/kernel/Adam_1
VariableV2*!
_class
loc:@dense_6/kernel*
dtype0*
	container *
shape:	�*
shared_name 
�
dense_6/kernel/Adam_1/AssignAssigndense_6/kernel/Adam_1'dense_6/kernel/Adam_1/Initializer/zeros*
T0*!
_class
loc:@dense_6/kernel*
validate_shape(*
use_locking(
i
dense_6/kernel/Adam_1/readIdentitydense_6/kernel/Adam_1*
T0*!
_class
loc:@dense_6/kernel
u
#dense_6/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_6/bias*
dtype0
�
dense_6/bias/Adam
VariableV2*
shape:*
shared_name *
_class
loc:@dense_6/bias*
dtype0*
	container 
�
dense_6/bias/Adam/AssignAssigndense_6/bias/Adam#dense_6/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_6/bias*
validate_shape(
_
dense_6/bias/Adam/readIdentitydense_6/bias/Adam*
T0*
_class
loc:@dense_6/bias
w
%dense_6/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_6/bias*
dtype0
�
dense_6/bias/Adam_1
VariableV2*
_class
loc:@dense_6/bias*
dtype0*
	container *
shape:*
shared_name 
�
dense_6/bias/Adam_1/AssignAssigndense_6/bias/Adam_1%dense_6/bias/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense_6/bias
c
dense_6/bias/Adam_1/readIdentitydense_6/bias/Adam_1*
T0*
_class
loc:@dense_6/bias
�
5dense_7/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"	     *!
_class
loc:@dense_7/kernel
{
+dense_7/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_7/kernel*
dtype0
�
%dense_7/kernel/Adam/Initializer/zerosFill5dense_7/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_7/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_7/kernel
�
dense_7/kernel/Adam
VariableV2*
dtype0*
	container *
shape:
��*
shared_name *!
_class
loc:@dense_7/kernel
�
dense_7/kernel/Adam/AssignAssigndense_7/kernel/Adam%dense_7/kernel/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_7/kernel
e
dense_7/kernel/Adam/readIdentitydense_7/kernel/Adam*
T0*!
_class
loc:@dense_7/kernel
�
7dense_7/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"	     *!
_class
loc:@dense_7/kernel*
dtype0
}
-dense_7/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_7/kernel*
dtype0
�
'dense_7/kernel/Adam_1/Initializer/zerosFill7dense_7/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_7/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_7/kernel
�
dense_7/kernel/Adam_1
VariableV2*
shared_name *!
_class
loc:@dense_7/kernel*
dtype0*
	container *
shape:
��
�
dense_7/kernel/Adam_1/AssignAssigndense_7/kernel/Adam_1'dense_7/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_7/kernel*
validate_shape(
i
dense_7/kernel/Adam_1/readIdentitydense_7/kernel/Adam_1*
T0*!
_class
loc:@dense_7/kernel
v
#dense_7/bias/Adam/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_7/bias*
dtype0
�
dense_7/bias/Adam
VariableV2*
shared_name *
_class
loc:@dense_7/bias*
dtype0*
	container *
shape:�
�
dense_7/bias/Adam/AssignAssigndense_7/bias/Adam#dense_7/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_7/bias*
validate_shape(
_
dense_7/bias/Adam/readIdentitydense_7/bias/Adam*
T0*
_class
loc:@dense_7/bias
x
%dense_7/bias/Adam_1/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_7/bias*
dtype0
�
dense_7/bias/Adam_1
VariableV2*
shared_name *
_class
loc:@dense_7/bias*
dtype0*
	container *
shape:�
�
dense_7/bias/Adam_1/AssignAssigndense_7/bias/Adam_1%dense_7/bias/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense_7/bias*
validate_shape(*
use_locking(
c
dense_7/bias/Adam_1/readIdentitydense_7/bias/Adam_1*
T0*
_class
loc:@dense_7/bias
�
5dense_8/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_8/kernel*
dtype0
{
+dense_8/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_8/kernel*
dtype0
�
%dense_8/kernel/Adam/Initializer/zerosFill5dense_8/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_8/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_8/kernel
�
dense_8/kernel/Adam
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_8/kernel*
dtype0*
	container 
�
dense_8/kernel/Adam/AssignAssigndense_8/kernel/Adam%dense_8/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_8/kernel*
validate_shape(
e
dense_8/kernel/Adam/readIdentitydense_8/kernel/Adam*
T0*!
_class
loc:@dense_8/kernel
�
7dense_8/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"      *!
_class
loc:@dense_8/kernel
}
-dense_8/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *!
_class
loc:@dense_8/kernel
�
'dense_8/kernel/Adam_1/Initializer/zerosFill7dense_8/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_8/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_8/kernel
�
dense_8/kernel/Adam_1
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_8/kernel*
dtype0*
	container 
�
dense_8/kernel/Adam_1/AssignAssigndense_8/kernel/Adam_1'dense_8/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_8/kernel*
validate_shape(
i
dense_8/kernel/Adam_1/readIdentitydense_8/kernel/Adam_1*
T0*!
_class
loc:@dense_8/kernel
v
#dense_8/bias/Adam/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_8/bias*
dtype0
�
dense_8/bias/Adam
VariableV2*
_class
loc:@dense_8/bias*
dtype0*
	container *
shape:�*
shared_name 
�
dense_8/bias/Adam/AssignAssigndense_8/bias/Adam#dense_8/bias/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense_8/bias
_
dense_8/bias/Adam/readIdentitydense_8/bias/Adam*
T0*
_class
loc:@dense_8/bias
x
%dense_8/bias/Adam_1/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_8/bias*
dtype0
�
dense_8/bias/Adam_1
VariableV2*
_class
loc:@dense_8/bias*
dtype0*
	container *
shape:�*
shared_name 
�
dense_8/bias/Adam_1/AssignAssigndense_8/bias/Adam_1%dense_8/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_8/bias*
validate_shape(
c
dense_8/bias/Adam_1/readIdentitydense_8/bias/Adam_1*
T0*
_class
loc:@dense_8/bias
A
Adam_1/learning_rateConst*
dtype0*
valueB
 *RI�9
9
Adam_1/beta1Const*
dtype0*
valueB
 *fff?
9
Adam_1/beta2Const*
dtype0*
valueB
 *w�?
;
Adam_1/epsilonConst*
valueB
 *w�+2*
dtype0
�
DAdam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdam	ApplyAdam,curiosity_vector_obs_encoder/hidden_0/kernel1curiosity_vector_obs_encoder/hidden_0/kernel/Adam3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_12*
use_locking( *
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
use_nesterov( 
�
BAdam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdam	ApplyAdam*curiosity_vector_obs_encoder/hidden_0/bias/curiosity_vector_obs_encoder/hidden_0/bias/Adam1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_11*
use_nesterov( *
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
DAdam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam	ApplyAdam,curiosity_vector_obs_encoder/hidden_1/kernel1curiosity_vector_obs_encoder/hidden_1/kernel/Adam3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_8*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
use_nesterov( *
use_locking( 
�
BAdam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdam	ApplyAdam*curiosity_vector_obs_encoder/hidden_1/bias/curiosity_vector_obs_encoder/hidden_1/bias/Adam1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_7*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
use_nesterov( 
�
&Adam_1/update_dense_3/kernel/ApplyAdam	ApplyAdamdense_3/kerneldense_3/kernel/Adamdense_3/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_3/kernel*
use_nesterov( 
�
$Adam_1/update_dense_3/bias/ApplyAdam	ApplyAdamdense_3/biasdense_3/bias/Adamdense_3/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_3/bias*
use_nesterov( 
�
&Adam_1/update_dense_4/kernel/ApplyAdam	ApplyAdamdense_4/kerneldense_4/kernel/Adamdense_4/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_4/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*!
_class
loc:@dense_4/kernel
�
$Adam_1/update_dense_4/bias/ApplyAdam	ApplyAdamdense_4/biasdense_4/bias/Adamdense_4/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_4/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_4/bias*
use_nesterov( 
�
&Adam_1/update_dense_5/kernel/ApplyAdam	ApplyAdamdense_5/kerneldense_5/kernel/Adamdense_5/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_5/MatMul_grad/tuple/control_dependency_1*
T0*!
_class
loc:@dense_5/kernel*
use_nesterov( *
use_locking( 
�
$Adam_1/update_dense_5/bias/ApplyAdam	ApplyAdamdense_5/biasdense_5/bias/Adamdense_5/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_5/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*
_class
loc:@dense_5/bias
�
&Adam_1/update_dense_6/kernel/ApplyAdam	ApplyAdamdense_6/kerneldense_6/kernel/Adamdense_6/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_6/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_6/kernel*
use_nesterov( 
�
$Adam_1/update_dense_6/bias/ApplyAdam	ApplyAdamdense_6/biasdense_6/bias/Adamdense_6/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_6/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_6/bias*
use_nesterov( 
�
&Adam_1/update_dense_7/kernel/ApplyAdam	ApplyAdamdense_7/kerneldense_7/kernel/Adamdense_7/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_7/MatMul_grad/tuple/control_dependency_1*
T0*!
_class
loc:@dense_7/kernel*
use_nesterov( *
use_locking( 
�
$Adam_1/update_dense_7/bias/ApplyAdam	ApplyAdamdense_7/biasdense_7/bias/Adamdense_7/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_7/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_7/bias*
use_nesterov( 
�
&Adam_1/update_dense_8/kernel/ApplyAdam	ApplyAdamdense_8/kerneldense_8/kernel/Adamdense_8/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_8/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*!
_class
loc:@dense_8/kernel
�
$Adam_1/update_dense_8/bias/ApplyAdam	ApplyAdamdense_8/biasdense_8/bias/Adamdense_8/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_8/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*
_class
loc:@dense_8/bias
�

Adam_1/mulMulbeta1_power_1/readAdam_1/beta1C^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamC^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam%^Adam_1/update_dense_3/bias/ApplyAdam'^Adam_1/update_dense_3/kernel/ApplyAdam%^Adam_1/update_dense_4/bias/ApplyAdam'^Adam_1/update_dense_4/kernel/ApplyAdam%^Adam_1/update_dense_5/bias/ApplyAdam'^Adam_1/update_dense_5/kernel/ApplyAdam%^Adam_1/update_dense_6/bias/ApplyAdam'^Adam_1/update_dense_6/kernel/ApplyAdam%^Adam_1/update_dense_7/bias/ApplyAdam'^Adam_1/update_dense_7/kernel/ApplyAdam%^Adam_1/update_dense_8/bias/ApplyAdam'^Adam_1/update_dense_8/kernel/ApplyAdam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Adam_1/AssignAssignbeta1_power_1
Adam_1/mul*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
Adam_1/mul_1Mulbeta2_power_1/readAdam_1/beta2C^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamC^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam%^Adam_1/update_dense_3/bias/ApplyAdam'^Adam_1/update_dense_3/kernel/ApplyAdam%^Adam_1/update_dense_4/bias/ApplyAdam'^Adam_1/update_dense_4/kernel/ApplyAdam%^Adam_1/update_dense_5/bias/ApplyAdam'^Adam_1/update_dense_5/kernel/ApplyAdam%^Adam_1/update_dense_6/bias/ApplyAdam'^Adam_1/update_dense_6/kernel/ApplyAdam%^Adam_1/update_dense_7/bias/ApplyAdam'^Adam_1/update_dense_7/kernel/ApplyAdam%^Adam_1/update_dense_8/bias/ApplyAdam'^Adam_1/update_dense_8/kernel/ApplyAdam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Adam_1/Assign_1Assignbeta2_power_1Adam_1/mul_1*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
Adam_1NoOp^Adam_1/Assign^Adam_1/Assign_1C^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamC^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam%^Adam_1/update_dense_3/bias/ApplyAdam'^Adam_1/update_dense_3/kernel/ApplyAdam%^Adam_1/update_dense_4/bias/ApplyAdam'^Adam_1/update_dense_4/kernel/ApplyAdam%^Adam_1/update_dense_5/bias/ApplyAdam'^Adam_1/update_dense_5/kernel/ApplyAdam%^Adam_1/update_dense_6/bias/ApplyAdam'^Adam_1/update_dense_6/kernel/ApplyAdam%^Adam_1/update_dense_7/bias/ApplyAdam'^Adam_1/update_dense_7/kernel/ApplyAdam%^Adam_1/update_dense_8/bias/ApplyAdam'^Adam_1/update_dense_8/kernel/ApplyAdam
A
save/filename/inputConst*
valueB Bmodel*
dtype0
V
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
shape: 
M

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
shape: 
�
save/SaveV2/tensor_namesConst*�
value�B�dBVariableBaction_output_shapeBbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bcuriosity_value/biasBcuriosity_value/bias/AdamBcuriosity_value/bias/Adam_1Bcuriosity_value/kernelBcuriosity_value/kernel/AdamBcuriosity_value/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_0/biasB/curiosity_vector_obs_encoder/hidden_0/bias/AdamB1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_0/kernelB1curiosity_vector_obs_encoder/hidden_0/kernel/AdamB3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_1/biasB/curiosity_vector_obs_encoder/hidden_1/bias/AdamB1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_1/kernelB1curiosity_vector_obs_encoder/hidden_1/kernel/AdamB3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bdense_1/kernelBdense_1/kernel/AdamBdense_1/kernel/Adam_1Bdense_2/kernelBdense_2/kernel/AdamBdense_2/kernel/Adam_1Bdense_3/biasBdense_3/bias/AdamBdense_3/bias/Adam_1Bdense_3/kernelBdense_3/kernel/AdamBdense_3/kernel/Adam_1Bdense_4/biasBdense_4/bias/AdamBdense_4/bias/Adam_1Bdense_4/kernelBdense_4/kernel/AdamBdense_4/kernel/Adam_1Bdense_5/biasBdense_5/bias/AdamBdense_5/bias/Adam_1Bdense_5/kernelBdense_5/kernel/AdamBdense_5/kernel/Adam_1Bdense_6/biasBdense_6/bias/AdamBdense_6/bias/Adam_1Bdense_6/kernelBdense_6/kernel/AdamBdense_6/kernel/Adam_1Bdense_7/biasBdense_7/bias/AdamBdense_7/bias/Adam_1Bdense_7/kernelBdense_7/kernel/AdamBdense_7/kernel/Adam_1Bdense_8/biasBdense_8/bias/AdamBdense_8/bias/Adam_1Bdense_8/kernelBdense_8/kernel/AdamBdense_8/kernel/Adam_1Bextrinsic_value/biasBextrinsic_value/bias/AdamBextrinsic_value/bias/Adam_1Bextrinsic_value/kernelBextrinsic_value/kernel/AdamBextrinsic_value/kernel/Adam_1Bglobal_stepBis_continuous_controlBlstm/rnn/basic_lstm_cell/biasB"lstm/rnn/basic_lstm_cell/bias/AdamB$lstm/rnn/basic_lstm_cell/bias/Adam_1Blstm/rnn/basic_lstm_cell/kernelB$lstm/rnn/basic_lstm_cell/kernel/AdamB&lstm/rnn/basic_lstm_cell/kernel/Adam_1Bmain_graph_0/hidden_0/biasBmain_graph_0/hidden_0/bias/AdamB!main_graph_0/hidden_0/bias/Adam_1Bmain_graph_0/hidden_0/kernelB!main_graph_0/hidden_0/kernel/AdamB#main_graph_0/hidden_0/kernel/Adam_1Bmain_graph_0/hidden_1/biasBmain_graph_0/hidden_1/bias/AdamB!main_graph_0/hidden_1/bias/Adam_1Bmain_graph_0/hidden_1/kernelB!main_graph_0/hidden_1/kernel/AdamB#main_graph_0/hidden_1/kernel/Adam_1Bmemory_sizeBnormalization_stepsBrunning_meanBrunning_varianceBversion_number*
dtype0
�
save/SaveV2/shape_and_slicesConst*�
value�B�dB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariableaction_output_shapebeta1_powerbeta1_power_1beta2_powerbeta2_power_1curiosity_value/biascuriosity_value/bias/Adamcuriosity_value/bias/Adam_1curiosity_value/kernelcuriosity_value/kernel/Adamcuriosity_value/kernel/Adam_1*curiosity_vector_obs_encoder/hidden_0/bias/curiosity_vector_obs_encoder/hidden_0/bias/Adam1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1,curiosity_vector_obs_encoder/hidden_0/kernel1curiosity_vector_obs_encoder/hidden_0/kernel/Adam3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1*curiosity_vector_obs_encoder/hidden_1/bias/curiosity_vector_obs_encoder/hidden_1/bias/Adam1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1,curiosity_vector_obs_encoder/hidden_1/kernel1curiosity_vector_obs_encoder/hidden_1/kernel/Adam3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1dense/kerneldense/kernel/Adamdense/kernel/Adam_1dense_1/kerneldense_1/kernel/Adamdense_1/kernel/Adam_1dense_2/kerneldense_2/kernel/Adamdense_2/kernel/Adam_1dense_3/biasdense_3/bias/Adamdense_3/bias/Adam_1dense_3/kerneldense_3/kernel/Adamdense_3/kernel/Adam_1dense_4/biasdense_4/bias/Adamdense_4/bias/Adam_1dense_4/kerneldense_4/kernel/Adamdense_4/kernel/Adam_1dense_5/biasdense_5/bias/Adamdense_5/bias/Adam_1dense_5/kerneldense_5/kernel/Adamdense_5/kernel/Adam_1dense_6/biasdense_6/bias/Adamdense_6/bias/Adam_1dense_6/kerneldense_6/kernel/Adamdense_6/kernel/Adam_1dense_7/biasdense_7/bias/Adamdense_7/bias/Adam_1dense_7/kerneldense_7/kernel/Adamdense_7/kernel/Adam_1dense_8/biasdense_8/bias/Adamdense_8/bias/Adam_1dense_8/kerneldense_8/kernel/Adamdense_8/kernel/Adam_1extrinsic_value/biasextrinsic_value/bias/Adamextrinsic_value/bias/Adam_1extrinsic_value/kernelextrinsic_value/kernel/Adamextrinsic_value/kernel/Adam_1global_stepis_continuous_controllstm/rnn/basic_lstm_cell/bias"lstm/rnn/basic_lstm_cell/bias/Adam$lstm/rnn/basic_lstm_cell/bias/Adam_1lstm/rnn/basic_lstm_cell/kernel$lstm/rnn/basic_lstm_cell/kernel/Adam&lstm/rnn/basic_lstm_cell/kernel/Adam_1main_graph_0/hidden_0/biasmain_graph_0/hidden_0/bias/Adam!main_graph_0/hidden_0/bias/Adam_1main_graph_0/hidden_0/kernel!main_graph_0/hidden_0/kernel/Adam#main_graph_0/hidden_0/kernel/Adam_1main_graph_0/hidden_1/biasmain_graph_0/hidden_1/bias/Adam!main_graph_0/hidden_1/bias/Adam_1main_graph_0/hidden_1/kernel!main_graph_0/hidden_1/kernel/Adam#main_graph_0/hidden_1/kernel/Adam_1memory_sizenormalization_stepsrunning_meanrunning_varianceversion_number*r
dtypesh
f2d
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*�
value�B�dBVariableBaction_output_shapeBbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bcuriosity_value/biasBcuriosity_value/bias/AdamBcuriosity_value/bias/Adam_1Bcuriosity_value/kernelBcuriosity_value/kernel/AdamBcuriosity_value/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_0/biasB/curiosity_vector_obs_encoder/hidden_0/bias/AdamB1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_0/kernelB1curiosity_vector_obs_encoder/hidden_0/kernel/AdamB3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_1/biasB/curiosity_vector_obs_encoder/hidden_1/bias/AdamB1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_1/kernelB1curiosity_vector_obs_encoder/hidden_1/kernel/AdamB3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bdense_1/kernelBdense_1/kernel/AdamBdense_1/kernel/Adam_1Bdense_2/kernelBdense_2/kernel/AdamBdense_2/kernel/Adam_1Bdense_3/biasBdense_3/bias/AdamBdense_3/bias/Adam_1Bdense_3/kernelBdense_3/kernel/AdamBdense_3/kernel/Adam_1Bdense_4/biasBdense_4/bias/AdamBdense_4/bias/Adam_1Bdense_4/kernelBdense_4/kernel/AdamBdense_4/kernel/Adam_1Bdense_5/biasBdense_5/bias/AdamBdense_5/bias/Adam_1Bdense_5/kernelBdense_5/kernel/AdamBdense_5/kernel/Adam_1Bdense_6/biasBdense_6/bias/AdamBdense_6/bias/Adam_1Bdense_6/kernelBdense_6/kernel/AdamBdense_6/kernel/Adam_1Bdense_7/biasBdense_7/bias/AdamBdense_7/bias/Adam_1Bdense_7/kernelBdense_7/kernel/AdamBdense_7/kernel/Adam_1Bdense_8/biasBdense_8/bias/AdamBdense_8/bias/Adam_1Bdense_8/kernelBdense_8/kernel/AdamBdense_8/kernel/Adam_1Bextrinsic_value/biasBextrinsic_value/bias/AdamBextrinsic_value/bias/Adam_1Bextrinsic_value/kernelBextrinsic_value/kernel/AdamBextrinsic_value/kernel/Adam_1Bglobal_stepBis_continuous_controlBlstm/rnn/basic_lstm_cell/biasB"lstm/rnn/basic_lstm_cell/bias/AdamB$lstm/rnn/basic_lstm_cell/bias/Adam_1Blstm/rnn/basic_lstm_cell/kernelB$lstm/rnn/basic_lstm_cell/kernel/AdamB&lstm/rnn/basic_lstm_cell/kernel/Adam_1Bmain_graph_0/hidden_0/biasBmain_graph_0/hidden_0/bias/AdamB!main_graph_0/hidden_0/bias/Adam_1Bmain_graph_0/hidden_0/kernelB!main_graph_0/hidden_0/kernel/AdamB#main_graph_0/hidden_0/kernel/Adam_1Bmain_graph_0/hidden_1/biasBmain_graph_0/hidden_1/bias/AdamB!main_graph_0/hidden_1/bias/Adam_1Bmain_graph_0/hidden_1/kernelB!main_graph_0/hidden_1/kernel/AdamB#main_graph_0/hidden_1/kernel/Adam_1Bmemory_sizeBnormalization_stepsBrunning_meanBrunning_varianceBversion_number
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*�
value�B�dB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*r
dtypesh
f2d
~
save/AssignAssignVariablesave/RestoreV2*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(
�
save/Assign_1Assignaction_output_shapesave/RestoreV2:1*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(
�
save/Assign_2Assignbeta1_powersave/RestoreV2:2*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
�
save/Assign_3Assignbeta1_power_1save/RestoreV2:3*
validate_shape(*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
save/Assign_4Assignbeta2_powersave/RestoreV2:4*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(*
use_locking(
�
save/Assign_5Assignbeta2_power_1save/RestoreV2:5*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save/Assign_6Assigncuriosity_value/biassave/RestoreV2:6*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(*
use_locking(
�
save/Assign_7Assigncuriosity_value/bias/Adamsave/RestoreV2:7*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
�
save/Assign_8Assigncuriosity_value/bias/Adam_1save/RestoreV2:8*
validate_shape(*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias
�
save/Assign_9Assigncuriosity_value/kernelsave/RestoreV2:9*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
�
save/Assign_10Assigncuriosity_value/kernel/Adamsave/RestoreV2:10*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
�
save/Assign_11Assigncuriosity_value/kernel/Adam_1save/RestoreV2:11*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
�
save/Assign_12Assign*curiosity_vector_obs_encoder/hidden_0/biassave/RestoreV2:12*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save/Assign_13Assign/curiosity_vector_obs_encoder/hidden_0/bias/Adamsave/RestoreV2:13*
validate_shape(*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
save/Assign_14Assign1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1save/RestoreV2:14*
validate_shape(*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
save/Assign_15Assign,curiosity_vector_obs_encoder/hidden_0/kernelsave/RestoreV2:15*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
save/Assign_16Assign1curiosity_vector_obs_encoder/hidden_0/kernel/Adamsave/RestoreV2:16*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
save/Assign_17Assign3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1save/RestoreV2:17*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
save/Assign_18Assign*curiosity_vector_obs_encoder/hidden_1/biassave/RestoreV2:18*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
save/Assign_19Assign/curiosity_vector_obs_encoder/hidden_1/bias/Adamsave/RestoreV2:19*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
save/Assign_20Assign1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1save/RestoreV2:20*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(*
use_locking(
�
save/Assign_21Assign,curiosity_vector_obs_encoder/hidden_1/kernelsave/RestoreV2:21*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
save/Assign_22Assign1curiosity_vector_obs_encoder/hidden_1/kernel/Adamsave/RestoreV2:22*
validate_shape(*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
save/Assign_23Assign3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1save/RestoreV2:23*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
save/Assign_24Assigndense/kernelsave/RestoreV2:24*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
�
save/Assign_25Assigndense/kernel/Adamsave/RestoreV2:25*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense/kernel
�
save/Assign_26Assigndense/kernel/Adam_1save/RestoreV2:26*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
�
save/Assign_27Assigndense_1/kernelsave/RestoreV2:27*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_1/kernel
�
save/Assign_28Assigndense_1/kernel/Adamsave/RestoreV2:28*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(*
use_locking(
�
save/Assign_29Assigndense_1/kernel/Adam_1save/RestoreV2:29*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_1/kernel
�
save/Assign_30Assigndense_2/kernelsave/RestoreV2:30*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(*
use_locking(
�
save/Assign_31Assigndense_2/kernel/Adamsave/RestoreV2:31*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
�
save/Assign_32Assigndense_2/kernel/Adam_1save/RestoreV2:32*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
�
save/Assign_33Assigndense_3/biassave/RestoreV2:33*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
�
save/Assign_34Assigndense_3/bias/Adamsave/RestoreV2:34*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
�
save/Assign_35Assigndense_3/bias/Adam_1save/RestoreV2:35*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
�
save/Assign_36Assigndense_3/kernelsave/RestoreV2:36*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(*
use_locking(
�
save/Assign_37Assigndense_3/kernel/Adamsave/RestoreV2:37*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
�
save/Assign_38Assigndense_3/kernel/Adam_1save/RestoreV2:38*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_3/kernel
�
save/Assign_39Assigndense_4/biassave/RestoreV2:39*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
�
save/Assign_40Assigndense_4/bias/Adamsave/RestoreV2:40*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
�
save/Assign_41Assigndense_4/bias/Adam_1save/RestoreV2:41*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense_4/bias
�
save/Assign_42Assigndense_4/kernelsave/RestoreV2:42*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
�
save/Assign_43Assigndense_4/kernel/Adamsave/RestoreV2:43*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
�
save/Assign_44Assigndense_4/kernel/Adam_1save/RestoreV2:44*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
�
save/Assign_45Assigndense_5/biassave/RestoreV2:45*
use_locking(*
T0*
_class
loc:@dense_5/bias*
validate_shape(
�
save/Assign_46Assigndense_5/bias/Adamsave/RestoreV2:46*
T0*
_class
loc:@dense_5/bias*
validate_shape(*
use_locking(
�
save/Assign_47Assigndense_5/bias/Adam_1save/RestoreV2:47*
T0*
_class
loc:@dense_5/bias*
validate_shape(*
use_locking(
�
save/Assign_48Assigndense_5/kernelsave/RestoreV2:48*
T0*!
_class
loc:@dense_5/kernel*
validate_shape(*
use_locking(
�
save/Assign_49Assigndense_5/kernel/Adamsave/RestoreV2:49*
T0*!
_class
loc:@dense_5/kernel*
validate_shape(*
use_locking(
�
save/Assign_50Assigndense_5/kernel/Adam_1save/RestoreV2:50*
T0*!
_class
loc:@dense_5/kernel*
validate_shape(*
use_locking(
�
save/Assign_51Assigndense_6/biassave/RestoreV2:51*
use_locking(*
T0*
_class
loc:@dense_6/bias*
validate_shape(
�
save/Assign_52Assigndense_6/bias/Adamsave/RestoreV2:52*
T0*
_class
loc:@dense_6/bias*
validate_shape(*
use_locking(
�
save/Assign_53Assigndense_6/bias/Adam_1save/RestoreV2:53*
T0*
_class
loc:@dense_6/bias*
validate_shape(*
use_locking(
�
save/Assign_54Assigndense_6/kernelsave/RestoreV2:54*
use_locking(*
T0*!
_class
loc:@dense_6/kernel*
validate_shape(
�
save/Assign_55Assigndense_6/kernel/Adamsave/RestoreV2:55*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_6/kernel
�
save/Assign_56Assigndense_6/kernel/Adam_1save/RestoreV2:56*
T0*!
_class
loc:@dense_6/kernel*
validate_shape(*
use_locking(
�
save/Assign_57Assigndense_7/biassave/RestoreV2:57*
validate_shape(*
use_locking(*
T0*
_class
loc:@dense_7/bias
�
save/Assign_58Assigndense_7/bias/Adamsave/RestoreV2:58*
use_locking(*
T0*
_class
loc:@dense_7/bias*
validate_shape(
�
save/Assign_59Assigndense_7/bias/Adam_1save/RestoreV2:59*
use_locking(*
T0*
_class
loc:@dense_7/bias*
validate_shape(
�
save/Assign_60Assigndense_7/kernelsave/RestoreV2:60*
use_locking(*
T0*!
_class
loc:@dense_7/kernel*
validate_shape(
�
save/Assign_61Assigndense_7/kernel/Adamsave/RestoreV2:61*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_7/kernel
�
save/Assign_62Assigndense_7/kernel/Adam_1save/RestoreV2:62*
use_locking(*
T0*!
_class
loc:@dense_7/kernel*
validate_shape(
�
save/Assign_63Assigndense_8/biassave/RestoreV2:63*
T0*
_class
loc:@dense_8/bias*
validate_shape(*
use_locking(
�
save/Assign_64Assigndense_8/bias/Adamsave/RestoreV2:64*
use_locking(*
T0*
_class
loc:@dense_8/bias*
validate_shape(
�
save/Assign_65Assigndense_8/bias/Adam_1save/RestoreV2:65*
T0*
_class
loc:@dense_8/bias*
validate_shape(*
use_locking(
�
save/Assign_66Assigndense_8/kernelsave/RestoreV2:66*
T0*!
_class
loc:@dense_8/kernel*
validate_shape(*
use_locking(
�
save/Assign_67Assigndense_8/kernel/Adamsave/RestoreV2:67*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_8/kernel
�
save/Assign_68Assigndense_8/kernel/Adam_1save/RestoreV2:68*
validate_shape(*
use_locking(*
T0*!
_class
loc:@dense_8/kernel
�
save/Assign_69Assignextrinsic_value/biassave/RestoreV2:69*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(*
use_locking(
�
save/Assign_70Assignextrinsic_value/bias/Adamsave/RestoreV2:70*
validate_shape(*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias
�
save/Assign_71Assignextrinsic_value/bias/Adam_1save/RestoreV2:71*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
�
save/Assign_72Assignextrinsic_value/kernelsave/RestoreV2:72*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
�
save/Assign_73Assignextrinsic_value/kernel/Adamsave/RestoreV2:73*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
�
save/Assign_74Assignextrinsic_value/kernel/Adam_1save/RestoreV2:74*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
�
save/Assign_75Assignglobal_stepsave/RestoreV2:75*
validate_shape(*
use_locking(*
T0*
_class
loc:@global_step
�
save/Assign_76Assignis_continuous_controlsave/RestoreV2:76*
validate_shape(*
use_locking(*
T0*(
_class
loc:@is_continuous_control
�
save/Assign_77Assignlstm/rnn/basic_lstm_cell/biassave/RestoreV2:77*
use_locking(*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
validate_shape(
�
save/Assign_78Assign"lstm/rnn/basic_lstm_cell/bias/Adamsave/RestoreV2:78*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
validate_shape(*
use_locking(
�
save/Assign_79Assign$lstm/rnn/basic_lstm_cell/bias/Adam_1save/RestoreV2:79*
use_locking(*
T0*0
_class&
$"loc:@lstm/rnn/basic_lstm_cell/bias*
validate_shape(
�
save/Assign_80Assignlstm/rnn/basic_lstm_cell/kernelsave/RestoreV2:80*
use_locking(*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save/Assign_81Assign$lstm/rnn/basic_lstm_cell/kernel/Adamsave/RestoreV2:81*
use_locking(*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save/Assign_82Assign&lstm/rnn/basic_lstm_cell/kernel/Adam_1save/RestoreV2:82*
T0*2
_class(
&$loc:@lstm/rnn/basic_lstm_cell/kernel*
validate_shape(*
use_locking(
�
save/Assign_83Assignmain_graph_0/hidden_0/biassave/RestoreV2:83*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
�
save/Assign_84Assignmain_graph_0/hidden_0/bias/Adamsave/RestoreV2:84*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
�
save/Assign_85Assign!main_graph_0/hidden_0/bias/Adam_1save/RestoreV2:85*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
�
save/Assign_86Assignmain_graph_0/hidden_0/kernelsave/RestoreV2:86*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(
�
save/Assign_87Assign!main_graph_0/hidden_0/kernel/Adamsave/RestoreV2:87*
validate_shape(*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
save/Assign_88Assign#main_graph_0/hidden_0/kernel/Adam_1save/RestoreV2:88*
validate_shape(*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
�
save/Assign_89Assignmain_graph_0/hidden_1/biassave/RestoreV2:89*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(*
use_locking(
�
save/Assign_90Assignmain_graph_0/hidden_1/bias/Adamsave/RestoreV2:90*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(*
use_locking(
�
save/Assign_91Assign!main_graph_0/hidden_1/bias/Adam_1save/RestoreV2:91*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(
�
save/Assign_92Assignmain_graph_0/hidden_1/kernelsave/RestoreV2:92*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(*
use_locking(
�
save/Assign_93Assign!main_graph_0/hidden_1/kernel/Adamsave/RestoreV2:93*
validate_shape(*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
�
save/Assign_94Assign#main_graph_0/hidden_1/kernel/Adam_1save/RestoreV2:94*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(
�
save/Assign_95Assignmemory_sizesave/RestoreV2:95*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(
�
save/Assign_96Assignnormalization_stepssave/RestoreV2:96*
T0*&
_class
loc:@normalization_steps*
validate_shape(*
use_locking(
�
save/Assign_97Assignrunning_meansave/RestoreV2:97*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
�
save/Assign_98Assignrunning_variancesave/RestoreV2:98*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
�
save/Assign_99Assignversion_numbersave/RestoreV2:99*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
�
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_3^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33^save/Assign_34^save/Assign_35^save/Assign_36^save/Assign_37^save/Assign_38^save/Assign_39^save/Assign_4^save/Assign_40^save/Assign_41^save/Assign_42^save/Assign_43^save/Assign_44^save/Assign_45^save/Assign_46^save/Assign_47^save/Assign_48^save/Assign_49^save/Assign_5^save/Assign_50^save/Assign_51^save/Assign_52^save/Assign_53^save/Assign_54^save/Assign_55^save/Assign_56^save/Assign_57^save/Assign_58^save/Assign_59^save/Assign_6^save/Assign_60^save/Assign_61^save/Assign_62^save/Assign_63^save/Assign_64^save/Assign_65^save/Assign_66^save/Assign_67^save/Assign_68^save/Assign_69^save/Assign_7^save/Assign_70^save/Assign_71^save/Assign_72^save/Assign_73^save/Assign_74^save/Assign_75^save/Assign_76^save/Assign_77^save/Assign_78^save/Assign_79^save/Assign_8^save/Assign_80^save/Assign_81^save/Assign_82^save/Assign_83^save/Assign_84^save/Assign_85^save/Assign_86^save/Assign_87^save/Assign_88^save/Assign_89^save/Assign_9^save/Assign_90^save/Assign_91^save/Assign_92^save/Assign_93^save/Assign_94^save/Assign_95^save/Assign_96^save/Assign_97^save/Assign_98^save/Assign_99
�
initNoOp^Variable/Assign^action_output_shape/Assign^beta1_power/Assign^beta1_power_1/Assign^beta2_power/Assign^beta2_power_1/Assign!^curiosity_value/bias/Adam/Assign#^curiosity_value/bias/Adam_1/Assign^curiosity_value/bias/Assign#^curiosity_value/kernel/Adam/Assign%^curiosity_value/kernel/Adam_1/Assign^curiosity_value/kernel/Assign7^curiosity_vector_obs_encoder/hidden_0/bias/Adam/Assign9^curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/Assign2^curiosity_vector_obs_encoder/hidden_0/bias/Assign9^curiosity_vector_obs_encoder/hidden_0/kernel/Adam/Assign;^curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Assign4^curiosity_vector_obs_encoder/hidden_0/kernel/Assign7^curiosity_vector_obs_encoder/hidden_1/bias/Adam/Assign9^curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/Assign2^curiosity_vector_obs_encoder/hidden_1/bias/Assign9^curiosity_vector_obs_encoder/hidden_1/kernel/Adam/Assign;^curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Assign4^curiosity_vector_obs_encoder/hidden_1/kernel/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/kernel/Assign^dense_1/kernel/Adam/Assign^dense_1/kernel/Adam_1/Assign^dense_1/kernel/Assign^dense_2/kernel/Adam/Assign^dense_2/kernel/Adam_1/Assign^dense_2/kernel/Assign^dense_3/bias/Adam/Assign^dense_3/bias/Adam_1/Assign^dense_3/bias/Assign^dense_3/kernel/Adam/Assign^dense_3/kernel/Adam_1/Assign^dense_3/kernel/Assign^dense_4/bias/Adam/Assign^dense_4/bias/Adam_1/Assign^dense_4/bias/Assign^dense_4/kernel/Adam/Assign^dense_4/kernel/Adam_1/Assign^dense_4/kernel/Assign^dense_5/bias/Adam/Assign^dense_5/bias/Adam_1/Assign^dense_5/bias/Assign^dense_5/kernel/Adam/Assign^dense_5/kernel/Adam_1/Assign^dense_5/kernel/Assign^dense_6/bias/Adam/Assign^dense_6/bias/Adam_1/Assign^dense_6/bias/Assign^dense_6/kernel/Adam/Assign^dense_6/kernel/Adam_1/Assign^dense_6/kernel/Assign^dense_7/bias/Adam/Assign^dense_7/bias/Adam_1/Assign^dense_7/bias/Assign^dense_7/kernel/Adam/Assign^dense_7/kernel/Adam_1/Assign^dense_7/kernel/Assign^dense_8/bias/Adam/Assign^dense_8/bias/Adam_1/Assign^dense_8/bias/Assign^dense_8/kernel/Adam/Assign^dense_8/kernel/Adam_1/Assign^dense_8/kernel/Assign!^extrinsic_value/bias/Adam/Assign#^extrinsic_value/bias/Adam_1/Assign^extrinsic_value/bias/Assign#^extrinsic_value/kernel/Adam/Assign%^extrinsic_value/kernel/Adam_1/Assign^extrinsic_value/kernel/Assign^global_step/Assign^is_continuous_control/Assign*^lstm/rnn/basic_lstm_cell/bias/Adam/Assign,^lstm/rnn/basic_lstm_cell/bias/Adam_1/Assign%^lstm/rnn/basic_lstm_cell/bias/Assign,^lstm/rnn/basic_lstm_cell/kernel/Adam/Assign.^lstm/rnn/basic_lstm_cell/kernel/Adam_1/Assign'^lstm/rnn/basic_lstm_cell/kernel/Assign'^main_graph_0/hidden_0/bias/Adam/Assign)^main_graph_0/hidden_0/bias/Adam_1/Assign"^main_graph_0/hidden_0/bias/Assign)^main_graph_0/hidden_0/kernel/Adam/Assign+^main_graph_0/hidden_0/kernel/Adam_1/Assign$^main_graph_0/hidden_0/kernel/Assign'^main_graph_0/hidden_1/bias/Adam/Assign)^main_graph_0/hidden_1/bias/Adam_1/Assign"^main_graph_0/hidden_1/bias/Assign)^main_graph_0/hidden_1/kernel/Adam/Assign+^main_graph_0/hidden_1/kernel/Adam_1/Assign$^main_graph_0/hidden_1/kernel/Assign^memory_size/Assign^normalization_steps/Assign^running_mean/Assign^running_variance/Assign^version_number/Assign"w