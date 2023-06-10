#!/usr/bin/env python3

###############################################################################################
# This script does the following                                                              #
#   1. Open rofi containing all available workspace numbers                                   #
#   2. Wait for the user to select a workspace in rofi                                        #
#   3. Swap all windows from the current workspace with all windows                           #
#      of the selected one                                                                    #
#                                                                                             #
# Sample installation within i3:                                                              #
#   bindsym $mod+p exec --no-startup-id "rofi -show swaps -modi swaps:~/.local/bin/swaps.py"  #
###############################################################################################

import sys
import i3ipc

i3 = i3ipc.Connection()
i3_tree = i3.get_tree()

focused = i3_tree.find_focused()
current = focused.workspace().name


def print_workspaces():
    '''
    Print information for each available workspace within the i3_tree.
    '''
    for workspace in sorted(i3_tree.workspaces(), key=lambda x: int(x.name)):

        if workspace.name == current:
            continue

        print(f'Workspace: {workspace.name}')


def swap_workspace(workspace_id):
    '''
    Swaps all windows from the currently focused workspace with all windows
    from the workspace defined by workspace_id.
    '''
    other_nodes = set()
    current_nodes = set()

    for node in i3_tree:

        if node.window and node.parent.type != 'dockarea':
            if node.workspace().name == current:
                current_nodes.add(node)

            elif node.workspace().name == workspace_id:
                other_nodes.add(node) 

    for node in current_nodes:
        i3.command(f"[id={node.window}] move to workspace {workspace_id}")

    for node in other_nodes:
        i3.command(f"[id={node.window}] move to workspace {current}")


if len(sys.argv) == 1:
    print_workspaces()

else:
    selection = sys.argv[1]
    workspace_id = selection.split()[-1]

    if not workspace_id.isnumeric():
        raise ValueError(f"Workspace ID ({workspace_id}) is not numeric.")

    swap_workspace(workspace_id)
