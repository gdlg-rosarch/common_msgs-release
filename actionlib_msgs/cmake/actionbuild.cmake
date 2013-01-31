# THIS FILE CANNOT BE MOVED.  Users include it like so:
#     rosbuild_find_ros_package(actionlib_msgs)
#     include(${actionlib_msgs_PACKAGE_PATH}/cmake/actionbuild.cmake)

macro(get_actions actionvar)
  file(GLOB _action_files RELATIVE "${PROJECT_SOURCE_DIR}/action" "${PROJECT_SOURCE_DIR}/action/*.action")
  message(STATUS "Action Files:" ${_action_files})
  foreach(_action ${_action_files})
    if(${_action} MATCHES "^[^\\.].*\\.action$")
      list(APPEND ${actionvar} ${_action})
    endif(${_action} MATCHES "^[^\\.].*\\.action$")
  endforeach(_action)
endmacro(get_actions)

macro(genaction)
  if(ROSBUILD_init_called)
    message(FATAL_ERROR "genaction() cannot be called after rosbuild_init(), please change the order in your CMakeLists.txt file.")
  endif(ROSBUILD_init_called)
  get_actions(_actionlist)
  set(_autogen "")
  set(_autogen_msg_list "")
  foreach(_action ${_actionlist})
    message(STATUS "Generating Messages for Action" ${_action})
    #construct the path to the .action file
    set(_input ${PROJECT_SOURCE_DIR}/action/${_action})

    string(REPLACE ".action" "" _action_bare ${_action})

    rosbuild_find_ros_package(actionlib_msgs)
    set(genaction_exe ${actionlib_msgs_PACKAGE_PATH}/scripts/genaction.py)

    #We have to do this because message generation assumes filenames without full paths
    set(_base_output_action ${_action_bare}Action.msg)
    set(_base_output_goal ${_action_bare}Goal.msg)
    set(_base_output_action_goal ${_action_bare}ActionGoal.msg)
    set(_base_output_result ${_action_bare}Result.msg)
    set(_base_output_action_result ${_action_bare}ActionResult.msg)
    set(_base_output_feedback ${_action_bare}Feedback.msg)
    set(_base_output_action_feedback ${_action_bare}ActionFeedback.msg)
   
    set(_output_action ${PROJECT_SOURCE_DIR}/msg/${_base_output_action})
    set(_output_goal ${PROJECT_SOURCE_DIR}/msg/${_base_output_goal})
    set(_output_action_goal ${PROJECT_SOURCE_DIR}/msg/${_base_output_action_goal})
    set(_output_result ${PROJECT_SOURCE_DIR}/msg/${_base_output_result})
    set(_output_action_result ${PROJECT_SOURCE_DIR}/msg/${_base_output_action_result})
    set(_output_feedback ${PROJECT_SOURCE_DIR}/msg/${_base_output_feedback})
    set(_output_action_feedback ${PROJECT_SOURCE_DIR}/msg/${_base_output_action_feedback})
    message(STATUS ${_output_action})

    add_custom_command(
      OUTPUT ${_output_action} ${_output_goal} ${_output_action_goal} ${_output_result} ${_output_action_result} ${_output_feedback} ${_output_action_feedback} 
      COMMAND ${genaction_exe} ${_input} -o ${PROJECT_SOURCE_DIR}/msg
      DEPENDS ${_input} ${genaction_exe} ${ROS_MANIFEST_LIST}
    )
    list(APPEND _autogen ${_output_action} ${_output_goal} ${_output_action_goal} ${_output_result} ${_output_action_result} ${_output_feedback} ${_output_action_feedback})
    list(APPEND _autogen_msg_list ${_base_output_action} ${_base_output_goal} ${_base_output_action_goal} ${_base_output_result} ${_base_output_action_result} ${_base_output_feedback} ${_base_output_action_feedback})
  endforeach(_action)

  # Create a target that depends on the union of all the autogenerated files
  add_custom_target(ROSBUILD_genaction_msgs ALL DEPENDS ${_autogen})
  add_custom_target(rosbuild_premsgsrvgen)
  add_dependencies(rosbuild_premsgsrvgen ROSBUILD_genaction_msgs)
  rosbuild_add_generated_msgs(${_autogen_msg_list})
endmacro(genaction)
