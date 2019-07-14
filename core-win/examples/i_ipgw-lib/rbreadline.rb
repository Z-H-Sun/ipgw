class Fixnum
   def ord; self; end
end
module RbReadline
   require 'etc'
   RL_LIBRARY_VERSION = "5.2"
   RL_READLINE_VERSION  = 0x0502
   RB_READLINE_VERSION = "0.4.0"
   EOF = "\xFF"
   ESC = "\C-["
   PAGE = "\C-L"
   SPACE = "\x20"
   RETURN = "\C-M"
   ABORT_CHAR = "\C-G"
   TAB = "\t"
   RUBOUT = "\x7f"
   NEWLINE = "\n"
   DEFAULT_BUFFER_SIZE = 256
   DEFAULT_MAX_KILLS = 10
   MB_FIND_NONZERO = 1
   MB_FIND_ANY = 0
   MB_LEN_MAX = 4
   DEFAULT_INPUTRC = "~/.inputrc"
   SYS_INPUTRC = "/etc/inputrc"
   UpCase = 1
   DownCase = 2
   CapCase = 3
   EVENT_NOT_FOUND = 0
   BAD_WORD_SPEC  = 1
   SUBST_FAILED   = 2
   BAD_MODIFIER   = 3
   NO_PREV_SUBST  = 4
   ANCHORED_SEARCH = 1
   NON_ANCHORED_SEARCH = 0
   HISTORY_APPEND = 0
   HISTORY_OVERWRITE = 1
   READERR = 0xFE.chr
   RL_PROMPT_START_IGNORE    = 1.chr
   RL_PROMPT_END_IGNORE    = 2.chr
   NO_MATCH      =  0
   SINGLE_MATCH  =  1
   MULT_MATCH    =  2
   NUM_SAWMINUS   = 0x01
   NUM_SAWDIGITS = 0x02
   NUM_READONE = 0x04
   KSEQ_DISPATCHED = 0x01
   KSEQ_SUBSEQ = 0x02
   KSEQ_RECURSIVE = 0x04
   RL_STATE_NONE        = 0x000000
   RL_STATE_INITIALIZING =    0x000001
   RL_STATE_INITIALIZED  =    0x000002
   RL_STATE_TERMPREPPED  =    0x000004
   RL_STATE_READCMD =    0x000008
   RL_STATE_METANEXT =    0x000010
   RL_STATE_DISPATCHING =    0x000020
   RL_STATE_MOREINPUT    = 0x000040
   RL_STATE_ISEARCH    = 0x000080
   RL_STATE_NSEARCH    = 0x000100
   RL_STATE_SEARCH        = 0x000200
   RL_STATE_NUMERICARG    = 0x000400
   RL_STATE_MACROINPUT    = 0x000800
   RL_STATE_MACRODEF    = 0x001000
   RL_STATE_OVERWRITE    = 0x002000
   RL_STATE_COMPLETING    = 0x004000
   RL_STATE_SIGHANDLER    = 0x008000
   RL_STATE_UNDOING    = 0x010000
   RL_STATE_INPUTPENDING =    0x020000
   RL_STATE_TTYCSAVED     = 0x040000
   RL_STATE_CALLBACK     = 0x080000
   RL_STATE_VIMOTION     = 0x100000
   RL_STATE_MULTIKEY     = 0x200000
   RL_STATE_VICMDONCE     = 0x400000
   RL_STATE_DONE        = 0x800000
   NO_BELL = 0
   AUDIBLE_BELL = 1
   VISIBLE_BELL = 2
   UNDO_DELETE, UNDO_INSERT, UNDO_BEGIN, UNDO_END  = 0,1,2,3
   FTO   =  1
   BTO   = -1
   FFIND =  2
   BFIND = -2
   RL_QF_SINGLE_QUOTE   = 0x01
   RL_QF_DOUBLE_QUOTE   = 0x02
   RL_QF_BACKSLASH      = 0x04
   RL_QF_OTHER_QUOTE = 0x08
   KEYMAP_SIZE = 257
   ANYOTHERKEY = KEYMAP_SIZE-1
   @hConsoleHandle = nil
   @MessageBeep = nil
   RL_IM_INSERT    = 1
   RL_IM_OVERWRITE    = 0
   RL_IM_DEFAULT    = RL_IM_INSERT
   @no_mode = -1
   @vi_mode = 0
   @emacs_mode = 1
   ISFUNC = 0
   ISKMAP = 1
   ISMACR = 2
   HISTORY_WORD_DELIMITERS    = " \t\n;&()|<>"
   HISTORY_QUOTE_CHARACTERS   = "\"'`"
   RL_SEARCH_ISEARCH = 0x01
   RL_SEARCH_NSEARCH = 0x02
   RL_SEARCH_CSEARCH = 0x04
   SF_REVERSE     = 0x01
   SF_FOUND    = 0x02
   SF_FAILED      = 0x04
   @slashify_in_quotes = "\\`\"$"
   @sigint_proc = nil
   @sigint_blocked = false
   @rl_prep_term_function = :rl_prep_terminal
   @rl_deprep_term_function = :rl_deprep_terminal
   @_rl_history_saved_point = -1
   @rl_max_kills =  DEFAULT_MAX_KILLS
   @rl_kill_ring = nil
   @rl_kill_index = 0
   @rl_kill_ring_length = 0
   @pending_bytes = ''
   @stored_count = 0
   @_rl_isearch_terminators = nil
   @_rl_iscxt = nil
   @last_isearch_string = nil
   @last_isearch_string_len = 0
   @default_isearch_terminators = "\033\012"
   @_rl_history_preserve_point = false
   @terminal_prepped = false
   @otio = nil
   @msg_saved_prompt = false
   @_rl_nscxt = nil
   @noninc_search_string = nil
   @noninc_history_pos = 0
   @prev_line_found = nil
   rl_history_search_len = 0
   rl_history_search_pos = 0
   history_search_string = nil
   history_string_size = 0
   @_rl_tty_chars = Struct.new(:t_eol,:t_eol2,:t_erase,:t_werase,:t_kill,:t_reprint,:t_intr,:t_eof,
   :t_quit,:t_susp,:t_dsusp,:t_start,:t_stop,:t_lnext,:t_flush,:t_status).new
   @_rl_last_tty_chars = nil
   @_keyboard_input_timeout = 0.001
   @history_expansion_char = "!"
   @history_subst_char = "^"
   @history_comment_char = 0.chr
   @history_no_expand_chars = " \t\n\r="
   @history_quotes_inhibit_expansion = 0
   @history_word_delimiters = HISTORY_WORD_DELIMITERS
   @history_inhibit_expansion_function = nil
   @rl_event_hook = nil
   @_rl_last_c_pos = 0
   @_rl_last_v_pos = 0
   @cpos_adjusted = false
   @cpos_buffer_position = 0
   @_rl_vis_botlin = 0
   @last_lmargin = 0
   @visible_line = nil
   @invisible_line = nil
   @msg_buf = 0.chr * 128
   @forced_display = false
   @line_size = 1024
   @local_prompt = nil
   @local_prompt_prefix = nil
   @local_prompt_len = 0
   @prompt_visible_length = 0
   @prompt_prefix_length = 0
   @visible_wrap_offset = 0
   @wrap_offset = 0
   @prompt_last_invisible = 0
   @visible_first_line_len = 0
   @prompt_invis_chars_first_line = 0
   @prompt_last_screen_line = 0
   @prompt_physical_chars = 0
   @saved_local_prompt = nil
   @saved_local_prefix = nil
   @saved_last_invisible =  0
   @saved_visible_length = 0
   @saved_prefix_length = 0
   @saved_local_length = 0
   @saved_invis_chars_first_line = 0
   @saved_physical_chars = 0
   @inv_lbreaks = nil
   @vis_lbreaks = nil
   @_rl_wrapped_line = nil
   @term_buffer = nil
   @term_string_buffer = nil
   @tcap_initialized = false
   @_rl_saved_line_for_history = nil
   @the_history = nil
   @history_base = 1
   @history_stifled = false
   @history_max_entries = 0
   @max_input_history = 0
   @history_offset = 0
   @history_length = 0
   @_rl_vi_last_command = 'i'
   @_rl_vi_doing_insert = 0
   @vi_motion = " hl^$0ftFT;,%wbeWBE|"
   @vi_replace_map = nil
   @vi_replace_count = 0
   @vi_continued_command = false
   @vi_insert_buffer = nil
   @vi_insert_buffer_size = 0
   @_rl_vi_last_repeat = 1
   @_rl_vi_last_arg_sign = 1
   @_rl_vi_last_motion = 0
   @_rl_vi_last_search_char = 0
   @_rl_vi_last_replacement = 0
   @_rl_vi_last_key_before_insert = 0
   @vi_redoing = 0
   @vi_textmod = "_*\\AaIiCcDdPpYyRrSsXx~"
   @vi_mark_chars = Array.new(26,-1)
   @emacs_standard_keymap = {
      "\C-@" => :rl_set_mark  ,
      "\C-a" => :rl_beg_of_line  ,
      "\C-b" => :rl_backward_char  ,
      "\C-d" => :rl_delete  ,
      "\C-e" => :rl_end_of_line  ,
      "\C-f" => :rl_forward_char  ,
      "\C-g" => :rl_abort  ,
      "\C-h" => :rl_rubout  ,
      "\C-i" => :rl_complete  ,
      "\C-j" => :rl_newline  ,
      "\C-k" => :rl_kill_line  ,
      "\C-l" => :rl_clear_screen  ,
      "\C-m" => :rl_newline  ,
      "\C-n" => :rl_get_next_history  ,
      "\C-p" => :rl_get_previous_history  ,
      "\C-q" => :rl_quoted_insert  ,
      "\C-r" => :rl_reverse_search_history  ,
      "\C-s" => :rl_forward_search_history  ,
      "\C-t" => :rl_transpose_chars  ,
      "\C-u" => :rl_unix_line_discard  ,
      "\C-v" => :rl_quoted_insert  ,
      "\C-w" => :rl_unix_word_rubout  ,
      "\C-y" => :rl_yank  ,
      "\C-]" => :rl_char_search  ,
      "\C-_" => :rl_undo_command  ,
      "\x7F" => :rl_rubout ,
      "\e\C-g" => :rl_abort  ,
      "\e\C-h" => :rl_backward_kill_word  ,
      "\e\C-i" => :rl_tab_insert  ,
      "\e\C-j" => :rl_vi_editing_mode  ,
      "\e\C-m" => :rl_vi_editing_mode  ,
      "\e\C-r" => :rl_revert_line  ,
      "\e\C-y" => :rl_yank_nth_arg  ,
      "\e\C-[" => :rl_complete  ,
      "\e\C-]" => :rl_backward_char_search  ,
      "\e " => :rl_set_mark  ,
      "\e#" => :rl_insert_comment  ,
      "\e&" => :rl_tilde_expand  ,
      "\e*" => :rl_insert_completions  ,
      "\e-" => :rl_digit_argument  ,
      "\e." => :rl_yank_last_arg ,
      "\e0" => :rl_digit_argument  ,
      "\e1" => :rl_digit_argument  ,
      "\e2" => :rl_digit_argument  ,
      "\e3" => :rl_digit_argument  ,
      "\e4" => :rl_digit_argument  ,
      "\e5" => :rl_digit_argument  ,
      "\e6" => :rl_digit_argument  ,
      "\e7" => :rl_digit_argument  ,
      "\e8" => :rl_digit_argument  ,
      "\e9" => :rl_digit_argument  ,
      "\e<" => :rl_beginning_of_history  ,
      "\e=" => :rl_possible_completions  ,
      "\e>" => :rl_end_of_history  ,
      "\e?" => :rl_possible_completions  ,
      "\eB" => :rl_backward_word  ,
      "\eC" => :rl_capitalize_word  ,
      "\eD" => :rl_kill_word  ,
      "\eF" => :rl_forward_word  ,
      "\eL" => :rl_downcase_word  ,
      "\eN" => :rl_noninc_forward_search  ,
      "\eP" => :rl_noninc_reverse_search  ,
      "\eR" => :rl_revert_line  ,
      "\eT" => :rl_transpose_words  ,
      "\eU" => :rl_upcase_word  ,
      "\eY" => :rl_yank_pop  ,
      "\e\\" => :rl_delete_horizontal_space  ,
      "\e_" => :rl_yank_last_arg  ,
      "\eb" => :rl_backward_word  ,
      "\ec" => :rl_capitalize_word  ,
      "\ed" => :rl_kill_word  ,
      "\ef" => :rl_forward_word  ,
      "\el" => :rl_downcase_word  ,
      "\en" => :rl_noninc_forward_search  ,
      "\ep" => :rl_noninc_reverse_search  ,
      "\er" => :rl_revert_line  ,
      "\et" => :rl_transpose_words  ,
      "\eu" => :rl_upcase_word  ,
      "\ey" => :rl_yank_pop  ,
      "\e~" => :rl_tilde_expand  ,
      "\377" => :rl_backward_kill_word  ,
      "\C-x\C-g" => :rl_abort  ,
      "\C-x\C-r" => :rl_re_read_init_file  ,
      "\C-x\C-u" => :rl_undo_command  ,
      "\C-x\C-x" => :rl_exchange_point_and_mark  ,
      "\C-x(" => :rl_start_kbd_macro  ,
      "\C-x)" => :rl_end_kbd_macro   ,
      "\C-xE" => :rl_call_last_kbd_macro  ,
      "\C-xe" => :rl_call_last_kbd_macro  ,
      "\C-x\x7F" => :rl_backward_kill_line
   }
   @vi_movement_keymap = {
      "\C-d" => :rl_vi_eof_maybe ,
      "\C-e" => :rl_emacs_editing_mode ,
      "\C-g" => :rl_abort ,
      "\C-h" => :rl_backward_char ,
      "\C-j" => :rl_newline ,
      "\C-k" => :rl_kill_line ,
      "\C-l" => :rl_clear_screen ,
      "\C-m" => :rl_newline ,
      "\C-n" => :rl_get_next_history ,
      "\C-p" => :rl_get_previous_history ,
      "\C-q" => :rl_quoted_insert ,
      "\C-r" => :rl_reverse_search_history ,
      "\C-s" => :rl_forward_search_history ,
      "\C-t" => :rl_transpose_chars ,
      "\C-u" => :rl_unix_line_discard ,
      "\C-v" => :rl_quoted_insert ,
      "\C-w" => :rl_unix_word_rubout ,
      "\C-y" => :rl_yank ,
      "\C-_" => :rl_vi_undo ,
      " " => :rl_forward_char ,
      "#" => :rl_insert_comment ,
      "$" => :rl_end_of_line ,
      "%" => :rl_vi_match ,
      "&" => :rl_vi_tilde_expand ,
      "*" => :rl_vi_complete ,
      "+" => :rl_get_next_history ,
      "," => :rl_vi_char_search ,
      "-" => :rl_get_previous_history ,
      "." => :rl_vi_redo ,
      "/" => :rl_vi_search ,
      "0" => :rl_beg_of_line ,
      "1" => :rl_vi_arg_digit ,
      "2" => :rl_vi_arg_digit ,
      "3" => :rl_vi_arg_digit ,
      "4" => :rl_vi_arg_digit ,
      "5" => :rl_vi_arg_digit ,
      "6" => :rl_vi_arg_digit ,
      "7" => :rl_vi_arg_digit ,
      "8" => :rl_vi_arg_digit ,
      "9" => :rl_vi_arg_digit ,
      "" => :rl_vi_char_search ,
      "=" => :rl_vi_complete ,
      "?" => :rl_vi_search ,
      "A" => :rl_vi_append_eol ,
      "B" => :rl_vi_prev_word ,
      "C" => :rl_vi_change_to ,
      "D" => :rl_vi_delete_to ,
      "E" => :rl_vi_end_word ,
      "F" => :rl_vi_char_search ,
      "G" => :rl_vi_fetch_history ,
      "I" => :rl_vi_insert_beg ,
      "N" => :rl_vi_search_again ,
      "P" => :rl_vi_put ,
      "R" => :rl_vi_replace ,
      "S" => :rl_vi_subst ,
      "T" => :rl_vi_char_search ,
      "U" => :rl_revert_line ,
      "W" => :rl_vi_next_word ,
      "X" => :rl_vi_rubout ,
      "Y" => :rl_vi_yank_to ,
      "\\" => :rl_vi_complete ,
      "^" => :rl_vi_first_print ,
      "_" => :rl_vi_yank_arg ,
      "`" => :rl_vi_goto_mark ,
      "a" => :rl_vi_append_mode ,
      "b" => :rl_vi_prev_word ,
      "c" => :rl_vi_change_to ,
      "d" => :rl_vi_delete_to ,
      "e" => :rl_vi_end_word ,
      "f" => :rl_vi_char_search ,
      "h" => :rl_backward_char ,
      "i" => :rl_vi_insertion_mode ,
      "j" => :rl_get_next_history ,
      "k" => :rl_get_previous_history ,
      "l" => :rl_forward_char ,
      "m" => :rl_vi_set_mark ,
      "n" => :rl_vi_search_again ,
      "p" => :rl_vi_put ,
      "r" => :rl_vi_change_char ,
      "s" => :rl_vi_subst ,
      "t" => :rl_vi_char_search ,
      "u" => :rl_vi_undo ,
      "w" => :rl_vi_next_word ,
      "x" => :rl_vi_delete ,
      "y" => :rl_vi_yank_to ,
      "|" => :rl_vi_column ,
      "~" => :rl_vi_change_case
   }
   @vi_insertion_keymap = {
      "\C-a" => :rl_insert  ,
      "\C-b" => :rl_insert  ,
      "\C-c" => :rl_insert  ,
      "\C-d" => :rl_vi_eof_maybe  ,
      "\C-e" => :rl_insert  ,
      "\C-f" => :rl_insert  ,
      "\C-g" => :rl_insert  ,
      "\C-h" => :rl_rubout  ,
      "\C-i" => :rl_complete  ,
      "\C-j" => :rl_newline  ,
      "\C-k" => :rl_insert  ,
      "\C-l" => :rl_insert  ,
      "\C-m" => :rl_newline  ,
      "\C-n" => :rl_insert  ,
      "\C-o" => :rl_insert  ,
      "\C-p" => :rl_insert  ,
      "\C-q" => :rl_insert  ,
      "\C-r" => :rl_reverse_search_history  ,
      "\C-s" => :rl_forward_search_history  ,
      "\C-t" => :rl_transpose_chars  ,
      "\C-u" => :rl_unix_line_discard  ,
      "\C-v" => :rl_quoted_insert  ,
      "\C-w" => :rl_unix_word_rubout  ,
      "\C-x" => :rl_insert  ,
      "\C-y" => :rl_yank  ,
      "\C-z" => :rl_insert  ,
      "\C-[" => :rl_vi_movement_mode  ,
      "\C-\\" => :rl_insert  ,
      "\C-]" => :rl_insert  ,
      "\C-^" => :rl_insert  ,
      "\C-_" => :rl_vi_undo  ,
      "\x7F" => :rl_rubout
   }
   @rl_library_version = RL_LIBRARY_VERSION
   @rl_readline_version = RL_READLINE_VERSION
   @rl_readline_name = "other"
   @rl_getc_function = :rl_getc
   @_rl_doing_an_undo = false
   @_rl_undo_group_level = 0
   @rl_undo_list = nil
   @rl_redisplay_function = :rl_redisplay
   @rl_display_fixed = false
   @_rl_suppress_redisplay = 0
   @_rl_want_redisplay = false
   @rl_display_prompt = nil
   @rl_gnu_readline_p = true
   for i in 32 .. 255
      @emacs_standard_keymap[i.chr] = :rl_insert unless @emacs_standard_keymap[i.chr]
      @vi_insertion_keymap[i.chr] = :rl_insert unless @vi_insertion_keymap[i.chr]
   end
   @_rl_keymap = @emacs_standard_keymap
   @rl_editing_mode = @emacs_mode
   @rl_insert_mode = RL_IM_DEFAULT
   @rl_dispatching = false
   @_rl_last_command_was_kill = false
   @rl_numeric_arg = 1
   @rl_explicit_arg = false
   @rl_arg_sign = 1
   @rl_initialized = false
   @rl_readline_state = RL_STATE_NONE
   @rl_point = 0
   @rl_mark = 0
   @rl_end = 0
   @rl_done = false
   @rl_last_func = nil
   @readline_top_level = nil
   @_rl_in_stream = nil
   @_rl_out_stream = nil
   @rl_instream = nil
   @rl_outstream = nil
   @pop_index = 0
   @push_index = 0
   @ibuffer = 0.chr * 512
   @ibuffer_len = @ibuffer.length - 1
   @readline_echoing_p = false
   @rl_prompt = nil
   @rl_visible_prompt_length = 0
   @rl_already_prompted = false
   @rl_key_sequence_length = 0
   @rl_startup_hook = nil
   @rl_pre_input_hook = nil
   @_rl_eof_char = "\cD"
   @rl_pending_input = 0
   @rl_terminal_name = nil
   @_rl_horizontal_scroll_mode = false
   @_rl_mark_modified_lines = false
   @_rl_bell_preference = AUDIBLE_BELL
   @_rl_comment_begin = nil
   @rl_executing_keymap = nil
   @_rl_dispatching_keymap = nil
   @rl_erase_empty_line = false
   @rl_num_chars_to_read = 0
   @rl_line_buffer = nil
   @_rl_kscxt = nil
   @_rl_parsing_conditionalized_out = false
   @_rl_convert_meta_chars_to_ascii = true
   @_rl_output_meta_chars = false
   @_rl_bind_stty_chars = true
   @rl_completion_display_matches_hook = nil
   XOK = 1
   @_rl_term_clreol = nil
   @_rl_term_clrpag = nil
   @_rl_term_cr = nil
   @_rl_term_backspace = nil
   @_rl_term_goto = nil
   @_rl_term_pc = nil
   @_rl_terminal_can_insert = false
   @_rl_term_im = nil
   @_rl_term_ei = nil
   @_rl_term_ic = nil
   @_rl_term_ip = nil
   @_rl_term_IC = nil
   @_rl_term_dc = nil
   @_rl_term_DC = nil
   @_rl_term_forward_char = nil
   @_rl_term_up = nil
   @_rl_visible_bell = nil
   @_rl_term_autowrap = true
   @term_has_meta = 0
   @_rl_term_mm = nil
   @_rl_term_mo = nil
   @_rl_term_ku = nil
   @_rl_term_kd = nil
   @_rl_term_kr = nil
   @_rl_term_kl = nil
   @_rl_term_ks = nil
   @_rl_term_ke = nil
   @_rl_term_kh = nil
   @_rl_term_kH = nil
   @_rl_term_at7 = nil
   @_rl_term_kD = nil
   @_rl_term_kI = nil
   @_rl_term_vs = nil
   @_rl_term_ve = nil
   @_rl_screenwidth = @_rl_screenheight = @_rl_screenchars = 0
   @_rl_enable_keypad = false
   @_rl_enable_meta = true
   @_rl_complete_show_all = false
   @_rl_complete_show_unmodified = false
   @_rl_complete_mark_directories = true
   @_rl_complete_mark_symlink_dirs = false
   @_rl_print_completions_horizontally = false
   @_rl_completion_case_fold = false
   @_rl_match_hidden_files = true
   @rl_visible_stats = false
   @rl_directory_completion_hook = nil
   @rl_directory_rewrite_hook = nil
   @rl_complete_with_tilde_expansion = false
   @rl_completion_entry_function = nil
   @rl_attempted_completion_function = nil
   @rl_attempted_completion_over = false
   @rl_completion_type = 0
   @rl_completion_query_items = 100
   @_rl_page_completions = 1
   @rl_basic_word_break_characters = " \t\n\"\\'`@$><=|&{("
   @rl_basic_quote_characters = "\"'"
   @rl_completer_word_break_characters = nil
   @rl_completion_word_break_hook = nil
   @rl_completer_quote_characters = nil
   @rl_filename_quote_characters = nil
   @rl_special_prefixes = nil
   @rl_ignore_completion_duplicates = true
   @rl_filename_completion_desired = false
   @rl_filename_quoting_desired = true
   @rl_ignore_some_completions_function = nil
   @rl_filename_dequoting_function = nil
   @rl_char_is_quoted_p = nil
   @rl_completion_suppress_append = false
   @rl_completion_append_character = ' '
   @rl_completion_suppress_quote = false
   @rl_completion_quote_character = 0
   @rl_completion_found_quote = false
   @rl_completion_mark_symlink_dirs = false
   @rl_inhibit_completion = false
   @completion_changed_buffer = nil
   @_rl_meta_flag = false
   @if_stack = []
   @if_stack_depth = 0
   @last_readline_init_file = nil
   @current_readline_init_file = nil
   @current_readline_init_include_level = 0
   @current_readline_init_lineno = 0
   ENV["HOME"] ||= ENV["HOMEDRIVE"]+ENV["HOMEPATH"]
   @directory = nil
   @filename = nil
   @dirname = nil
   @users_dirname = nil
   @filename_len = 0
   attr_accessor :rl_attempted_completion_function,:rl_deprep_term_function,
   :rl_event_hook,:rl_attempted_completion_over,:rl_basic_quote_characters,
   :rl_basic_word_break_characters,:rl_completer_quote_characters,
   :rl_completer_word_break_characters,:rl_completion_append_character,
   :rl_filename_quote_characters,:rl_instream,:rl_library_version,:rl_outstream,
   :rl_readline_name,:history_length,:history_base
   module_function
   def rl_filename_completion_function(text, state)
      if (state == 0)
         if(@directory)
            @directory.close
            @directory = nil
         end
         text.delete!(0.chr)
         @filename = text.dup
         if text.length == 0
            text = "."
         end
         @dirname = File.dirname(text)
         @users_dirname = @dirname.dup
         if (@dirname[0,1] == '~')
            @dirname = File.expand_path(@dirname)
         end
         if (@rl_directory_completion_hook && send(rl_directory_completion_hook,@dirname))
            @users_dirname = @dirname.dup
         elsif (@rl_completion_found_quote && @rl_filename_dequoting_function)
            @temp = send(@rl_filename_dequoting_function,@users_dirname, @rl_completion_quote_character)
            @users_dirname = temp
         end
         @directory = Dir.new(@dirname)
         if (@filename && @filename.length>0 && @rl_completion_found_quote && @rl_filename_dequoting_function)
            temp = send(@rl_filename_dequoting_function,@filename, @rl_completion_quote_character)
            @filename = temp
         end
         @filename_len = @filename.length
         @rl_filename_completion_desired = true
      end
      entry = nil
      while(@directory && (entry = @directory.read))
         d_name = entry
         if (@filename_len == 0)
            next if (!@_rl_match_hidden_files && d_name[0,1] == '.')
            break if (d_name != '.' && d_name != '..')
         else
            if (@_rl_completion_case_fold)
               break if d_name =~ /^#{Regexp.escape(@filename)}/i
            else
               break if d_name =~ /^#{Regexp.escape(@filename)}/
            end
         end
      end
      if entry.nil?
         if @directory
            @directory.close
            @directory = nil
         end
         @dirname = nil
         @filename = nil
         @users_dirname = nil
         return nil
      else
         if (@dirname != '.')
            if (@rl_complete_with_tilde_expansion && @users_dirname[0,1] == "~")
               temp = @dirname
               if(temp[-1,1] != '/')
                  temp += '/'
               end
            else
               temp = @users_dirname
               if(temp[-1,1] != '/')
                  temp += '/'
               end
            end
            temp += entry
         else
            temp = entry.dup
         end
         return (temp)
      end
   end
   def rl_username_completion_function(text, state)
      return nil if RUBY_PLATFORM =~ /mswin|mingw/
      if (state == 0)
         first_char = text[0,1]
         first_char_loc = (first_char == '~' ? 1 : 0)
         username = text[first_char_loc..-1]
         namelen = username.length
         Etc.setpwent()
      end
      while (entry = Etc.getpwent())
         break if (namelen == 0 || entry.name =~ /^#{username}/ )
      end
      if entry.nil?
         Etc.endpwent()
         return nil
      else
         value = text.dup
         value[first_char_loc..-1] = entry.name
         if (first_char == '~')
            @rl_filename_completion_desired = true
         end
         return (value)
      end
   end
   def rl_completion_matches(text, entry_function)
      matches = 0
      match_list_size = 10
      match_list = []
      match_list[1] = nil
      while (string = send(entry_function, text, matches))
         match_list[matches+=1] = string
         match_list[matches+1] = nil
      end
      if (matches!=0)
         compute_lcd_of_matches(match_list, matches, text)
      else
         match_list = nil
      end
      return (match_list)
   end
   def _rl_to_lower(char)
      char.nil? ? nil : char.chr.downcase
   end
   def compute_lcd_of_matches(match_list, matches, text)
      if (matches == 1)
         match_list[0] = match_list[1]
         match_list[1] = nil
         return 1
      end
      i = 1
      low = 100000
      while(i<matches)
         if (@_rl_completion_case_fold)
            si = 0
            while((c1 = _rl_to_lower(match_list[i][si])) &&
               (c2 = _rl_to_lower(match_list[i + 1][si])))
               if !@rl_byte_oriented
                  if(!_rl_compare_chars(match_list[i],si,match_list[i+1],si))
                     break
                  elsif ((v = _rl_get_char_len(match_list[i][si..-1])) > 1)
                     si += v - 1
                  end
               else
                  break if (c1 != c2)
               end
               si += 1
            end
         else
            si = 0
            while((c1 = match_list[i][si]) &&
               (c2 = match_list[i + 1][si]))
               if !@rl_byte_oriented
                  if(!_rl_compare_chars(match_list[i],si,match_list[i+1],si))
                     break
                  elsif ((v = _rl_get_char_len(match_list[i][si..-1])) > 1)
                     si += v - 1
                  end
               else
                  break if (c1 != c2)
               end
               si += 1
            end
         end
         if (low > si)
            low = si
         end
         i += 1
      end
      if (low == 0 && text && text.length>0 )
         match_list[0] = text.dup
      else
         if (@_rl_completion_case_fold)
            if (@rl_filename_completion_desired &&
               @rl_filename_dequoting_function &&
               @rl_completion_found_quote &&
               @rl_filename_quoting_desired)
               dtext = send(@rl_filename_dequoting_function,text, @rl_completion_quote_character)
               text = dtext
            end
            match_list = [match_list[0]] + match_list[1..-1].sort
            si = text.length
            if (si <= low)
               for i in 1 .. matches
                  if match_list[i][0,si] == text
                     match_list[0] = match_list[i][0,low]
                     break
                  end
                  if (i > matches)
                     match_list[0] = match_list[1][0,low]
                  end
               end
            else
               match_list[0] = text[0,low]
            end
         else
            match_list[0] = match_list[1][0,low]
         end
      end
      return matches
   end
   def rl_vi_editing_mode(count, key)
      _rl_set_insert_mode(RL_IM_INSERT, 1)
      @rl_editing_mode = @vi_mode
      rl_vi_insertion_mode(1, key)
      0
   end
   def rl_vi_insertion_mode(count, key)
      @_rl_keymap = @vi_insertion_keymap
      @_rl_vi_last_key_before_insert = key
      0
   end
   def rl_emacs_editing_mode(count, key)
      @rl_editing_mode = @emacs_mode
      _rl_set_insert_mode(RL_IM_INSERT, 1)
      @_rl_keymap = @emacs_standard_keymap
      0
   end
   def _rl_set_insert_mode(im, force)
      @rl_insert_mode = im
   end
   def rl_overwrite_mode(count, key)
      if (!@rl_explicit_arg)
         _rl_set_insert_mode(@rl_insert_mode ^ 1, 0)
      elsif (count > 0)
         _rl_set_insert_mode(RL_IM_OVERWRITE, 0)
      else
         _rl_set_insert_mode(RL_IM_INSERT, 0)
      end
      0
   end
   def rl_tilde_expand(ignore, key)
      _end = @rl_point
      start = _end - 1
      if (@rl_point == @rl_end && @rl_line_buffer[@rl_point,1] == '~' )
         homedir = File.expand_path("~")
         _rl_replace_text(homedir, start, _end)
         return (0)
      elsif (@rl_line_buffer[start,1] != '~')
         while(!whitespace(@rl_line_buffer[start,1]) && start >= 0)
            start -= 1
         end
         start+=1
      end
      _end = start
      begin
         _end+=1
      end while(!whitespace(@rl_line_buffer[_end,1]) && _end < @rl_end)
      if (whitespace(@rl_line_buffer[_end,1]) || _end >= @rl_end)
         _end-=1
      end
      if (@rl_line_buffer[start,1] == '~')
         len = _end - start + 1
         temp = @rl_line_buffer[start,len]
         homedir = File.expand_path(temp)
         temp = nil
         _rl_replace_text(homedir, start, _end)
      end
      0
   end
   def rl_cleanup_after_signal()
      _rl_clean_up_for_exit()
      if (@rl_deprep_term_function)
         send(@rl_deprep_term_function)
      end
      rl_clear_pending_input()
      rl_clear_signals()
   end
   def _rl_clean_up_for_exit()
      if @readline_echoing_p
         _rl_move_vert(@_rl_vis_botlin)
         @_rl_vis_botlin = 0
         @rl_outstream.flush
         rl_restart_output(1, 0)
      end
   end
   def _rl_move_cursor_relative(new, data, start=0)
      woff = w_offset(@_rl_last_v_pos, @wrap_offset)
      cpos = @_rl_last_c_pos
      if !@rl_byte_oriented
         dpos = _rl_col_width(data, start, start+new)
         if (dpos > @prompt_last_invisible)
            dpos -= woff
            @cpos_adjusted = true
         end
      else
         dpos = new
      end
      if (cpos == dpos)
         return
      end
      if @hConsoleHandle
         csbi = 0.chr * 24
         @GetConsoleScreenBufferInfo.Call(@hConsoleHandle,csbi)
         x,y = csbi[4,4].unpack('SS')
         x = dpos
         @SetConsoleCursorPosition.Call(@hConsoleHandle,y*65536+x)
         @_rl_last_c_pos = dpos
         return
      end
      if !@rl_byte_oriented
         i = @_rl_last_c_pos
      else
         i = @_rl_last_c_pos - woff
      end
      if (dpos == 0 || cr_faster(dpos, @_rl_last_c_pos) ||
         (@_rl_term_autowrap && i == @_rl_screenwidth))
         @rl_outstream.write(@_rl_term_cr)
         cpos = @_rl_last_c_pos = 0
      end
      if (cpos < dpos)
         if !@rl_byte_oriented
            if (@_rl_term_forward_char)
               @rl_outstream.write(@_rl_term_forward_char * (dpos-cpos))
            else
               @rl_outstream.write(@_rl_term_cr)
               @rl_outstream.write(data[start,new])
            end
         else
            @rl_outstream.write(data[start+cpos,new-cpos])
         end
      elsif (cpos > dpos)
         _rl_backspace(cpos - dpos)
      end
      @_rl_last_c_pos = dpos
   end
   def _rl_move_vert(to)
      if (@_rl_last_v_pos == to || to > @_rl_screenheight)
         return
      end
      if ((delta = to - @_rl_last_v_pos) > 0)
         @rl_outstream.write("\n"*delta)
         @rl_outstream.write("\r")
         @_rl_last_c_pos = 0
      else
         if(@_rl_term_up)
            @rl_outstream.write(@_rl_term_up*(-delta))
         end
      end
      @_rl_last_v_pos = to
   end
   def rl_setstate(x)
      (@rl_readline_state |= (x))
   end
   def rl_unsetstate(x)
      (@rl_readline_state &= ~(x))
   end
   def rl_isstate(x)
      (@rl_readline_state & (x))!=0
   end
   def rl_clear_pending_input()
      @rl_pending_input = 0
      rl_unsetstate(RL_STATE_INPUTPENDING)
      0
   end
   def rl_restart_output(count, key)
      0
   end
   def rl_clear_signals()
      if Signal.list['WINCH']
         trap "WINCH",@def_proc
      end
   end
   def rl_set_signals()
      if Signal.list['WINCH']
         @def_proc = trap "WINCH",Proc.new{rl_sigwinch_handler(0)}
      end
   end
   def expand_prompt(pmt)
      if (@rl_byte_oriented && pmt[RL_PROMPT_START_IGNORE].nil?)
         r = pmt.dup
         lp = r.length
         lip = 0
         niflp = 0
         vlp = lp
         return [r,lp,lip,niflp,vlp]
      end
      l = pmt.length
      ret = ''
      invfl = 0
      invflset = 0
      igstart = 0
      rl = 0
      ignoring = false
      last = ninvis = physchars = 0
      for pi in 0 ... pmt.length
         if (!ignoring && pmt[pi,1] == RL_PROMPT_START_IGNORE)
            ignoring = true
            igstart = pi
            next
         elsif (ignoring && pmt[pi,1] == RL_PROMPT_END_IGNORE)
            ignoring = false
            if (pi != (igstart + 1))
               last = ret.length - 1
            end
            next
         else
            if !@rl_byte_oriented
               pind = pi
               ind = _rl_find_next_mbchar(pmt, pind, 1, MB_FIND_NONZERO)
               l = ind - pind
               while (l>0)
                  l-=1
                  ret << pmt[pi]
                  pi += 1
               end
               if (!ignoring)
                  rl += ind - pind
                  physchars += _rl_col_width(pmt, pind, ind)
               else
                  ninvis += ind - pind
               end
               pi-=1
            else
               ret << pmt[pi]
               if (!ignoring)
                  rl+=1
                  physchars+=1
               else
                  ninvis+=1
               end
               if (invflset == 0 && rl >= @_rl_screenwidth)
                  invfl = ninvis
                  invflset = 1
               end
            end
         end
      end
      if (rl < @_rl_screenwidth)
         invfl = ninvis
      end
      lp = rl
      lip = last
      niflp = invfl
      vlp = physchars
      return [ret,lp,lip,niflp,vlp]
   end
   def rl_expand_prompt(prompt)
      @local_prompt = @local_prompt_prefix = nil
      @local_prompt_len = 0
      @prompt_last_invisible = @prompt_invis_chars_first_line = 0
      @prompt_visible_length = @prompt_physical_chars = 0
      if (prompt.nil? || prompt == '')
         return (0)
      end
      pi = prompt.rindex("\n")
      if pi.nil?
         @local_prompt,@prompt_visible_length,@prompt_last_invisible,@prompt_invis_chars_first_line,@prompt_physical_chars =
         expand_prompt(prompt)
         @local_prompt_prefix = nil
         @local_prompt_len = @local_prompt ? @local_prompt.length : 0
         return (@prompt_visible_length)
      else
         pi += 1 if prompt.length!=pi+1
         t = pi
         @local_prompt,@prompt_visible_length,@prompt_last_invisible,_,@prompt_physical_chars = expand_prompt(prompt[pi..-1])
         c = prompt[t]
         prompt[t] = 0.chr
         @local_prompt_prefix,@prompt_prefix_length,_,@prompt_invis_chars_first_line, = expand_prompt(prompt)
         prompt[t] = c
         @local_prompt_len = @local_prompt ? @local_prompt.length : 0
         return (@prompt_prefix_length)
      end
   end
   def rl_set_prompt(prompt)
      @rl_prompt = prompt ? prompt.dup : nil
      @rl_display_prompt = @rl_prompt ? @rl_prompt : ""
      @rl_visible_prompt_length = rl_expand_prompt(@rl_prompt)
      0
   end
   def get_term_capabilities(buffer)
      hash = {}
      `infocmp -C`.split(':').select{|x| x =~ /(.*)=(.*)/ and hash[$1]=$2.gsub('\\E',"\e").gsub(/\^(.)/){($1[0].ord ^ ((?a..?z).include?($1[0]) ? 0x60 : 0x40)).chr}}
      @_rl_term_at7          =     hash["@7"]
      @_rl_term_DC           =     hash["DC"]
      @_rl_term_IC           =     hash["IC"]
      @_rl_term_clreol       =     hash["ce"]
      @_rl_term_clrpag       =     hash["cl"]
      @_rl_term_cr           =     hash["cr"]
      @_rl_term_dc           =     hash["dc"]
      @_rl_term_ei           =     hash["ei"]
      @_rl_term_ic           =     hash["ic"]
      @_rl_term_im           =     hash["im"]
      @_rl_term_kD           =     hash["kD"]
      @_rl_term_kH           =     hash["kH"]
      @_rl_term_kI           =     hash["kI"]
      @_rl_term_kd           =     hash["kd"]
      @_rl_term_ke           =     hash["ke"]
      @_rl_term_kh           =     hash["kh"]
      @_rl_term_kl           =     hash["kl"]
      @_rl_term_kr           =     hash["kr"]
      @_rl_term_ks           =     hash["ks"]
      @_rl_term_ku           =     hash["ku"]
      @_rl_term_backspace    =     hash["le"]
      @_rl_term_mm           =     hash["mm"]
      @_rl_term_mo           =     hash["mo"]
      @_rl_term_forward_char =     hash["nd"]
      @_rl_term_pc           =     hash["pc"]
      @_rl_term_up           =     hash["up"]
      @_rl_visible_bell      =     hash["vb"]
      @_rl_term_vs           =     hash["vs"]
      @_rl_term_ve           =     hash["ve"]
      @tcap_initialized = true
   end
   def sh_set_lines_and_columns(lines, cols)
      ENV["LINES"] = lines.to_s
      ENV["COLUMNS"] = cols.to_s
   end
   def _rl_get_screen_size(tty, ignore_env)
      if @hConsoleHandle
         csbi = 0.chr * 24
         @GetConsoleScreenBufferInfo.Call(@hConsoleHandle,csbi)
         wc,wr = csbi[0,4].unpack('SS')
         @_rl_screenwidth = wc
         @_rl_screenheight = wr
      else
         wr,wc = `stty size`.split(' ').map{|x| x.to_i}
         @_rl_screenwidth = wc
         @_rl_screenheight = wr
         if ignore_env==0 && ENV['LINES']
            @_rl_screenheight = ENV['LINES'].to_i
         end
         if ignore_env==0 && ENV['COLUMNS']
            @_rl_screenwidth = ENV['COLUMNS'].to_i
         end
      end
      if @_rl_screenwidth.nil? || @_rl_screenwidth <= 1
         @_rl_screenwidth = 80
      end
      if @_rl_screenheight.nil? || @_rl_screenheight <= 0
         @_rl_screenheight = 24
      end
      sh_set_lines_and_columns(@_rl_screenheight, @_rl_screenwidth)
      if !@_rl_term_autowrap
         @_rl_screenwidth-=1
      end
      @_rl_screenchars = @_rl_screenwidth * @_rl_screenheight
   end
   def tgetflag(name)
      `infocmp -C -r`.scan(/\w{2}/).include?(name)
   end
   def rl_function_of_keyseq(keyseq, map, type)
      map ||= @_rl_keymap
      map[keyseq]
   end
   def rl_generic_bind(type, keyseq, data, map)
      map[keyseq] = data
      0
   end
   def rl_bind_keyseq_in_map(keyseq, function, map)
      rl_generic_bind(ISFUNC, keyseq, function, map)
   end
   def rl_bind_keyseq_if_unbound_in_map(keyseq, default_func, kmap)
      if (keyseq)
         func = rl_function_of_keyseq(keyseq, kmap, nil)
         if (func.nil? || func == :rl_vi_movement_mode)
            return (rl_bind_keyseq_in_map(keyseq, default_func, kmap))
         else
            return 1
         end
      end
      0
   end
   def rl_bind_keyseq_if_unbound(keyseq, default_func)
      rl_bind_keyseq_if_unbound_in_map(keyseq, default_func, @_rl_keymap)
   end
   def bind_termcap_arrow_keys(map)
      xkeymap = @_rl_keymap
      @_rl_keymap = map
      rl_bind_keyseq_if_unbound(@_rl_term_ku, :rl_get_previous_history)
      rl_bind_keyseq_if_unbound(@_rl_term_kd, :rl_get_next_history)
      rl_bind_keyseq_if_unbound(@_rl_term_kr, :rl_forward_char)
      rl_bind_keyseq_if_unbound(@_rl_term_kl, :rl_backward_char)
      rl_bind_keyseq_if_unbound(@_rl_term_kh, :rl_beg_of_line)
      rl_bind_keyseq_if_unbound(@_rl_term_at7, :rl_end_of_line)
      rl_bind_keyseq_if_unbound(@_rl_term_kD, :rl_delete)
      rl_bind_keyseq_if_unbound(@_rl_term_kI, :rl_overwrite_mode)
      @_rl_keymap = xkeymap
   end
   def _rl_init_terminal_io(terminal_name)
      term = terminal_name ? terminal_name : ENV["TERM"]
      @_rl_term_clrpag = @_rl_term_cr = @_rl_term_clreol = nil
      tty = @rl_instream ? @rl_instream.fileno : 0
      if no_terminal?
         term = "dumb"
         @_rl_bind_stty_chars = false
      end
      @term_string_buffer ||= 0.chr * 2032
      @term_buffer ||= 0.chr * 4080
      buffer = @term_string_buffer
      tgetent_ret = (term != "dumb") ? 1 : -1
      if (tgetent_ret <= 0)
         buffer = @term_buffer = @term_string_buffer = nil
         @_rl_term_autowrap = false
         if (@_rl_screenwidth <= 0 || @_rl_screenheight <= 0)
            _rl_get_screen_size(tty, 0)
         end
         if (@_rl_screenwidth <= 0 || @_rl_screenheight <= 0)
            @_rl_screenwidth = 79
            @_rl_screenheight = 24
         end
         @_rl_screenchars = @_rl_screenwidth * @_rl_screenheight
         @_rl_term_cr = "\r"
         @_rl_term_im = @_rl_term_ei = @_rl_term_ic = @_rl_term_IC = nil
         @_rl_term_up = @_rl_term_dc = @_rl_term_DC = @_rl_visible_bell = nil
         @_rl_term_ku = @_rl_term_kd = @_rl_term_kl = @_rl_term_kr = nil
         @_rl_term_kh = @_rl_term_kH = @_rl_term_kI = @_rl_term_kD = nil
         @_rl_term_ks = @_rl_term_ke = @_rl_term_at7 = nil
         @_rl_term_mm = @_rl_term_mo = nil
         @_rl_term_ve = @_rl_term_vs = nil
         @_rl_term_forward_char = nil
         @_rl_terminal_can_insert = @term_has_meta = false
         @_rl_term_backspace = "\b"
         return 0
      end
      get_term_capabilities(buffer)
      @_rl_term_cr ||= "\r"
      @_rl_term_autowrap = !!(tgetflag("am") && tgetflag("xn"))
      if (@_rl_screenwidth <= 0 || @_rl_screenheight <= 0)
         _rl_get_screen_size(tty, 0)
      end
      @_rl_terminal_can_insert = !!(@_rl_term_IC || @_rl_term_im || @_rl_term_ic)
      @term_has_meta = !!(tgetflag("km") || tgetflag("MT"))
      if !@term_has_meta
         @_rl_term_mm = @_rl_term_mo = nil
      end
      bind_termcap_arrow_keys(@emacs_standard_keymap)
      bind_termcap_arrow_keys(@vi_movement_keymap)
      bind_termcap_arrow_keys(@vi_insertion_keymap)
      return 0
   end
   def rl_tty_set_default_bindings(kmap)
      h = Hash[*`stty -a`.scan(/(\w+) = ([^;]+);/).flatten]
      h.each {|k,v| v.gsub!(/\^(.)/){($1[0].ord ^ ((?a..?z).include?($1[0]) ? 0x60 : 0x40)).chr}}
      kmap[h['erase']] = :rl_rubout
      kmap[h['kill']] = :rl_unix_line_discard
      kmap[h['werase']] = :rl_unix_word_rubout
      kmap[h['lnext']] = :rl_quoted_insert
   end
   def readline_default_bindings()
      if @_rl_bind_stty_chars
         rl_tty_set_default_bindings(@_rl_keymap)
      end
   end
   def _rl_init_eightbit()
   end
   def rl_read_init_file(filename)
      filename ||= @last_readline_init_file
      filename ||= ENV["INPUTRC"]
      if (filename.nil? || filename == '')
         filename = DEFAULT_INPUTRC
         if (_rl_read_init_file(filename, 0) == 0)
            return 0
         end
         filename = SYS_INPUTRC
      end
      if RUBY_PLATFORM =~ /mswin|mingw/
         return 0 if (_rl_read_init_file(filename, 0) == 0)
         filename = "~/_inputrc"
      end
      return (_rl_read_init_file(filename, 0))
   end
   def _rl_read_init_file(filename, include_level)
      @current_readline_init_file = filename
      @current_readline_init_include_level = include_level
      openname = File.expand_path(filename)
      begin
         buffer = File.open(openname).read
      rescue
         return -1
      end
      if (include_level == 0 && filename != @last_readline_init_file)
         @last_readline_init_file = filename.dup
      end
      @currently_reading_init_file = true
      @current_readline_init_lineno = 1
      buffer.each_line do |line|
         line.strip!
         next if line =~ /^#/
         next if line == ''
         rl_parse_and_bind(line)
      end
      return 0
   end
   def parser_if(args)
      @if_stack << @_rl_parsing_conditionalized_out
      if @_rl_parsing_conditionalized_out
         return 0
      end
      args.downcase!
      if (@rl_terminal_name && args =~ /^term=/)
         tname = @rl_terminal_name.downcase.gsub(/-.*$/,'')
         @_rl_parsing_conditionalized_out = (args[5..-1] != tname && args[5..-1] != @rl_terminal_name.downcase)
      elsif args =~ /^mode=/
         if args[5..-1] == "emacs"
            mode = @emacs_mode
         elsif args[5..-1] == "vi"
            mode = @vi_mode
         else
            mode = @no_mode
         end
         @_rl_parsing_conditionalized_out = (mode != @rl_editing_mode)
      elsif (args == @rl_readline_name)
         @_rl_parsing_conditionalized_out = false
      else
         @_rl_parsing_conditionalized_out = true
      end
      return 0
   end
   def parser_else(args)
      if @if_stack.empty?
         return 0
      end
      return 0 if @if_stack.detect {|x| x }
      @_rl_parsing_conditionalized_out = !@_rl_parsing_conditionalized_out
      return 0
   end
   def parser_endif(args)
      if (@if_stack.length>0)
         @_rl_parsing_conditionalized_out = @if_stack.pop
      else
      end
      0
   end
   def parser_include(args)
      return 0 if (@_rl_parsing_conditionalized_out)
      old_init_file = @current_readline_init_file
      old_line_number = @current_readline_init_lineno
      old_include_level = @current_readline_init_include_level
      r = _rl_read_init_file(args, old_include_level + 1)
      @current_readline_init_file = old_init_file
      @current_readline_init_lineno = old_line_number
      @current_readline_init_include_level = old_include_level
      return r
   end
   def handle_parser_directive(statement)
      directive,args = statement.split(' ')
      case directive.downcase
      when "if"
         parser_if(args)
         return 0
      when "endif"
         parser_endif(args)
         return 0
      when "else"
         parser_else(args)
         return 0
      when "include"
         parser_include(args)
         return 0
      end
      return 1
   end
   def rl_variable_bind(name,value)
      case name
      when "bind-tty-special-chars"
         @_rl_bind_stty_chars = value.nil? || value=='1' || value == 'on'
      when "blink-matching-paren"
         @rl_blink_matching_paren = value.nil? || value=='1' || value == 'on'
      when "byte-oriented"
         @rl_byte_oriented = value.nil? || value=='1' || value == 'on'
      when "completion-ignore-case"
         @_rl_completion_case_fold = value.nil? || value=='1' || value == 'on'
      when "convert-meta"
         @_rl_convert_meta_chars_to_ascii = value.nil? || value=='1' || value == 'on'
      when "disable-completion"
         @rl_inhibit_completion = value.nil? || value=='1' || value == 'on'
      when "enable-keypad"
         @_rl_enable_keypad = value.nil? || value=='1' || value == 'on'
      when "expand-tilde"
         @rl_complete_with_tilde_expansion = value.nil? || value=='1' || value == 'on'
      when "history-preserve-point"
         @_rl_history_preserve_point = value.nil? || value=='1' || value == 'on'
      when "horizontal-scroll-mode"
         @_rl_horizontal_scroll_mode = value.nil? || value=='1' || value == 'on'
      when "input-meta"
         @_rl_meta_flag = value.nil? || value=='1' || value == 'on'
      when "mark-directories"
         @_rl_complete_mark_directories = value.nil? || value=='1' || value == 'on'
      when "mark-modified-lines"
         @_rl_mark_modified_lines = value.nil? || value=='1' || value == 'on'
      when "mark-symlinked-directories"
         @_rl_complete_mark_symlink_dirs = value.nil? || value=='1' || value == 'on'
      when "match-hidden-files"
         @_rl_match_hidden_files = value.nil? || value=='1' || value == 'on'
      when "meta-flag"
         @_rl_meta_flag = value.nil? || value=='1' || value == 'on'
      when "output-meta"
         @_rl_output_meta_chars = value.nil? || value=='1' || value == 'on'
      when "page-completions"
         @_rl_page_completions = value.nil? || value=='1' || value == 'on'
      when "prefer-visible-bell"
         @_rl_prefer_visible_bell = value.nil? || value=='1' || value == 'on'
      when "print-completions-horizontally"
         @_rl_print_completions_horizontally = value.nil? || value=='1' || value == 'on'
      when "show-all-if-ambiguous"
         @_rl_complete_show_all = value.nil? || value=='1' || value == 'on'
      when "show-all-if-unmodified"
         @_rl_complete_show_unmodified = value.nil? || value=='1' || value == 'on'
      when "visible-stats"
         @rl_visible_stats = value.nil? || value=='1' || value == 'on'
      when "bell-style"
         case value
         when "none","off"
            @_rl_bell_preference = NO_BELL
         when "audible", "on"
            @_rl_bell_preference = AUDIBLE_BELL
         when "visible"
            @_rl_bell_preference = VISIBLE_BELL
         else
            @_rl_bell_preference = AUDIBLE_BELL
         end
      when "comment-begin"
         @_rl_comment_begin = value.dup
      when "completion-query-items"
         @rl_completion_query_items = value.to_i
      when "editing-mode"
         case value
         when "vi"
            @_rl_keymap = @vi_insertion_keymap
            @rl_editing_mode = @vi_mode
         when "emacs"
            @_rl_keymap = @emacs_standard_keymap
            @rl_editing_mode = @emacs_mode
         end
      when "isearch-terminators"
         @_rl_isearch_terminators = instance_eval(value)
      when "keymap"
         case value
         when "emacs","emacs-standard","emacs-meta","emacs-ctlx"
            @_rl_keymap = @emacs_standard_keymap
         when "vi","vi-move","vi-command"
            @_rl_keymap = @vi_movement_keymap
         when "vi-insert"
            @_rl_keymap = @vi_insertion_keymap
         end
      end
   end
   def rl_named_function(name)
      case name
      when "accept-line"
         return :rl_newline
      when "arrow-key-prefix"
         return :rl_arrow_keys
      when "backward-delete-char"
         return :rl_rubout
      when "character-search"
         return :rl_char_search
      when  "character-search-backward"
         return :rl_backward_char_search
      when "copy-region-as-kill"
         return :rl_copy_region_to_kill
      when "delete-char"
         return :rl_delete
      when "delete-char-or-list"
         return :rl_delete_or_show_completions
      when "forward-backward-delete-char"
         return :rl_rubout_or_delete
      when "kill-whole-line"
         return :rl_kill_full_line
      when "non-incremental-forward-search-history"
         return :rl_noninc_forward_search
      when "non-incremental-reverse-search-history"
         return :rl_noninc_reverse_search
      when "non-incremental-forward-search-history-again"
         return :rl_noninc_forward_search_again
      when "non-incremental-reverse-search-history-again"
         return :rl_noninc_reverse_search_again
      when "redraw-current-line"
         return :rl_refresh_line
      when "self-insert"
         return :rl_insert
      when "undo"
         return :rl_undo_command
      when "beginning-of-line"
         return :rl_beg_of_line
      else
         if name =~ /^[-a-z]+$/
            return ('rl_'+name.gsub('-','_')).to_sym
         end
      end
      nil
   end
   def rl_bind_key(key, function)
      @_rl_keymap[key] = function
      @rl_binding_keymap = @_rl_keymap
      0
   end
   def rl_parse_and_bind(string)
      if (string[0,1] == "$")
         handle_parser_directive(string[1..-1])
         return 0
      end
      return 0 if @_rl_parsing_conditionalized_out
      if string =~ /^set/i
         _,var,value = string.downcase.split(' ')
         rl_variable_bind(var, value)
         return 0
      end
      if string =~ /"(.*)"\s*:\s*(.*)$/
        key, funname = $1, $2
        rl_bind_key(key, rl_named_function(funname))
      end
      0
   end
   def _rl_enable_meta_key()
      if(@term_has_meta && @_rl_term_mm)
         @_rl_out_stream.write(@_rl_term_mm)
      end
   end
   def rl_set_keymap_from_edit_mode()
      if (@rl_editing_mode == @emacs_mode)
         @_rl_keymap = @emacs_standard_keymap
      elsif (@rl_editing_mode == @vi_mode)
         @_rl_keymap = @vi_insertion_keymap
      end
   end
   def rl_get_keymap_name_from_edit_mode()
      if (@rl_editing_mode == @emacs_mode)
         "emacs"
      elsif (@rl_editing_mode == @vi_mode)
         "vi"
      else
         "none"
      end
   end
   def bind_arrow_keys_internal(map)
      xkeymap = @_rl_keymap
      @_rl_keymap = map
      if RUBY_PLATFORM =~ /mswin|mingw/
         rl_bind_keyseq_if_unbound("\340H", :rl_get_previous_history)
         rl_bind_keyseq_if_unbound("\340P", :rl_get_next_history)
         rl_bind_keyseq_if_unbound("\340M", :rl_forward_char)
         rl_bind_keyseq_if_unbound("\340K", :rl_backward_char)
         rl_bind_keyseq_if_unbound("\340G", :rl_beg_of_line)
         rl_bind_keyseq_if_unbound("\340O", :rl_end_of_line)
         rl_bind_keyseq_if_unbound("\340s", :rl_backward_word)
         rl_bind_keyseq_if_unbound("\340t", :rl_forward_word)
         rl_bind_keyseq_if_unbound("\340S", :rl_delete)
         rl_bind_keyseq_if_unbound("\340R", :rl_overwrite_mode)
      else
         rl_bind_keyseq_if_unbound("\033[A", :rl_get_previous_history)
         rl_bind_keyseq_if_unbound("\033[B", :rl_get_next_history)
         rl_bind_keyseq_if_unbound("\033[C", :rl_forward_char)
         rl_bind_keyseq_if_unbound("\033[D", :rl_backward_char)
         rl_bind_keyseq_if_unbound("\033[H", :rl_beg_of_line)
         rl_bind_keyseq_if_unbound("\033[F", :rl_end_of_line)
         rl_bind_keyseq_if_unbound("\033OA", :rl_get_previous_history)
         rl_bind_keyseq_if_unbound("\033OB", :rl_get_next_history)
         rl_bind_keyseq_if_unbound("\033OC", :rl_forward_char)
         rl_bind_keyseq_if_unbound("\033OD", :rl_backward_char)
         rl_bind_keyseq_if_unbound("\033OH", :rl_beg_of_line)
         rl_bind_keyseq_if_unbound("\033OF", :rl_end_of_line)
      end
      @_rl_keymap = xkeymap
   end
   def bind_arrow_keys()
      bind_arrow_keys_internal(@emacs_standard_keymap)
      bind_arrow_keys_internal(@vi_movement_keymap)
      bind_arrow_keys_internal(@vi_insertion_keymap)
   end
   def readline_initialize_everything()
      @rl_instream ||= $stdin
      @rl_outstream ||= $stdout
      @_rl_in_stream = @rl_instream
      @_rl_out_stream = @rl_outstream
      @rl_line_buffer = ""
      @rl_terminal_name ||= ENV["TERM"]
      _rl_init_terminal_io(@rl_terminal_name)
      readline_default_bindings()
      _rl_init_eightbit()
      rl_read_init_file(nil)
      if (@_rl_horizontal_scroll_mode && @_rl_term_autowrap)
         @_rl_screenwidth -= 1
         @_rl_screenchars -= @_rl_screenheight
      end
      rl_set_keymap_from_edit_mode()
      bind_arrow_keys()
      if @_rl_enable_meta
         _rl_enable_meta_key()
      end
      @rl_completer_word_break_characters ||= @rl_basic_word_break_characters
   end
   def _rl_init_line_state()
      @rl_point = @rl_end = @rl_mark = 0
      @rl_line_buffer = ""
   end
   def _rl_start_using_history()
      using_history()
      @_rl_saved_line_for_history = nil
   end
   def cr_faster(new, cur)
      (new + 1) < (cur - new)
   end
   def prompt_ending_index()
      if !@rl_byte_oriented
         @prompt_physical_chars
      else
         (@prompt_last_invisible+1)
      end
   end
   def init_line_structures(minsize)
      if @invisible_line.nil?
         if (@line_size < minsize)
            @line_size = minsize
         end
         @visible_line = 0.chr * @line_size
         @invisible_line = 0.chr * @line_size
      elsif (@line_size < minsize)
         @line_size *= 2
         if (@line_size < minsize)
            @line_size = minsize
         end
         @visible_line << 0.chr * (@line_size - @visible_line.length)
         @invisible_line << 1.chr * (@line_size - @invisible_line.length)
      end
      @visible_line[minsize,@line_size-minsize] = 0.chr * (@line_size-minsize)
      @invisible_line[minsize,@line_size-minsize] = 1.chr * (@line_size-minsize)
      if @vis_lbreaks.nil?
         @inv_lbreaks = []
         @vis_lbreaks = []
         @_rl_wrapped_line = []
         @inv_lbreaks[0] = @vis_lbreaks[0] = 0
      end
   end
   def current_history()
      return ((@history_offset == @history_length) || @the_history.nil?) ?
      nil : @the_history[@history_offset]
   end
   def meta_char(c)
      c > "\x7f" && c <= "\xff"
   end
   def ctrl_char(c)
      c < "\x20"
   end
   def isprint(c)
      c >= "\x20" && c < "\x7f"
   end
   def whitespace(c)
      (c == ' ' || c == "\t")
   end
   def w_offset(line, offset)
      ((line) == 0 ? offset : 0)
   end
   def vis_llen(l)
      ((l) > @_rl_vis_botlin ? 0 : (@vis_lbreaks[l+1] - @vis_lbreaks[l]))
   end
   def inv_llen(l)
      (@inv_lbreaks[l+1] - @inv_lbreaks[l])
   end
   def vis_chars(line)
      @visible_line[@vis_lbreaks[line] .. -1]
   end
   def vis_pos(line)
      @vis_lbreaks[line]
   end
   def vis_line(line)
      ((line) > @_rl_vis_botlin) ? "" : vis_chars(line)
   end
   def inv_line(line)
      @invisible_line[@inv_lbreaks[line] .. -1]
   end
   def m_offset(margin, offset)
      ((margin) == 0 ? offset : 0)
   end
   def update_line(old, ostart, new, current_line, omax, nmax, inv_botlin)
      if @encoding == 'X'
         old.force_encoding('ASCII-8BIT')
         new.force_encoding('ASCII-8BIT')
      end
      if !@rl_byte_oriented
         temp = @_rl_last_c_pos
      else
         temp = @_rl_last_c_pos - w_offset(@_rl_last_v_pos, @visible_wrap_offset)
      end
      if (temp == @_rl_screenwidth && @_rl_term_autowrap && !@_rl_horizontal_scroll_mode &&
         @_rl_last_v_pos == current_line - 1)
         if (!@rl_byte_oriented)
            if (@_rl_wrapped_line[current_line] > 0)
               _rl_clear_to_eol(@_rl_wrapped_line[current_line])
            end
            if new[0,1] != 0.chr
               case @encoding
               when 'E'
                  wc = new.scan(/./me)[0]
                  ret = wc.length
                  tempwidth = wc.length
               when 'S'
                  wc = new.scan(/./ms)[0]
                  ret = wc.length
                  tempwidth = wc.length
               when 'U'
                  wc = new.scan(/./mu)[0]
                  ret = wc.length
                  tempwidth = wc.unpack('U').first >= 0x1000 ? 2 : 1
               when 'X'
                  wc = new[0..-1].force_encoding(@encoding_name)[0]
                  ret = wc.bytesize
                  tempwidth = wc.ord >= 0x1000 ? 2 : 1
               else
                  ret = 1
                  tempwidth = 1
               end
            else
               tempwidth = 0
            end
            if (tempwidth > 0)
               bytes = ret
               @rl_outstream.write(new[0,bytes])
               @_rl_last_c_pos = tempwidth
               @_rl_last_v_pos+=1
               if old[ostart,1] != 0.chr
                  case @encoding
                  when 'E'
                     wc = old[ostart..-1].scan(/./me)[0]
                     ret = wc.length
                  when 'S'
                     wc = old[ostart..-1].scan(/./ms)[0]
                     ret = wc.length
                  when 'U'
                     wc = old[ostart..-1].scan(/./mu)[0]
                     ret = wc.length
                  when 'X'
                     wc = old[ostart..-1].force_encoding(@encoding_name)[0]
                     ret = wc.bytesize
                  end
               else
                  ret = 0
               end
               if (ret != 0 && bytes != 0)
                  if ret != bytes
                     len = old[ostart..-1].index(0.chr,ret)
                     old[ostart+bytes,len-ret] = old[ostart+ret,len-ret]
                  end
                  old[ostart,bytes] = new[0,bytes]
               end
            else
               @rl_outstream.write(' ')
               @_rl_last_c_pos = 1
               @_rl_last_v_pos+=1
               if (old[ostart,1] != 0.chr && new[0,1] != 0.chr)
                  old[ostart,1] = new[0,1]
               end
            end
         else
            if (new[0,1] != 0.chr)
               @rl_outstream.write(new[0,1])
            else
               @rl_outstream.write(' ')
            end
            @_rl_last_c_pos = 1
            @_rl_last_v_pos+=1
            if (old[ostart,1] != 0.chr && new[0,1] != 0.chr)
               old[ostart,1] = new[0,1]
            end
         end
      end
      if (!@rl_byte_oriented)
         if (index = old.index(0.chr)) && omax+ostart>index
            omax = index - ostart
         end
         if (index = new.index(0.chr)) && nmax>index
            nmax = index
         end
         temp = (omax < nmax) ? omax : nmax
         if old[ostart,temp]==new[0,temp]
            ofd = temp
            nfd = temp
         else
            if (omax == nmax && new[0,omax]==old[ostart,omax])
               ofd = omax
               nfd = nmax
            else
               new_offset = 0
               old_offset = ostart
               ofd = 0
               nfd = 0
               while(ofd < omax && old[ostart+ofd,1] != 0.chr &&
                  _rl_compare_chars(old, old_offset, new, new_offset))
                  old_offset = _rl_find_next_mbchar(old, old_offset, 1, MB_FIND_ANY)
                  new_offset = _rl_find_next_mbchar(new, new_offset, 1, MB_FIND_ANY)
                  ofd = old_offset - ostart
                  nfd = new_offset
               end
            end
         end
      else
         ofd = 0
         nfd = 0
         while(ofd < omax && old[ostart+ofd,1] != 0.chr && old[ostart+ofd,1] == new[nfd,1])
            ofd += 1
            nfd += 1
         end
      end
      oe = old.index(0.chr,ostart+ofd) - ostart
      if oe.nil? || oe>omax
         oe = omax
      end
      ne = new.index(0.chr,nfd)
      if ne.nil? || ne>omax
         ne = nmax
      end
      if (ofd == oe && nfd == ne)
         return
      end
      wsatend = true
      if (!@rl_byte_oriented)
         ols = _rl_find_prev_mbchar(old, ostart+oe, MB_FIND_ANY) - ostart
         nls = _rl_find_prev_mbchar(new, ne, MB_FIND_ANY)
         while ((ols > ofd) && (nls > nfd))
            if (!_rl_compare_chars(old, ostart+ols, new, nls))
               break
            end
            if (old[ostart+ols,1] == " ")
               wsatend = false
            end
            ols = _rl_find_prev_mbchar(old, ols+ostart, MB_FIND_ANY) - ostart
            nls = _rl_find_prev_mbchar(new, nls, MB_FIND_ANY)
         end
      else
         ols = oe - 1
         nls = ne - 1
         while ((ols > ofd) && (nls > nfd) && old[ostart+ols,1] == new[nls,1])
            if (old[ostart+ols,1] != " ")
               wsatend = false
            end
            ols-=1
            nls-=1
         end
      end
      if (wsatend)
         ols = oe
         nls = ne
      elsif (!_rl_compare_chars(old, ostart+ols, new, nls))
         if (old[ostart+ols,1] != 0.chr)
            if !@rl_byte_oriented
               ols = _rl_find_next_mbchar(old, ostart+ols, 1, MB_FIND_ANY) - ostart
            else
               ols+=1
            end
         end
         if (new[nls,1] != 0.chr )
            if !@rl_byte_oriented
               nls = _rl_find_next_mbchar(new, nls, 1, MB_FIND_ANY)
            else
               nls+=1
            end
         end
      end
      current_invis_chars = w_offset(current_line, @wrap_offset)
      if (@_rl_last_v_pos != current_line)
         _rl_move_vert(current_line)
         if (@rl_byte_oriented && current_line == 0 && @visible_wrap_offset!=0)
            @_rl_last_c_pos += @visible_wrap_offset
         end
      end
      lendiff = @local_prompt_len
      if (current_line == 0 && !@_rl_horizontal_scroll_mode &&
         @_rl_term_cr && lendiff > @prompt_visible_length && @_rl_last_c_pos > 0 &&
         ofd >= lendiff && @_rl_last_c_pos < prompt_ending_index())
         @rl_outstream.write(@_rl_term_cr)
         _rl_output_some_chars(@local_prompt,0,lendiff)
         if !@rl_byte_oriented
            @_rl_last_c_pos = _rl_col_width(@local_prompt, 0, lendiff) - @wrap_offset
            @cpos_adjusted = true
         else
            @_rl_last_c_pos = lendiff
         end
      end
      _rl_move_cursor_relative(ofd, old, ostart)
      if (current_line == 0 && !@rl_byte_oriented && @_rl_last_c_pos == @prompt_physical_chars)
         @cpos_adjusted = true
      end
      lendiff = (nls - nfd) - (ols - ofd)
      if !@rl_byte_oriented
         col_lendiff = _rl_col_width(new, nfd, nls) - _rl_col_width(old, ostart+ofd, ostart+ols)
      else
         col_lendiff = lendiff
      end
      if (current_line == 0 && !@_rl_horizontal_scroll_mode &&
         current_invis_chars != @visible_wrap_offset)
         if !@rl_byte_oriented
            lendiff += @visible_wrap_offset - current_invis_chars
            col_lendiff += @visible_wrap_offset - current_invis_chars
         else
            lendiff += @visible_wrap_offset - current_invis_chars
            col_lendiff = lendiff
         end
      end
      temp = ne - nfd
      if !@rl_byte_oriented
         col_temp = _rl_col_width(new,nfd,ne)
      else
         col_temp = temp
      end
      if (col_lendiff > 0)
         gl = current_line >= @_rl_vis_botlin && inv_botlin > @_rl_vis_botlin
         if (@_rl_terminal_can_insert && ((2 * col_temp) >= col_lendiff || @_rl_term_IC) && (!@_rl_term_autowrap || !gl))
            if (old[ostart+ols,1] != 0.chr && (!@_rl_horizontal_scroll_mode || @_rl_last_c_pos > 0 ||
               lendiff <= @prompt_visible_length || current_invis_chars==0))
               insert_some_chars(new[nfd..-1], lendiff, col_lendiff)
               @_rl_last_c_pos += col_lendiff
            elsif ((@rl_byte_oriented) && old[ostart+ols,1] == 0.chr && lendiff > 0)
               _rl_output_some_chars(new,nfd, lendiff)
               @_rl_last_c_pos += col_lendiff
            else
               _rl_output_some_chars(new,nfd, temp)
               @_rl_last_c_pos += col_temp
               return
            end
            temp = nls - nfd
            if ((temp - lendiff) > 0)
               _rl_output_some_chars(new,(nfd + lendiff),temp - lendiff)
               @_rl_last_c_pos += _rl_col_width(new,nfd+lendiff, nfd+lendiff+temp-col_lendiff)
            end
         else
            _rl_output_some_chars(new,nfd, temp)
            @_rl_last_c_pos += col_temp
         end
      else
         if (@_rl_term_dc && (2 * col_temp) >= -col_lendiff)
            if (@_rl_horizontal_scroll_mode && @_rl_last_c_pos == 0 &&
               -lendiff == @visible_wrap_offset)
               col_lendiff = 0
            end
            if (col_lendiff!=0)
               delete_chars(-col_lendiff)
            end
            temp = nls - nfd
            if (temp > 0)
               _rl_output_some_chars(new,nfd, temp)
               @_rl_last_c_pos += _rl_col_width(new,nfd,nfd+temp)
            end
         else
            if (temp > 0)
               _rl_output_some_chars(new,nfd, temp)
               @_rl_last_c_pos += col_temp
            end
            lendiff = (oe) - (ne)
            if !@rl_byte_oriented
               col_lendiff = _rl_col_width(old, ostart, ostart+oe) - _rl_col_width(new, 0, ne)
            else
               col_lendiff = lendiff
            end
            if (col_lendiff!=0)
               if (@_rl_term_autowrap && current_line < inv_botlin)
                  space_to_eol(col_lendiff)
               else
                  _rl_clear_to_eol(col_lendiff)
               end
            end
         end
      end
   end
   def rl_redisplay()
      return if !@readline_echoing_p
      _rl_wrapped_multicolumn = 0
      @rl_display_prompt ||= ""
      if (@invisible_line.nil? || @vis_lbreaks.nil?)
         init_line_structures(0)
         rl_on_new_line()
      end
      @cpos_buffer_position = -1
      line = @invisible_line
      out = inv_botlin = 0
      modmark = 0
      if (@_rl_mark_modified_lines && current_history() && @rl_undo_list)
         line[out,1] = '*'
         out += 1
         line[out,1] = 0.chr
         modmark = 1
      end
      if (@visible_line[0,1] != @invisible_line[0,1])
         @rl_display_fixed = false
      end
      if (@rl_display_prompt == @rl_prompt || @local_prompt)
         if (@local_prompt_prefix && @forced_display)
            _rl_output_some_chars(@local_prompt_prefix,0,@local_prompt_prefix.length)
         end
         if (@local_prompt_len > 0)
            temp = @local_prompt_len + out + 2
            if (temp >= @line_size)
               @line_size = (temp + 1024) - (temp % 1024)
               if @visible_line.length >= @line_size
                  @visible_line = @visible_line[0,@line_size]
               else
                  @visible_line += 0.chr * (@line_size-@visible_line.length)
               end
               if @invisible_line.length >= @line_size
                  @invisible_line = @invisible_line[0,@line_size]
               else
                  @invisible_line += 0.chr * (@line_size-@invisible_line.length)
               end
               if @encoding=='X'
                  @visible_line.force_encoding('ASCII-8BIT')
                  @invisible_line.force_encoding('ASCII-8BIT')
               end
               line = @invisible_line
            end
            line[out,@local_prompt_len] = @local_prompt
            out += @local_prompt_len
         end
         line[out,1] = 0.chr
         @wrap_offset = @local_prompt_len - @prompt_visible_length
      else
         prompt_this_line = @rl_display_prompt.rindex("\n")
         if prompt_this_line.nil?
            prompt_this_line = 0
         else
            prompt_this_line+=1
            pmtlen = prompt_this_line
            if (@forced_display)
               _rl_output_some_chars(@rl_display_prompt,0,pmtlen)
               if (pmtlen < 2 || @rl_display_prompt[prompt_this_line-2,1] != "\r")
                  cr()
               end
            end
         end
         @prompt_physical_chars = pmtlen = @rl_display_prompt.length - prompt_this_line
         temp = pmtlen + out + 2
         if (temp >= @line_size)
            @line_size = (temp + 1024) - (temp % 1024)
            if @visible_line.length >= @line_size
               @visible_line = @visible_line[0,@line_size]
            else
               @visible_line += 0.chr * (@line_size-@visible_line.length)
            end
            if @invisible_line.length >= @line_size
               @invisible_line = @invisible_line[0,@line_size]
            else
               @invisible_line += 0.chr * (@line_size-@invisible_line.length)
            end
            if @encoding=='X'
               @visible_line.force_encoding('ASCII-8BIT')
               @invisible_line.force_encoding('ASCII-8BIT')
            end
            line = @invisible_line
         end
         line[out,pmtlen] = @rl_display_prompt[prompt_this_line,pmtlen]
         out += pmtlen
         line[out,1] = 0.chr
         @wrap_offset = @prompt_invis_chars_first_line = 0
      end
      @inv_lbreaks[newlines = 0] = 0
      lpos = @prompt_physical_chars + modmark
      @_rl_wrapped_line = Array.new(@visible_line.length,0)
      num = 0
      while (lpos >= @_rl_screenwidth)
         if (!@rl_byte_oriented)
            n0 = num
            temp = @local_prompt_len
            while (num < temp)
               z = _rl_col_width(@local_prompt, n0, num)
               if (z > @_rl_screenwidth)
                  num = _rl_find_prev_mbchar(@local_prompt, num, MB_FIND_ANY)
                  break
               elsif (z == @_rl_screenwidth)
                  break
               end
               num+=1
            end
            temp = num
         else
            temp = ((newlines + 1) * @_rl_screenwidth)
         end
         temp += (@local_prompt_prefix.nil? ? ((newlines == 0) ? @prompt_invis_chars_first_line :
         ((newlines == 1) ? @wrap_offset : 0)) :
         ((newlines == 0) ? @wrap_offset : 0))
         @inv_lbreaks[newlines+=1] = temp
         if !@rl_byte_oriented
            lpos -= _rl_col_width(@local_prompt, n0, num)
         else
            lpos -= @_rl_screenwidth
         end
      end
      @prompt_last_screen_line = newlines
      lb_linenum = 0
      _in = 0
      if !@rl_byte_oriented && @rl_end>0
         case @encoding
         when 'E'
            wc = @rl_line_buffer[0,@rl_end].scan(/./me)[0]
            wc_bytes = wc ? wc.length : 1
         when 'S'
            wc = @rl_line_buffer[0,@rl_end].scan(/./ms)[0]
            wc_bytes = wc ? wc.length : 1
         when 'U'
            wc = @rl_line_buffer[0,@rl_end].scan(/./mu)[0]
            wc_bytes = wc ? wc.length : 1
         when 'X'
            wc = @rl_line_buffer[0,@rl_end].force_encoding(@encoding_name)[0]
            wc_bytes = wc ? wc.bytesize : 1
         end
      else
         wc_bytes = 1
      end
      while(_in < @rl_end)
         c = @rl_line_buffer[_in,1]
         if(c == 0.chr)
            @rl_end = _in
            break
         end
         if (!@rl_byte_oriented)
            case @encoding
            when 'U'
               wc_width = wc && wc.unpack('U').first >= 0x1000 ? 2 : 1
            when 'X'
               wc_width = wc && wc.ord > 0x1000 ? 2 : 1
            else
               wc_width = wc ? wc.length : 1
            end
         end
         if (out + 8 >= @line_size)
            @line_size *= 2
            if @visible_line.length>=@line_size
               @visible_line = @visible_line[0,@line_size]
            else
               @visible_line += 0.chr * (@line_size-@visible_line.length)
            end
            if @invisible_line.length>=@line_size
               @invisible_line = @invisible_line[0,@line_size]
            else
               @invisible_line += 0.chr * (@line_size-@invisible_line.length)
            end
            line = @invisible_line
         end
         if (_in == @rl_point)
            @cpos_buffer_position = out
            lb_linenum = newlines
         end
         if (false && meta_char(c))
            if (!@_rl_output_meta_chars && false)
               line[out,4] = "\\%03o" % c.ord
               if (lpos + 4 >= @_rl_screenwidth)
                  temp = @_rl_screenwidth - lpos
                  @inv_lbreaks[newlines+=1] = out + temp
                  lpos = 4 - temp
               else
                  lpos += 4
               end
               out += 4
            else
               line[out,1] = c
               out += 1
               lpos+=1
               if (lpos >= @_rl_screenwidth)
                  @inv_lbreaks[newlines+=1] = out
                  @_rl_wrapped_line[newlines] = _rl_wrapped_multicolumn
                  lpos = 0
               end
            end
         elsif (c == "\t")
            newout = out + 8 - lpos % 8
            temp = newout - out
            if (lpos + temp >= @_rl_screenwidth)
               temp2 = @_rl_screenwidth - lpos
               @inv_lbreaks[newlines+=1] = out + temp2
               lpos = temp - temp2
               while (out < newout)
                  line[out,1] = ' '
                  out += 1
               end
            else
               while (out < newout)
                  line[out,1] = ' '
                  out += 1
               end
               lpos += temp
            end
         elsif (c == "\n" && !@_rl_horizontal_scroll_mode && @_rl_term_up)
            line[out,1] = 0.chr
            out += 1
            @inv_lbreaks[newlines+=1] = out
            lpos = 0
         elsif (ctrl_char(c) || c == RUBOUT)
            line[out,1] = '^'
            out += 1
            lpos+=1
            if (lpos >= @_rl_screenwidth)
               @inv_lbreaks[newlines+=1] = out
               @_rl_wrapped_line[newlines] = _rl_wrapped_multicolumn
               lpos = 0
            end
            line[out,1] = ctrl_char(c) ? (c[0].ord|0x40).chr.upcase : '?'
            out += 1
            lpos+=1
            if (lpos >= @_rl_screenwidth)
               @inv_lbreaks[newlines+=1] = out
               @_rl_wrapped_line[newlines] = _rl_wrapped_multicolumn
               lpos = 0
            end
         else
            if (!@rl_byte_oriented)
               _rl_wrapped_multicolumn = 0
               if (@_rl_screenwidth < lpos + wc_width)
                  for i in lpos ... @_rl_screenwidth
                     line[out,1] = ' '
                     out += 1
                     _rl_wrapped_multicolumn+=1
                     lpos+=1
                     if (lpos >= @_rl_screenwidth)
                        @inv_lbreaks[newlines+=1] = out
                        @_rl_wrapped_line[newlines] = _rl_wrapped_multicolumn
                        lpos = 0
                     end
                  end
               end
               if (_in == @rl_point)
                  @cpos_buffer_position = out
                  lb_linenum = newlines
               end
               line[out,wc_bytes] = @rl_line_buffer[_in,wc_bytes]
               out += wc_bytes
               for i in 0 ... wc_width
                  lpos+=1
                  if (lpos >= @_rl_screenwidth)
                     @inv_lbreaks[newlines+=1] = out
                     @_rl_wrapped_line[newlines] = _rl_wrapped_multicolumn
                     lpos = 0
                  end
               end
            else
               line[out,1] = c
               out += 1
               lpos+=1
               if (lpos >= @_rl_screenwidth)
                  @inv_lbreaks[newlines+=1] = out
                  @_rl_wrapped_line[newlines] = _rl_wrapped_multicolumn
                  lpos = 0
               end
            end
         end
         if (!@rl_byte_oriented)
            _in += wc_bytes
            case @encoding
            when 'E'
               wc = @rl_line_buffer[_in,@rl_end - _in].scan(/./me)[0]
               wc_bytes = wc ? wc.length : 1
            when 'S'
               wc = @rl_line_buffer[_in,@rl_end - _in].scan(/./ms)[0]
               wc_bytes = wc ? wc.length : 1
            when 'U'
               wc = @rl_line_buffer[_in,@rl_end - _in].scan(/./mu)[0]
               wc_bytes = wc ? wc.length : 1
            when 'X'
               wc = @rl_line_buffer[_in,@rl_end - _in].force_encoding(@encoding_name)[0]
               wc_bytes = wc ? wc.bytesize : 1
            end
         else
            _in+=1
         end
      end
      line[out,1] = 0.chr
      if (@cpos_buffer_position < 0)
         @cpos_buffer_position = out
         lb_linenum = newlines
      end
      inv_botlin = lb_botlin = newlines
      @inv_lbreaks[newlines+1] = out
      cursor_linenum = lb_linenum
      if (!@_rl_horizontal_scroll_mode && @_rl_term_up)
         if (!@rl_display_fixed || @forced_display)
            @forced_display = false
            if (out >= @_rl_screenchars)
               if (!@rl_byte_oriented)
                  out = _rl_find_prev_mbchar(line, @_rl_screenchars, MB_FIND_ANY)
               else
                  out = @_rl_screenchars - 1
               end
            end
            for linenum in  0 .. inv_botlin
               o_cpos = @_rl_last_c_pos
               @cpos_adjusted = false
               update_line(@visible_line,vis_pos(linenum), inv_line(linenum), linenum,
               vis_llen(linenum), inv_llen(linenum), inv_botlin)
               if (linenum == 0 && !@rl_byte_oriented &&
                  !@cpos_adjusted &&
                  @_rl_last_c_pos != o_cpos &&
                  @_rl_last_c_pos > @wrap_offset &&
                  o_cpos < @prompt_last_invisible)
                  @_rl_last_c_pos -= @wrap_offset
               end
               if (linenum == 0 &&
                  inv_botlin == 0 && @_rl_last_c_pos == out &&
                  (@wrap_offset > @visible_wrap_offset) &&
                  (@_rl_last_c_pos < @visible_first_line_len))
                  if !@rl_byte_oriented
                     nleft = @_rl_screenwidth - @_rl_last_c_pos
                  else
                     nleft = @_rl_screenwidth + @wrap_offset - @_rl_last_c_pos
                  end
                  if (nleft!=0)
                     _rl_clear_to_eol(nleft)
                  end
               end
               if (linenum == 0)
                  @visible_first_line_len = (inv_botlin > 0) ? @inv_lbreaks[1] : out - @wrap_offset
               end
            end
            if (@_rl_vis_botlin > inv_botlin)
               while(linenum <= @_rl_vis_botlin)
                  tt = vis_chars(linenum)
                  _rl_move_vert(linenum)
                  _rl_move_cursor_relative(0, tt)
                  _rl_clear_to_eol((linenum == @_rl_vis_botlin) ? tt.length : @_rl_screenwidth)
                  linenum += 1
               end
            end
            @_rl_vis_botlin = inv_botlin
            changed_screen_line = @_rl_last_v_pos != cursor_linenum
            if (changed_screen_line)
               _rl_move_vert(cursor_linenum)
               if (@rl_byte_oriented && cursor_linenum == 0 && @wrap_offset!=0)
                  @_rl_last_c_pos += @wrap_offset
               end
            end
            nleft = @prompt_visible_length + @wrap_offset
            if (cursor_linenum == 0 && @wrap_offset > 0 && @_rl_last_c_pos > 0 &&
               @_rl_last_c_pos < prompt_ending_index() && @local_prompt)
               if (@_rl_term_cr)
                  @rl_outstream.write(@_rl_term_cr)
               end
               _rl_output_some_chars(@local_prompt,0,nleft)
               if !@rl_byte_oriented
                  @_rl_last_c_pos = _rl_col_width(@local_prompt, 0, nleft) - @wrap_offset
               else
                  @_rl_last_c_pos = nleft
               end
            end
            pos = @inv_lbreaks[cursor_linenum]
            nleft = @cpos_buffer_position - pos
            if (@wrap_offset!=0 && cursor_linenum == 0 && nleft < @_rl_last_c_pos)
               if !@rl_byte_oriented
                  tx = _rl_col_width(@visible_line, pos, pos+nleft) - @visible_wrap_offset
               else
                  tx = nleft
               end
               if (@_rl_last_c_pos > tx)
                  _rl_backspace(@_rl_last_c_pos - tx)
                  @_rl_last_c_pos = tx
               end
            end
            if !@rl_byte_oriented
               _rl_move_cursor_relative(nleft, @invisible_line,pos)
            elsif (nleft != @_rl_last_c_pos)
               _rl_move_cursor_relative(nleft, @invisible_line,pos)
            end
         end
      else
         @_rl_last_v_pos = 0
         ndisp = @cpos_buffer_position - @wrap_offset
         nleft  = @prompt_visible_length + @wrap_offset
         phys_c_pos = @cpos_buffer_position - (@last_lmargin!=0 ? @last_lmargin : @wrap_offset)
         t = @_rl_screenwidth / 3
         if (phys_c_pos > @_rl_screenwidth - 2)
            lmargin = @cpos_buffer_position - (2 * t)
            if (lmargin < 0)
               lmargin = 0
            end
            if (@wrap_offset!=0 && lmargin > 0 && lmargin < nleft)
               lmargin = nleft
            end
         elsif (ndisp < @_rl_screenwidth - 2)
            lmargin = 0
         elsif (phys_c_pos < 1)
            lmargin = ((@cpos_buffer_position - 1) / t) * t
            if (@wrap_offset!=0 && lmargin > 0 && lmargin < nleft)
               lmargin = nleft
            end
         else
            lmargin = @last_lmargin
         end
         if (lmargin > 0)
            line[lmargin,1] = '<'
         end
         t = lmargin + m_offset(lmargin, @wrap_offset) + @_rl_screenwidth
         if (t < out)
            line[t - 1,1] = '>'
         end
         if (!@rl_display_fixed || @forced_display || lmargin != @last_lmargin)
            @forced_display = false
            update_line(@visible_line,@last_lmargin,@invisible_line[lmargin..-1],
            0,
            @_rl_screenwidth + @visible_wrap_offset,
            @_rl_screenwidth + (lmargin ? 0 : @wrap_offset),
            0)
            t = @_rl_last_c_pos - m_offset(lmargin, @wrap_offset)
            if ((m_offset(lmargin, @wrap_offset) > @visible_wrap_offset) &&
               (@_rl_last_c_pos == out) &&
               t < @visible_first_line_len)
               nleft = @_rl_screenwidth - t
               _rl_clear_to_eol(nleft)
            end
            @visible_first_line_len = out - lmargin - m_offset(lmargin, @wrap_offset)
            if (@visible_first_line_len > @_rl_screenwidth)
               @visible_first_line_len = @_rl_screenwidth
            end
            _rl_move_cursor_relative(@cpos_buffer_position - lmargin, @invisible_line ,lmargin)
            @last_lmargin = lmargin
         end
      end
      @rl_outstream.flush
      @visible_line,@invisible_line = @invisible_line,@visible_line
      @vis_lbreaks,@inv_lbreaks = @inv_lbreaks,@vis_lbreaks
      @rl_display_fixed = false
      if (@_rl_horizontal_scroll_mode && @last_lmargin!=0)
         @visible_wrap_offset = 0
      else
         @visible_wrap_offset = @wrap_offset
      end
   end
   def rl_line_buffer
      @rl_line_buffer.tr(0.chr, '')
   end
   def rl_on_new_line()
      if (@visible_line)
         @visible_line[0,1] = 0.chr
      end
      @_rl_last_c_pos = @_rl_last_v_pos = 0
      @_rl_vis_botlin = @last_lmargin = 0
      if (@vis_lbreaks)
         @vis_lbreaks[0] = @vis_lbreaks[1] = 0
      end
      @visible_wrap_offset = 0
      0
   end
   def rl_reset_line_state()
      rl_on_new_line()
      @rl_display_prompt = @rl_prompt ? @rl_prompt : ""
      @forced_display = true
      0
   end
   def _rl_vi_initialize_line
      rl_unsetstate(RL_STATE_VICMDONCE)
   end
   def rl_initialize()
      if (!@rl_initialized)
         rl_setstate(RL_STATE_INITIALIZING)
         readline_initialize_everything()
         rl_unsetstate(RL_STATE_INITIALIZING)
         @rl_initialized = true
         rl_setstate(RL_STATE_INITIALIZED)
      end
      _rl_init_line_state()
      @rl_done = false
      rl_unsetstate(RL_STATE_DONE)
      _rl_start_using_history()
      rl_reset_line_state()
      @rl_last_func = nil
      @_rl_parsing_conditionalized_out = 0
      if (@rl_editing_mode == @vi_mode)
         _rl_vi_initialize_line()
      end
      _rl_set_insert_mode(RL_IM_DEFAULT, 1)
      return 0
   end
   def _rl_strip_prompt(pmt)
      return expand_prompt(pmt).first
   end
   def _rl_col_width(string,start,_end)
      return 0 if _end <= start
      index = string.index(0.chr)
      str = index ? string[0,index] : string
      width = 0
      case @encoding
      when 'N'
         return (_end - start)
      when 'U'
         str[start ... _end].scan(/./mu).each {|s| width += s.unpack('U').first >= 0x1000 ? 2 : 1 }
      when 'S'
         str[start ... _end].scan(/./ms).each {|s| width += s.length }
      when 'E'
         str[start ... _end].scan(/./me).each {|s| width += s.length }
      when 'X'
         str[start ... _end].force_encoding(@encoding_name).codepoints.each {|s| width += s > 0x1000 ? 2 : 1 }
      end
      width
   end
   def _rl_output_some_chars(string,start,count)
      @_rl_out_stream.write(string[start,count])
   end
   def rl_on_new_line_with_prompt()
      prompt_size = @rl_prompt.length + 1
      init_line_structures(prompt_size)
      lprompt = @local_prompt ? @local_prompt : @rl_prompt
      @visible_line[0,lprompt.length] = lprompt
      @invisible_line[0,lprompt.length] = lprompt
      prompt_last_line = rl_prompt.rindex("\n")
      if prompt_last_line.nil?
         prompt_last_line = @rl_prompt
      else
         prompt_last_line = @rl_prompt[prompt_last_line..-1]
      end
      l = prompt_last_line.length
      if !@rl_byte_oriented
         @_rl_last_c_pos = _rl_col_width(prompt_last_line, 0, l)
      else
         @_rl_last_c_pos = l
      end
      real_screenwidth = @_rl_screenwidth + (@_rl_term_autowrap ? 0 : 1)
      @_rl_last_v_pos = l / real_screenwidth
      if (l > 0 && (l % real_screenwidth) == 0)
         _rl_output_some_chars("\n",0,1)
      end
      @last_lmargin = 0
      newlines = 0
      i = 0
      while (i <= l)
         @_rl_vis_botlin = newlines
         @vis_lbreaks[newlines] = i
         newlines += 1
         i += real_screenwidth
      end
      @vis_lbreaks[newlines] = l
      @visible_wrap_offset = 0
      @rl_display_prompt = @rl_prompt
      return 0
   end
   def readline_internal_setup()
      @_rl_in_stream = @rl_instream
      @_rl_out_stream = @rl_outstream
      if (@rl_startup_hook)
         send(@rl_startup_hook)
      end
      if (!@readline_echoing_p && @rl_redisplay_function == :rl_redisplay)
         if (@rl_prompt && !@rl_already_prompted)
            nprompt = _rl_strip_prompt(@rl_prompt)
            @_rl_out_stream.write(nprompt)
            @_rl_out_stream.flush
         end
      else
         if (@rl_prompt && @rl_already_prompted)
            rl_on_new_line_with_prompt()
         else
            rl_on_new_line()
         end
         send(@rl_redisplay_function)
      end
      if (@rl_editing_mode == @vi_mode)
         rl_vi_insertion_mode(1, 'i')
      end
      if (@rl_pre_input_hook)
         send(@rl_pre_input_hook)
      end
   end
   def _rl_reset_argument()
      @rl_numeric_arg = @rl_arg_sign = 1
      @rl_explicit_arg = false
      @_rl_argcxt = 0
   end
   def rl_ding()
      if @MessageBeep
         @MessageBeep.Call(0)
      elsif @readline_echoing_p
         if @_rl_bell_preference == VISIBLE_BELL
            if (@_rl_visible_bell)
               @_rl_out_stream.write(@_rl_visible_bell.chr)
            else
               $stderr.write("\007")
               $stderr.flush
            end
         elsif @_rl_bell_preference == AUDIBLE_BELL
            $stderr.write("\007")
            $stderr.flush
         end
         return 0
      end
      return -1
   end
   def _rl_search_getchar(cxt)
      rl_setstate(RL_STATE_MOREINPUT)
      c = cxt.lastc = rl_read_key()
      rl_unsetstate(RL_STATE_MOREINPUT)
      if !@rl_byte_oriented
         cxt.mb = ""
         c = cxt.lastc = _rl_read_mbstring(cxt.lastc, cxt.mb, MB_LEN_MAX)
      end
      c
   end
   def endsrch_char(c)
      ((ctrl_char(c) || meta_char(c) || (c) == RUBOUT) && ((c) != "\C-G"))
   end
   def _rl_input_available
      IO.select([ $stdin ], nil, [ $stdin ], @_keyboard_input_timeout)
   end
   def _rl_isearch_dispatch(cxt, c)
      f = nil
      if (c && @_rl_keymap[c])
         f = @_rl_keymap[c]
         if (f == :rl_reverse_search_history)
            cxt.lastc = (cxt.sflags & SF_REVERSE)!=0 ? -1 : -2
         elsif (f == :rl_forward_search_history)
            cxt.lastc = (cxt.sflags & SF_REVERSE)!=0 ? -2 : -1
         elsif (f == :rl_rubout)
            cxt.lastc = -3
         elsif (c == "\C-G")
            cxt.lastc = -4
         elsif (c == "\C-W")
            cxt.lastc = -5
         elsif (c == "\C-Y")
            cxt.lastc = -6
         end
      end
      if (cxt.search_terminators.include?(cxt.lastc))
         if (cxt.lastc == ESC && _rl_input_available())
            rl_execute_next(ESC)
         end
         return (0)
      end
      if !@rl_byte_oriented
         if (cxt.lastc.class == String && (cxt.mb.length == 1) && endsrch_char(cxt.lastc))
            rl_execute_next(cxt.lastc)
            return (0)
         end
      elsif (cxt.lastc.class == String && endsrch_char(cxt.lastc))
         rl_execute_next(cxt.lastc)
         return (0)
      end
      case (cxt.lastc)
      when -1
         if (cxt.search_string_index == 0)
            if (@last_isearch_string)
               cxt.search_string_size = 64 + @last_isearch_string_len
               cxt.search_string = @last_isearch_string.dup
               cxt.search_string_index = @last_isearch_string_len
               rl_display_search(cxt.search_string, (cxt.sflags & SF_REVERSE)!=0, -1)
            else
               return (1)
            end
         elsif (cxt.sflags & SF_REVERSE)!=0
            cxt.sline_index-=1
         elsif (cxt.sline_index != cxt.sline_len)
            cxt.sline_index+=1
         else
            rl_ding()
         end
      when -2
         cxt.direction = -cxt.direction
         if (cxt.direction < 0)
            cxt.sflags |= SF_REVERSE
         else
            cxt.sflags &= ~SF_REVERSE
         end
      when -3
         if (cxt.search_string_index == 0)
            rl_ding()
         else
            cxt.search_string_index -= 1
            cxt.search_string.chop!
         end
      when -4
         rl_replace_line(cxt.lines[cxt.save_line], false)
         @rl_point = cxt.save_point
         @rl_mark = cxt.save_mark
         rl_restore_prompt()
         rl_clear_message()
         return -1
      when -5
         wstart = @rl_point + cxt.search_string_index
         if (wstart >= @rl_end)
            rl_ding()
         else
            cval = _rl_char_value(@rl_line_buffer, wstart)
            if (!_rl_walphabetic(cval))
               rl_ding()
            else
               if !@rl_byte_oriented
                  n = _rl_find_next_mbchar(@rl_line_buffer, wstart, 1, MB_FIND_NONZERO)
               else
                  n = wstart+1
               end
               while (n < @rl_end)
                  cval = _rl_char_value(@rl_line_buffer, n)
                  break if !_rl_walphabetic(cval)
                  if !@rl_byte_oriented
                     n = _rl_find_next_mbchar(@rl_line_buffer, n, 1, MB_FIND_NONZERO)
                  else
                     n = n+1
                  end
               end
               wlen = n - wstart + 1
               if (cxt.search_string_index + wlen + 1 >= cxt.search_string_size)
                  cxt.search_string_size += wlen + 1
               end
               cxt.search_string[cxt.search_string_index..-1] = @rl_line_buffer[wstart,wlen]
               cxt.search_string_index += wlen
            end
         end
      when -6
         wstart = @rl_point + cxt.search_string_index
         if (wstart >= @rl_end)
            rl_ding()
         else
            n = @rl_end - wstart + 1
            if (cxt.search_string_index + n + 1 >= cxt.search_string_size)
               cxt.search_string_size += n + 1
            end
            cxt.search_string[cxt.search_string_index..-1] = @rl_line_buffer[wstart,n]
         end
      else
         if (cxt.search_string_index + 2 >= cxt.search_string_size)
            cxt.search_string_size += 128
         end
         if !@rl_byte_oriented
            for j in 0 ... cxt.mb.length
               cxt.search_string << cxt.mb[j,1]
               cxt.search_string_index += 1
            end
         else
            cxt.search_string << c
            cxt.search_string_index += 1
         end
      end
      while (cxt.sflags &= ~(SF_FOUND|SF_FAILED))!=0
         limit = cxt.sline_len - cxt.search_string_index + 1
         while ((cxt.sflags & SF_REVERSE)!=0 ? (cxt.sline_index >= 0) : (cxt.sline_index < limit))
            if (cxt.search_string[0,cxt.search_string_index] == cxt.sline[cxt.sline_index,cxt.search_string_index])
               cxt.sflags |= SF_FOUND
               break
            else
               cxt.sline_index += cxt.direction
            end
         end
         break if (cxt.sflags & SF_FOUND)!=0
         begin
            cxt.history_pos += cxt.direction
            if ((cxt.sflags & SF_REVERSE)!=0 ? (cxt.history_pos < 0) : (cxt.history_pos == cxt.hlen))
               cxt.sflags |= SF_FAILED
               break
            end
            cxt.sline = cxt.lines[cxt.history_pos]
            cxt.sline_len = cxt.sline.length
         end while ((cxt.prev_line_found && cxt.prev_line_found == cxt.lines[cxt.history_pos]) ||
         (cxt.search_string_index > cxt.sline_len))
         break if (cxt.sflags & SF_FAILED)!=0
         cxt.sline_index = (cxt.sflags & SF_REVERSE)!=0 ? cxt.sline_len - cxt.search_string_index : 0
      end
      if (cxt.sflags & SF_FAILED)!=0
         rl_ding()
         cxt.history_pos = cxt.last_found_line
         return 1
      end
      if (cxt.sflags & SF_FOUND)!=0
         cxt.prev_line_found = cxt.lines[cxt.history_pos]
         rl_replace_line(cxt.lines[cxt.history_pos], false)
         @rl_point = cxt.sline_index
         cxt.last_found_line = cxt.history_pos
         rl_display_search(cxt.search_string, (cxt.sflags & SF_REVERSE)!=0, (cxt.history_pos == cxt.save_line) ? -1 : cxt.history_pos)
      end
      1
   end
   def rl_clear_message()
      @rl_display_prompt = @rl_prompt
      if (@msg_saved_prompt)
         rl_restore_prompt()
         @msg_saved_prompt = nil
      end
      send(@rl_redisplay_function)
      0
   end
   def _rl_isearch_fini(cxt)
      @rl_line_buffer = cxt.lines[cxt.save_line].dup
      rl_restore_prompt()
      @last_isearch_string = cxt.search_string
      @last_isearch_string_len = cxt.search_string_index
      cxt.search_string = nil
      if (cxt.last_found_line < cxt.save_line)
         rl_get_previous_history(cxt.save_line - cxt.last_found_line, 0)
      else
         rl_get_next_history(cxt.last_found_line - cxt.save_line, 0)
      end
      if (cxt.sline_index < 0)
         if (cxt.last_found_line == cxt.save_line)
            cxt.sline_index = cxt.save_point
         else
            cxt.sline_index = @rl_line_buffer.delete(0.chr).length
         end
         @rl_mark = cxt.save_mark
      end
      @rl_point = cxt.sline_index
      rl_clear_message()
   end
   def _rl_isearch_cleanup(cxt, r)
      if (r >= 0)
         _rl_isearch_fini(cxt)
      end
      ctx = nil
      @_rl_iscxt = nil
      rl_unsetstate(RL_STATE_ISEARCH)
      r != 0
   end
   def _rl_dispatch(key, map)
      @_rl_dispatching_keymap = map
      return _rl_dispatch_subseq(key, map, false)
   end
   def _rl_dispatch_subseq(key, map, got_subseq)
      func = map[key]
      if (func)
         @rl_executing_keymap = map
         @rl_dispatching = true
         rl_setstate(RL_STATE_DISPATCHING)
         send(map[key],@rl_numeric_arg * @rl_arg_sign, key)
         rl_unsetstate(RL_STATE_DISPATCHING)
         @rl_dispatching = false
         if (@rl_pending_input == 0 && map[key] != :rl_digit_argument)
            @rl_last_func = map[key]
         end
      else
         if(map.keys.detect{|x| x =~ /^#{Regexp.escape(key)}/})
            key += _rl_subseq_getchar(key)
            return _rl_dispatch_subseq(key,map,got_subseq)
         elsif(key.length>1 && key[1].ord < 0x7f)
            _rl_abort_internal()
            return -1
         else
            @rl_dispatching = true
            rl_setstate(RL_STATE_DISPATCHING)
            send(:rl_insert,@rl_numeric_arg * @rl_arg_sign, key)
            rl_unsetstate(RL_STATE_DISPATCHING)
            @rl_dispatching = false
         end
      end
      0
   end
   def rl_stuff_char(key)
      return 0 if (ibuffer_space() == 0)
      if (key == EOF)
         key = NEWLINE
         @rl_pending_input = EOF
         rl_setstate(RL_STATE_INPUTPENDING)
      end
      @ibuffer[@push_index] = key
      @push_index += 1
      if (@push_index >= @ibuffer_len)
         @push_index = 0
      end
      return 1
   end
   begin
      raise LoadError, "Cygwin is a Posix OS." if RUBY_PLATFORM =~ /\bcygwin\b/i
      raise LoadError, "Not Windows" if RUBY_PLATFORM !~ /mswin|mingw/
      if RUBY_VERSION < '1.9.1'
         require 'Win32API'
      else
         require 'dl'
         class Win32API
            DLL = {}
            TYPEMAP = {"0" => DL::TYPE_VOID, "S" => DL::TYPE_VOIDP, "I" => DL::TYPE_LONG}
            def initialize(dllname, func, import, export = "0", calltype = :stdcall)
               @proto = [import].join.tr("VPpNnLlIi", "0SSI").sub(/^(.)0*$/, '\1')
               handle = DLL[dllname] ||= DL.dlopen(dllname)
               @func = DL::CFunc.new(handle[func], TYPEMAP[export.tr("VPpNnLlIi", "0SSI")], func, calltype)
            end
            def call(*args)
               import = @proto.split("")
               args.each_with_index do |x, i|
                  args[i], = [x == 0 ? nil : x].pack("p").unpack("l!*") if import[i] == "S"
                  args[i], = [x].pack("I").unpack("i") if import[i] == "I"
               end
               ret, = @func.call(args)
               return ret || 0
            end
            alias Call call
         end
      end
      STD_OUTPUT_HANDLE = -11
      STD_INPUT_HANDLE  = -10
      KEY_EVENT = 1
      VK_SHIFT = 0x10
      VK_MENU = 0x12
      VK_LMENU = 0xA4
      VK_RMENU = 0xA5
      LEFT_CTRL_PRESSED         = 0x0008
      RIGHT_CTRL_PRESSED        = 0x0004
      LEFT_ALT_PRESSED          = 0x0002
      RIGHT_ALT_PRESSED         = 0x0001
      @getch = Win32API.new("msvcrt", "_getch", [], 'I')
      @kbhit = Win32API.new("msvcrt", "_kbhit", [], 'I')
      @GetStdHandle = Win32API.new("kernel32","GetStdHandle",['L'],'L')
      @SetConsoleCursorPosition = Win32API.new("kernel32","SetConsoleCursorPosition",['L','L'],'L')
      @GetConsoleScreenBufferInfo = Win32API.new("kernel32","GetConsoleScreenBufferInfo",['L','P'],'L')
      @FillConsoleOutputCharacter = Win32API.new("kernel32","FillConsoleOutputCharacter",['L','L','L','L','P'],'L')
      @ReadConsoleInput = Win32API.new( "kernel32", "ReadConsoleInput", ['L', 'P', 'L', 'P'], 'L' )
      @MessageBeep = Win32API.new("user32","MessageBeep",['L'],'L')
      @GetKeyboardState = Win32API.new("user32","GetKeyboardState",['P'],'L')
      @GetKeyState = Win32API.new("user32","GetKeyState",['L'],'L')
      @hConsoleHandle = @GetStdHandle.Call(STD_OUTPUT_HANDLE)
      @hConsoleInput =  @GetStdHandle.Call(STD_INPUT_HANDLE)
      @pending_count = 0
      @pending_key = nil
      begin
        case `chcp`.scan(/\d+$/).first.to_i
        when 936,949,950,51932,51936,50225
          @encoding = "E"
        when 932,50220,50221,20222
          @encoding = "S"
        when 65001
          @encoding = "U"
        else
          @encoding = "N"
        end
      rescue
        @encoding = "N"
      end
      def rl_getc(stream)
         while (@kbhit.Call == 0)
            sleep(@_keyboard_input_timeout)
         end
         c = @getch.Call
         alt = (@GetKeyState.call(VK_LMENU) & 0x80) != 0
         if c==0 || c==0xE0
            while (@kbhit.Call == 0)
               sleep(@_keyboard_input_timeout)
            end
            r = c.chr + @getch.Call.chr
         else
            r = c.chr
         end
         r = "\e"+r if alt
         r
      end
      def rl_gather_tyi()
         chars_avail = @kbhit.Call
         return 0 if(chars_avail<=0)
         k = send(@rl_getc_function,@rl_instream)
         rl_stuff_char(k)
         return 1
      end
   rescue LoadError
      if ENV["LANG"] =~ /\.UTF-8/
         @encoding = "U"
      elsif ENV["LANG"] =~ /\.EUC/
         @encoding = "E"
      elsif ENV["LANG"] =~ /\.SHIFT/
         @encoding = "S"
      else
         @encoding = "N"
      end
      def rl_getc(stream)
         begin
            c = stream.read(1)
         rescue Errno::EINTR
            c = rl_getc(stream)
         end
         return c ? c : EOF
      end
      def rl_gather_tyi()
         chars_avail = 0
         result = select([@rl_instream],nil,nil,0.1)
         return 0 if result.nil?
         k = send(@rl_getc_function,@rl_instream)
         rl_stuff_char(k)
         return 1
      end
   end
   if (Object.const_defined?('Encoding') and Encoding.respond_to?('default_external'))
      @encoding = "X"
      @encoding_name = Encoding.default_external.to_s
   end
   @rl_byte_oriented = @encoding == "N"
   def rl_read_key()
      @rl_key_sequence_length+=1
      if (@rl_pending_input!=0)
         c = @rl_pending_input
         rl_clear_pending_input()
      else
         if (@rl_event_hook)
            while (@rl_event_hook && (c=rl_get_char()).nil?)
               send(@rl_event_hook)
               if (@rl_done)
                  return ("\n")
               end
               if (rl_gather_tyi() < 0)
                  @rl_done = true
                  return ("\n")
               end
            end
         else
            if (c=rl_get_char()).nil?
               c = send(@rl_getc_function,@rl_instream)
            end
         end
      end
      return (c)
   end
   def ibuffer_space()
      if (@pop_index > @push_index)
         return (@pop_index - @push_index - 1)
      else
         return (@ibuffer_len - (@push_index - @pop_index))
      end
   end
   def rl_get_char()
      if (@push_index == @pop_index)
         return nil
      end
      key = @ibuffer[@pop_index]
      @pop_index += 1
      if (@pop_index >= @ibuffer_len)
         @pop_index = 0
      end
      return key
   end
   def _rl_unget_char(key)
      if (ibuffer_space()!=0)
         @pop_index-=1
         if (@pop_index < 0)
            @pop_index = @ibuffer_len - 1
         end
         @ibuffer[@pop_index] = key
         return (1)
      end
      return (0)
   end
   def _rl_subseq_getchar(key)
      if (key == ESC)
         rl_setstate(RL_STATE_METANEXT)
      end
      rl_setstate(RL_STATE_MOREINPUT)
      k = rl_read_key()
      rl_unsetstate(RL_STATE_MOREINPUT)
      if (key == ESC)
         rl_unsetstate(RL_STATE_METANEXT)
      end
      return k
   end
   def _rl_clear_to_eol(count)
      if (@_rl_term_clreol)
         @rl_outstream.write(@_rl_term_clreol)
      elsif (count!=0)
         space_to_eol(count)
      end
   end
   def space_to_eol(count)
      if @hConsoleHandle
         csbi = 0.chr * 24
         @GetConsoleScreenBufferInfo.Call(@hConsoleHandle,csbi)
         cursor_pos = csbi[4,4].unpack('L').first
         written = 0.chr * 4
         @FillConsoleOutputCharacter.Call(@hConsoleHandle,0x20,count,cursor_pos,written)
      else
         @rl_outstream.write(' ' * count)
      end
      @_rl_last_c_pos += count
   end
   def _rl_clear_screen()
      if (@_rl_term_clrpag)
         @rl_outstream.write(@_rl_term_clrpag)
      else
         rl_crlf()
      end
   end
   def _rl_backspace(count)
      if (@_rl_term_backspace)
         @_rl_out_stream.write(@_rl_term_backspace * count)
      else
         @_rl_out_stream.write("\b"*count)
      end
      0
   end
   def rl_crlf()
      if (@_rl_term_cr)
         @_rl_out_stream.write(@_rl_term_cr)
      end
      @_rl_out_stream.write("\n")
      return 0
   end
   def cr()
      if (@_rl_term_cr)
         @_rl_out_stream.write(@_rl_term_cr)
         @_rl_last_c_pos = 0
      end
   end
   def _rl_erase_entire_line()
      cr()
      _rl_clear_to_eol(0)
      cr()
      @rl_outstream.flush
   end
   def _rl_internal_char_cleanup()
      if (@rl_editing_mode == @vi_mode && @_rl_keymap == @vi_movement_keymap)
         rl_vi_check()
      end
      if (@rl_num_chars_to_read!=0 && @rl_end >= @rl_num_chars_to_read)
         send(@rl_redisplay_function)
         @_rl_want_redisplay = false
         rl_newline(1, "\n")
      end
      if (!@rl_done)
         send(@rl_redisplay_function)
         @_rl_want_redisplay = false
      end
      if (@rl_erase_empty_line && @rl_done && @rl_last_func == :rl_newline &&
         @rl_point == 0 && @rl_end == 0)
         _rl_erase_entire_line()
      end
   end
   def readline_internal_charloop()
      lastc = -1
      eof_found = false
      while (!@rl_done)
         lk = @_rl_last_command_was_kill
         if (@rl_pending_input == 0)
            _rl_reset_argument()
            @rl_key_sequence_length = 0
         end
         rl_setstate(RL_STATE_READCMD)
         c = rl_read_key()
         rl_unsetstate(RL_STATE_READCMD)
         if (c == READERR)
            eof_found = true
            break
         end
         if (c == EOF && @rl_end!=0)
            c = NEWLINE
         end
         if (((c == @_rl_eof_char && lastc != c) || c == EOF) && @rl_end==0)
            eof_found = true
            break
         end
         lastc = c
         if _rl_dispatch(c, @_rl_keymap)== -1
            next
         end
         if (@rl_pending_input == 0 && lk == @_rl_last_command_was_kill)
            @_rl_last_command_was_kill = false
         end
         _rl_internal_char_cleanup()
      end
      eof_found
   end
   def _rl_abort_internal()
      rl_ding()
      rl_clear_message()
      _rl_reset_argument()
      rl_clear_pending_input()
      rl_unsetstate(RL_STATE_MACRODEF)
      @rl_last_func = nil
      send(@rl_redisplay_function)
      @_rl_want_redisplay = false
      0
   end
   def rl_abort(count, key)
      _rl_abort_internal()
   end
   def rl_vi_check()
      if (@rl_point!=0 && @rl_point == @rl_end)
         @rl_point-=1
      end
      0
   end
   def readline_internal_teardown(eof)
      entry = current_history()
      if (entry && @rl_undo_list)
         temp = @rl_line_buffer.delete(0.chr).dup
         rl_revert_line(1, 0)
         entry = replace_history_entry(where_history(), @rl_line_buffer, nil)
         entry = nil
         @rl_line_buffer = temp+0.chr
         temp = nil
      end
      if (@rl_undo_list)
         rl_free_undo_list()
      end
      _rl_set_insert_mode(RL_IM_INSERT, 0)
      (eof ? nil : @rl_line_buffer.delete(0.chr))
   end
   def readline_internal()
      readline_internal_setup()
      eof = readline_internal_charloop()
      readline_internal_teardown(eof)
   end
   def readline(prompt)
      if (@rl_pending_input == EOF)
         rl_clear_pending_input()
         return nil
      end
      rl_set_prompt(prompt)
      rl_initialize()
      @readline_echoing_p = true
      if (@rl_prep_term_function)
         send(@rl_prep_term_function,@_rl_meta_flag)
      end
      rl_set_signals()
      value = readline_internal()
      if(@rl_deprep_term_function)
         send(@rl_deprep_term_function)
      end
      rl_clear_signals()
      value
   end
   def rl_extend_line_buffer(len)
      while (len >= @rl_line_buffer.length)
         @rl_line_buffer << 0.chr * DEFAULT_BUFFER_SIZE
      end
      @the_line = @rl_line_buffer
   end
   def rl_insert_text(string)
      string.delete!(0.chr)
      l = string.length
      return 0 if (l == 0)
      if (@rl_end + l >= @rl_line_buffer.length)
         rl_extend_line_buffer(@rl_end + l)
      end
      @rl_line_buffer[@rl_point,0] = string
      if (!@_rl_doing_an_undo)
         if ((l == 1) &&
            @rl_undo_list &&
            (@rl_undo_list.what == UNDO_INSERT) &&
            (@rl_undo_list.end == @rl_point) &&
            (@rl_undo_list.end - @rl_undo_list.start < 20))
            @rl_undo_list.end+=1
         else
            rl_add_undo(UNDO_INSERT, @rl_point, @rl_point + l, nil)
         end
      end
      @rl_point += l
      @rl_end += l
      if @rl_line_buffer.length <= @rl_end
         @rl_line_buffer << 0.chr * (@rl_end - @rl_line_buffer.length + 1)
      else
         @rl_line_buffer[@rl_end] = "\0"
      end
      l
   end
   def alloc_undo_entry(what, start, _end, text)
      temp = Struct.new(:what,:start,:end,:text,:next).new
      temp.what = what
      temp.start = start
      temp.end = _end
      temp.text = text
      temp.next = nil
      temp
   end
   def rl_add_undo(what, start, _end, text)
      temp = alloc_undo_entry(what, start, _end, text)
      temp.next = @rl_undo_list
      @rl_undo_list = temp
   end
   def rl_delete_text(from, to)
      if (from > to)
         from,to = to,from
      end
      if (to > @rl_end)
         to = @rl_end
         if (from > to)
            from = to
         end
      end
      if (from < 0)
         from = 0
      end
      text = rl_copy_text(from, to)
      diff = to - from
      @rl_line_buffer[from...to] = ''
      @rl_line_buffer << 0.chr * diff
      if (!@_rl_doing_an_undo)
         rl_add_undo(UNDO_DELETE, from, to, text)
      else
         text = nil
      end
      @rl_end -= diff
      @rl_line_buffer[@rl_end] = 0.chr
      return (diff)
   end
   def rl_copy_text(from, to)
      return @rl_line_buffer[from...to]
   end
   def __rl_fix_point(x)
      if (x > @rl_end)
         @rl_end
      elsif (x < 0)
         0
      else
         x
      end
   end
   def _rl_fix_point(fix_mark_too)
      @rl_point = __rl_fix_point(@rl_point)
      if (fix_mark_too)
         @rl_mark = __rl_fix_point(@rl_mark)
      end
   end
   def rl_begin_undo_group()
      rl_add_undo(UNDO_BEGIN, 0, 0, nil)
      @_rl_undo_group_level+=1
      0
   end
   def rl_end_undo_group()
      rl_add_undo(UNDO_END, 0, 0, nil)
      @_rl_undo_group_level-=1
      0
   end
   def rl_free_undo_list()
      replace_history_data(-1, @rl_undo_list, nil)
      @rl_undo_list = nil
   end
   def _rl_replace_text(text, start, _end)
      rl_begin_undo_group()
      rl_delete_text(start, _end + 1)
      @rl_point = start
      n = rl_insert_text(text)
      rl_end_undo_group()
      n
   end
   def rl_replace_line(text, clear_undo)
      len = text.delete(0.chr).length
      @rl_line_buffer = text.dup + 0.chr
      @rl_end = len
      if (clear_undo)
         rl_free_undo_list()
      end
      _rl_fix_point(true)
   end
   def replace_history_data(which,old, new)
      new = new.dup if new
      if (which < -2 || which >= @history_length || @history_length == 0 || @the_history.nil?)
         return
      end
      if (which >= 0)
         entry = @the_history[which]
         if (entry && entry.data == old)
            entry.data = new
         end
         return
      end
      last = -1
      for i in 0 ... @history_length
         entry = @the_history[i]
         if entry.nil?
            next
         end
         if (entry.data == old)
            last = i
            if (which == -1)
               entry.data = new
            end
         end
      end
      if (which == -2 && last >= 0)
         entry = @the_history[last]
         entry.data = new
      end
   end
   def rl_forward_byte(count, key)
      if (count < 0)
         return (rl_backward_byte(-count, key))
      end
      if (count > 0)
         _end = @rl_point + count
         lend = @rl_end > 0 ? @rl_end - ((@rl_editing_mode == @vi_mode)?1:0) : @rl_end
         if (_end > lend)
            @rl_point = lend
            rl_ding()
         else
            @rl_point = _end
         end
      end
      if (@rl_end < 0)
         @rl_end = 0
      end
      return 0
   end
   def rl_forward_char(count, key)
      if @rl_byte_oriented
         return (rl_forward_byte(count, key))
      end
      if (count < 0)
         return (rl_backward_char(-count, key))
      end
      if (count > 0)
         point = _rl_find_next_mbchar(@rl_line_buffer, @rl_point, count, MB_FIND_NONZERO)
         if (@rl_end <= point && @rl_editing_mode == @vi_mode)
            point = _rl_find_prev_mbchar(@rl_line_buffer, @rl_end, MB_FIND_NONZERO)
         end
         if (@rl_point == point)
            rl_ding()
         end
         @rl_point = point
         if (@rl_end < 0)
            @rl_end = 0
         end
      end
      0
   end
   def rl_forward(count, key)
      rl_forward_char(count, key)
   end
   def rl_backward_byte(count, key)
      if (count < 0)
         return (rl_forward_byte(-count, key))
      end
      if (count > 0)
         if (@rl_point < count)
            @rl_point = 0
            rl_ding()
         else
            @rl_point -= count
         end
      end
      if (@rl_point < 0)
         @rl_point = 0
      end
      0
   end
   def rl_backward_char(count, key)
      if @rl_byte_oriented
         return (rl_backward_byte(count, key))
      end
      if (count < 0)
         return (rl_forward_char(-count, key))
      end
      if (count > 0)
         point = @rl_point
         while (count > 0 && point > 0)
            point = _rl_find_prev_mbchar(@rl_line_buffer, point, MB_FIND_NONZERO)
            count-=1
         end
         if (count > 0)
            @rl_point = 0
            rl_ding()
         else
            @rl_point = point
         end
      end
      0
   end
   def rl_backward(count, key)
      rl_backward_char(count, key)
   end
   def rl_beg_of_line(count, key)
      @rl_point = 0
      0
   end
   def rl_end_of_line(count, key)
      @rl_point = @rl_end
      0
   end
   def _rl_char_value(buf,ind)
      buf[ind,1]
   end
   @_rl_allow_pathname_alphabetic_chars = false
   @pathname_alphabetic_chars = '/-_=~.#$'
   def rl_alphabetic(c)
      if c =~ /\w/
         return true
      end
      return !!(@_rl_allow_pathname_alphabetic_chars &&
      @pathname_alphabetic_chars[c])
   end
   def _rl_walphabetic(c)
      rl_alphabetic(c)
   end
   def rl_forward_word(count, key)
      if (count < 0)
         return (rl_backward_word(-count, key))
      end
      while (count>0)
         return 0 if (@rl_point == @rl_end)
         c = _rl_char_value(@rl_line_buffer, @rl_point)
         if (!_rl_walphabetic(c))
            if !@rl_byte_oriented
               @rl_point = _rl_find_next_mbchar(@rl_line_buffer, @rl_point, 1, MB_FIND_NONZERO)
            else
               @rl_point += 1
            end
            while (@rl_point < @rl_end)
               c = _rl_char_value(@rl_line_buffer, @rl_point)
               if (_rl_walphabetic(c))
                  break
               end
               if !@rl_byte_oriented
                  @rl_point = _rl_find_next_mbchar(@rl_line_buffer, @rl_point, 1, MB_FIND_NONZERO)
               else
                  @rl_point += 1
               end
            end
         end
         return 0 if (@rl_point == @rl_end)
         if !@rl_byte_oriented
            @rl_point = _rl_find_next_mbchar(@rl_line_buffer, @rl_point, 1, MB_FIND_NONZERO)
         else
            @rl_point += 1
         end
         while (@rl_point < @rl_end)
            c = _rl_char_value(@rl_line_buffer, @rl_point)
            if (!_rl_walphabetic(c))
               break
            end
            if !@rl_byte_oriented
               @rl_point = _rl_find_next_mbchar(@rl_line_buffer, @rl_point, 1, MB_FIND_NONZERO)
            else
               @rl_point += 1
            end
         end
         count -= 1
      end
      0
   end
   def rl_backward_word(count, key)
      if (count < 0)
         return (rl_forward_word(-count, key))
      end
      while (count>0)
         return 0 if (@rl_point == 0)
         _p =  !@rl_byte_oriented ? _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_NONZERO):(@rl_point-1)
         c = _rl_char_value(@rl_line_buffer, _p)
         if (!_rl_walphabetic(c))
            @rl_point = _p
            while (@rl_point > 0)
               _p = !@rl_byte_oriented ? _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_NONZERO):(@rl_point-1)
               c = _rl_char_value(@rl_line_buffer, _p)
               if (_rl_walphabetic(c))
                  break
               end
               @rl_point = _p
            end
         end
         while (@rl_point>0)
            _p = !@rl_byte_oriented ? _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_NONZERO):(@rl_point-1)
            c = _rl_char_value(@rl_line_buffer, _p)
            if (!_rl_walphabetic(c))
               break
            else
               @rl_point = _p
            end
         end
         count -= 1
      end
      0
   end
   def _rl_current_display_line()
      if (@rl_display_prompt == @rl_prompt)
         nleft = @_rl_last_c_pos - @_rl_screenwidth - @rl_visible_prompt_length
      else
         nleft = @_rl_last_c_pos - @_rl_screenwidth
      end
      if (nleft > 0)
         ret = 1 + nleft / @_rl_screenwidth
      else
         ret = 0
      end
      ret
   end
   def rl_forced_update_display()
      if (@visible_line)
         @visible_line.gsub!(/[^\x00]/,0.chr)
      end
      rl_on_new_line()
      @forced_display=true if !@forced_display
      send(@rl_redisplay_function)
      0
   end
   def rl_refresh_line(ignore1, ignore2)
      curr_line = _rl_current_display_line()
      _rl_move_vert(curr_line)
      _rl_move_cursor_relative(0, @rl_line_buffer)
      _rl_clear_to_eol(0)
      rl_forced_update_display()
      @rl_display_fixed = true
      0
   end
   def rl_clear_screen(count, key)
      if (@rl_explicit_arg)
         rl_refresh_line(count, key)
         return 0
      end
      _rl_clear_screen()
      rl_forced_update_display()
      @rl_display_fixed = true
      0
   end
   def rl_maybe_unsave_line()
      if (@_rl_saved_line_for_history)
         rl_replace_line(@_rl_saved_line_for_history.line, false)
         @rl_undo_list = @_rl_saved_line_for_history.data
         @_rl_saved_line_for_history = nil
         @rl_point = @rl_end
      else
         rl_ding()
      end
      0
   end
   def rl_maybe_save_line()
      if @_rl_saved_line_for_history.nil?
         @_rl_saved_line_for_history = Struct.new(:line,:timestamp,:data).new
         @_rl_saved_line_for_history.line = @rl_line_buffer.dup
         @_rl_saved_line_for_history.timestamp = nil
         @_rl_saved_line_for_history.data = @rl_undo_list
      end
      0
   end
   def where_history()
      @history_offset
   end
   def replace_history_entry (which, line, data)
      if (which < 0 || which >= @history_length)
         return nil
      end
      temp = Struct.new(:line,:timestamp,:data).new
      old_value = @the_history[which]
      temp.line = line.delete(0.chr)
      temp.data = data
      temp.timestamp = old_value.timestamp.dup
      @the_history[which] = temp
      old_value
   end
   def rl_maybe_replace_line()
      temp = current_history()
      if (temp && temp.data != @rl_undo_list)
         temp = replace_history_entry(where_history(), @rl_line_buffer, @rl_undo_list)
      end
      0
   end
   def previous_history()
      @history_offset!=0 ? @the_history[@history_offset-=1] : nil
   end
   def next_history()
      (@history_offset == @history_length) ? nil : @the_history[@history_offset+=1]
   end
   def rl_get_previous_history(count, key)
      if (count < 0)
         return (rl_get_next_history(-count, key))
      end
      if (count == 0)
         return 0
      end
      if (@_rl_history_saved_point == -1 && (@rl_point!=0 || @rl_end!=0))
         @_rl_history_saved_point = (@rl_point == @rl_end) ? -1 : @rl_point
      end
      rl_maybe_save_line()
      rl_maybe_replace_line()
      temp = old_temp = nil
      while (count>0)
         temp = previous_history()
         if temp.nil?
            break
         end
         old_temp = temp
         count -= 1
      end
      if (temp.nil? && old_temp)
         temp = old_temp
      end
      if temp.nil?
         rl_ding()
      else
         rl_replace_from_history(temp, 0)
         _rl_history_set_point()
      end
      0
   end
   def _rl_history_set_point ()
      @rl_point = (@_rl_history_preserve_point && @_rl_history_saved_point != -1) ?
      @_rl_history_saved_point : @rl_end
      if (@rl_point > @rl_end)
         @rl_point = @rl_end
      end
      if (@rl_editing_mode == @vi_mode && @_rl_keymap != @vi_insertion_keymap)
         @rl_point = 0
      end
      if (@rl_editing_mode == @emacs_mode)
         @rl_mark = (@rl_point == @rl_end ? 0 : @rl_end)
      end
   end
   def rl_get_next_history(count, key)
      if (count < 0)
         return (rl_get_previous_history(-count, key))
      end
      if (count == 0)
         return 0
      end
      rl_maybe_replace_line()
      if (@_rl_history_saved_point == -1 && (@rl_point!=0 || @rl_end!=0))
         @_rl_history_saved_point = (@rl_point == @rl_end) ? -1 : @rl_point
      end
      temp = nil
      while (count>0)
         temp = next_history()
         if temp.nil?
            break
         end
         count -= 1
      end
      if temp.nil?
         rl_maybe_unsave_line()
      else
         rl_replace_from_history(temp, 0)
         _rl_history_set_point()
      end
      0
   end
   def rl_arrow_keys(count, c)
      rl_setstate(RL_STATE_MOREINPUT)
      ch = rl_read_key()
      rl_unsetstate(RL_STATE_MOREINPUT)
      case (ch.upcase)
      when 'A'
         rl_get_previous_history(count, ch)
      when 'B'
         rl_get_next_history(count, ch)
      when 'C'
         rl_forward_byte(count, ch)
      when 'D'
         rl_backward_byte(count, ch)
      else
         rl_ding()
      end
      0
   end
   def _rl_any_typein()
      return (@push_index != @pop_index)
   end
   def _rl_insert_typein(c)
      string = c
      while ((key = rl_get_char()) &&
         @_rl_keymap[key] == :rl_insert)
         string << key
      end
      if (key)
         _rl_unget_char(key)
      end
      rl_insert_text(string)
   end
   def _rl_insert_char(count, c)
      return 0 if (count <= 0)
      incoming = ''
      if @rl_byte_oriented
         incoming << c
         incoming_length = 1
      else
         @pending_bytes << c
         if _rl_get_char_len(@pending_bytes) == -2
            return 1
         else
            incoming = @pending_bytes
            @pending_bytes = ''
            incoming_length = incoming.length
         end
      end
      if(count>1)
         string = incoming * count
         rl_insert_text(string)
         string = nil
         return 0
      end
      if @rl_byte_oriented
         if (_rl_any_typein())
            _rl_insert_typein(c)
         else
            rl_insert_text(c)
         end
      else
         rl_insert_text(incoming)
      end
      return 0
   end
   def _rl_overwrite_char(count, c)
      if (count > 0 && !@rl_byte_oriented)
         mbkey = ''
         k = _rl_read_mbstring(c, mbkey, MB_LEN_MAX)
      end
      rl_begin_undo_group()
      count.times do
         if !@rl_byte_oriented
            rl_insert_text(mbkey)
         else
            _rl_insert_char(1, c)
         end
         if (@rl_point < @rl_end)
            rl_delete(1, c)
         end
      end
      rl_end_undo_group()
      return 0
   end
   def rl_insert(count, c)
      ((@rl_insert_mode == RL_IM_INSERT) ? _rl_insert_char(count, c) :
      _rl_overwrite_char(count, c))
   end
   def _rl_insert_next(count)
      rl_setstate(RL_STATE_MOREINPUT)
      c = rl_read_key()
      rl_unsetstate(RL_STATE_MOREINPUT)
      _rl_insert_char(count, c)
   end
   def rl_quoted_insert(count, key)
      _rl_insert_next(count)
   end
   def rl_tab_insert(count, key)
      _rl_insert_char(count, "\t")
   end
   def _rl_vi_save_insert(up)
      if (up.nil? || up.what != UNDO_INSERT)
         if (@vi_insert_buffer_size >= 1)
            @vi_insert_buffer[0] = 0.chr
         end
         return
      end
      start = up.start
      _end = up.end
      len = _end - start + 1
      @vi_insert_buffer = @rl_line_buffer[start,len-1]
   end
   def _rl_vi_done_inserting()
      if (@_rl_vi_doing_insert)
         rl_end_undo_group()
         @_rl_vi_doing_insert = 0
         _rl_vi_save_insert(@rl_undo_list.next)
         @vi_continued_command = 1
      else
         if ((@_rl_vi_last_key_before_insert == 'i' || @_rl_vi_last_key_before_insert == 'a') && @rl_undo_list)
            _rl_vi_save_insert(@rl_undo_list)
         elsif (@_rl_vi_last_key_before_insert == 'C')
            rl_end_undo_group()
         end
         while (@_rl_undo_group_level > 0)
            rl_end_undo_group()
         end
         @vi_continued_command = 0
      end
   end
   def _rl_vi_textmod_command(c)
      return @vi_textmod[c]
   end
   def _rl_vi_reset_last()
      @_rl_vi_last_command = 'i'
      @_rl_vi_last_repeat = 1
      @_rl_vi_last_arg_sign = 1
      @_rl_vi_last_motion = 0
   end
   def _rl_update_final()
      full_lines = false
      if (@_rl_vis_botlin && @_rl_last_c_pos == 0 &&
         @visible_line[@vis_lbreaks[@_rl_vis_botlin],1] == 0.chr )
         @_rl_vis_botlin-=1
         full_lines = true
      end
      _rl_move_vert(@_rl_vis_botlin)
      if (full_lines && @_rl_term_autowrap && (vis_llen(@_rl_vis_botlin) == @_rl_screenwidth))
         last_line = @visible_line[@vis_lbreaks[@_rl_vis_botlin]..-1]
         @cpos_buffer_position = -1
         _rl_move_cursor_relative(@_rl_screenwidth - 1, last_line)
         _rl_clear_to_eol(0)
         @rl_outstream.write(last_line[@_rl_screenwidth - 1,1])
      end
      @_rl_vis_botlin = 0
      rl_crlf()
      @rl_outstream.flush
      @rl_display_fixed = true if !@rl_display_fixed
   end
   def rl_newline(count, key)
      @rl_done = true
      if (@_rl_history_preserve_point)
         @_rl_history_saved_point = (@rl_point == @rl_end) ? 1 : @rl_point
      end
      rl_setstate(RL_STATE_DONE)
      if (@rl_editing_mode == @vi_mode)
         _rl_vi_done_inserting()
         if (_rl_vi_textmod_command(@_rl_vi_last_command).nil?)
            _rl_vi_reset_last()
         end
      end
      if (@rl_erase_empty_line && @rl_point == 0 && @rl_end == 0)
         return 0
      end
      if @readline_echoing_p
         _rl_update_final()
      end
      0
   end
   def rl_do_lowercase_version(ignore1, ignore2)
      0
   end
   def rl_character_len(c, pos)
      if (meta_char(c))
         return ((!@_rl_output_meta_chars) ? 4 : 1)
      end
      if (c == "\t")
         return (((pos | 7) + 1) - pos)
      end
      if (ctrl_char(c) || c == RUBOUT)
         return (2)
      end
      return ((isprint(c)) ? 1 : 2)
   end
   def _rl_overwrite_rubout(count, key)
      if (@rl_point == 0)
         rl_ding()
         return 1
      end
      opoint = @rl_point
      l = 0
      count.times do
         rl_backward_char(1, key)
         l += rl_character_len(@rl_line_buffer[@rl_point,1], @rl_point)
      end
      rl_begin_undo_group()
      if (count > 1 || @rl_explicit_arg)
         rl_kill_text(opoint, @rl_point)
      else
         rl_delete_text(opoint, @rl_point)
      end
      if (@rl_point < @rl_end)
         opoint = @rl_point
         _rl_insert_char(l, ' ')
         @rl_point = opoint
      end
      rl_end_undo_group()
      0
   end
   def rl_rubout(count, key)
      if (count < 0)
         return (rl_delete(-count, key))
      end
      if (@rl_point==0)
         rl_ding()
         return -1
      end
      if (@rl_insert_mode == RL_IM_OVERWRITE)
         return (_rl_overwrite_rubout(count, key))
      end
      _rl_rubout_char(count, key)
   end
   def _rl_erase_at_end_of_line(l)
      _rl_backspace(l)
      @rl_outstream.write(' '*l)
      _rl_backspace(l)
      @_rl_last_c_pos -= l
      @visible_line[@_rl_last_c_pos,l] = 0.chr * l
      @rl_display_fixed = true if !@rl_display_fixed
   end
   def _rl_rubout_char(count, key)
      if (count < 0)
         return (rl_delete(-count, key))
      end
      if (@rl_point == 0)
         rl_ding()
         return -1
      end
      orig_point = @rl_point
      if (count > 1 || @rl_explicit_arg)
         rl_backward_char(count, key)
         rl_kill_text(orig_point, @rl_point)
      elsif (@rl_byte_oriented)
         c = @rl_line_buffer[@rl_point-=1,1]
         rl_delete_text(@rl_point, orig_point)
         if (@rl_point == @rl_end && isprint(c) && @_rl_last_c_pos!=0)
            l = rl_character_len(c, @rl_point)
            _rl_erase_at_end_of_line(l)
         end
      else
         @rl_point = _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_NONZERO)
         rl_delete_text(@rl_point, orig_point)
      end
      0
   end
   def rl_delete(count, key)
      if (count < 0)
         return (_rl_rubout_char(-count, key))
      end
      if (@rl_point == @rl_end)
         rl_ding()
         return -1
      end
      if (count > 1 || @rl_explicit_arg)
         xpoint = @rl_point
         rl_forward_byte(count, key)
         rl_kill_text(xpoint, @rl_point)
         @rl_point = xpoint
      else
         if !@rl_byte_oriented
            xpoint =_rl_find_next_mbchar(@rl_line_buffer, @rl_point, 1, MB_FIND_NONZERO)
         else
            xpoint = @rl_point + 1
         end
         rl_delete_text(@rl_point, xpoint)
      end
      0
   end
   def _rl_copy_to_kill_ring(text, append)
      if (!@_rl_last_command_was_kill)
         if @rl_kill_ring.nil?
            @rl_kill_ring_length = 1
            @rl_kill_ring = Array.new(@rl_kill_ring_length+1)
            @rl_kill_ring[slot = 0] = nil
         else
            slot = @rl_kill_ring_length
            if (slot == @rl_max_kills)
               @rl_kill_ring[0,slot] = @rl_kill_ring[1,slot]
            else
               slot = @rl_kill_ring_length += 1
            end
            @rl_kill_ring[slot-=1] = nil
         end
      else
         slot = @rl_kill_ring_length - 1
      end
      if (@_rl_last_command_was_kill && @rl_editing_mode != @vi_mode)
         old = @rl_kill_ring[slot]
         if (append)
            new = old + text
         else
            new = text + old
         end
         old = nil
         text = nil
         @rl_kill_ring[slot] = new
      else
         @rl_kill_ring[slot] = text
      end
      @rl_kill_index = slot
      0
   end
   def rl_kill_text(from, to)
      if (from == to)
         @_rl_last_command_was_kill = true if !@_rl_last_command_was_kill
         return 0
      end
      text = rl_copy_text(from, to)
      rl_delete_text(from, to)
      _rl_copy_to_kill_ring(text, from < to)
      @_rl_last_command_was_kill = true if !@_rl_last_command_was_kill
      0
   end
   def rl_unix_word_rubout(count, key)
      if (@rl_point == 0)
         rl_ding()
      else
         orig_point = @rl_point
         if (count <= 0)
            count = 1
         end
         while (count>0)
            while (@rl_point>0 && whitespace(@rl_line_buffer[@rl_point - 1,1]))
               @rl_point-=1
            end
            while (@rl_point>0 && !whitespace(@rl_line_buffer[@rl_point - 1,1]))
               @rl_point-=1
            end
            count -= 1
         end
         rl_kill_text(orig_point, @rl_point)
         if (@rl_editing_mode == @emacs_mode)
            @rl_mark = @rl_point
         end
      end
      0
   end
   def rl_unix_filename_rubout(count, key)
      if (@rl_point == 0)
         rl_ding()
      else
         orig_point = @rl_point
         if (count <= 0)
            count = 1
         end
         while (count>0)
            c = @rl_line_buffer[@rl_point - 1,1]
            while (@rl_point>0 && (whitespace(c) || c == '/'))
               @rl_point-=1
               c = @rl_line_buffer[@rl_point - 1,1]
            end
            while (@rl_point>0 && !whitespace(c) && c != '/')
               @rl_point-=1
               c = @rl_line_buffer[@rl_point - 1,1]
            end
            count -= 1
         end
         rl_kill_text(orig_point, @rl_point)
         if (@rl_editing_mode == @emacs_mode)
            @rl_mark = @rl_point
         end
      end
      0
   end
   def rl_rubout_or_delete(count, key)
      if (@rl_end != 0 && @rl_point == @rl_end)
         return (_rl_rubout_char(count, key))
      else
         return (rl_delete(count, key))
      end
   end
   def rl_delete_horizontal_space(count, ignore)
      start = @rl_point
      while (@rl_point!=0 && whitespace(@rl_line_buffer[@rl_point - 1]))
         @rl_point-=1
      end
      start = @rl_point
      while (@rl_point < @rl_end && whitespace(@rl_line_buffer[@rl_point]))
         @rl_point+=1
      end
      if (start != @rl_point)
         rl_delete_text(start, @rl_point)
         @rl_point = start
      end
      if (@rl_point < 0)
         @rl_point = 0
      end
      0
   end
   def rl_possible_completions(ignore, invoking_key)
      rl_complete_internal('?')
   end
   def rl_delete_or_show_completions(count, key)
      if (@rl_end != 0 && @rl_point == @rl_end)
         return (rl_possible_completions(count, key))
      else
         return (rl_delete(count, key))
      end
   end
   def rl_insert_comment(count, key)
      rl_beg_of_line(1, key)
      @rl_comment_text = @_rl_comment_begin ? @_rl_comment_begin : '#'
      if (!@rl_explicit_arg)
         rl_insert_text(@rl_comment_text)
      else
         @rl_comment_len = @rl_comment_text.length
         if @rl_comment_text[0,@rl_comment_len] == @rl_line_buffer[0,@rl_comment_len]
            rl_delete_text(@rl_point, @rl_point + @rl_comment_len)
         else
            rl_insert_text(@rl_comment_text)
         end
      end
      send(@rl_redisplay_function)
      rl_newline(1, "\n")
      0
   end
   def alloc_history_entry(string, ts)
      temp = Struct.new(:line,:data,:timestamp).new
      temp.line = string ? string.delete(0.chr) : string
      temp.data = nil
      temp.timestamp = ts
      return temp
   end
   def hist_inittime()
      t = Time.now.to_i
      ts = "X%u" % t
      ret = ts.dup
      ret[0,1] = @history_comment_char
      ret
   end
   def add_history(string)
      if (@history_stifled && (@history_length == @history_max_entries))
         return if (@history_length == 0)
         @the_history.shift
      else
         if @the_history.nil?
            @the_history = []
            @history_length = 1
         else
            @history_length+=1
         end
      end
      temp = alloc_history_entry(string, hist_inittime())
      @the_history[@history_length] = nil
      @the_history[@history_length - 1] = temp
   end
   def using_history()
      @history_offset = @history_length
   end
   def set_completion_defaults(what_to_do)
      @rl_filename_completion_desired = false
      @rl_filename_quoting_desired = true
      @rl_completion_type = what_to_do
      @rl_completion_suppress_append = @rl_completion_suppress_quote = false
      @rl_completion_mark_symlink_dirs = @_rl_complete_mark_symlink_dirs
   end
   def _rl_find_completion_word()
      _end = @rl_point
      found_quote = 0
      delimiter = 0.chr
      quote_char = 0.chr
      brkchars = nil
      if @rl_completion_word_break_hook
         brkchars = send(@rl_completion_word_break_hook)
      end
      if brkchars.nil?
         brkchars = @rl_completer_word_break_characters
      end
      if (@rl_completer_quote_characters)
         scan = 0
         pass_next = false
         while scan < _end
            if (pass_next)
               pass_next = false
               next
            end
            if (quote_char != "'" && @rl_line_buffer[scan,1] == "\\")
               pass_next = true
               found_quote |= RL_QF_BACKSLASH
               next
            end
            if (quote_char != 0.chr)
               if (@rl_line_buffer[scan,1] == quote_char)
                  quote_char = 0.chr
                  @rl_point = _end
               end
            elsif (@rl_completer_quote_characters.include?(@rl_line_buffer[scan,1]))
               quote_char = @rl_line_buffer[scan,1]
               @rl_point = scan + 1
               if (quote_char == "'")
                  found_quote |= RL_QF_SINGLE_QUOTE
               elsif (quote_char == '"')
                  found_quote |= RL_QF_DOUBLE_QUOTE
               else
                  found_quote |= RL_QF_OTHER_QUOTE
               end
            end
            if !@rl_byte_oriented
               scan = _rl_find_next_mbchar(@rl_line_buffer, scan, 1, MB_FIND_ANY)
            else
               scan += 1
            end
         end
      end
      if (@rl_point == _end && quote_char == 0.chr)
         while (@rl_point =  !@rl_byte_oriented ?
            _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_ANY):(@rl_point-1))>0
            scan = @rl_line_buffer[@rl_point,1]
            if !brkchars.include?(scan)
               next
            end
            if (@rl_char_is_quoted_p && found_quote!=0 &&
               send(@rl_char_is_quoted_p,@rl_line_buffer, @rl_point))
               next
            end
            break
         end
      end
      scan = @rl_line_buffer[@rl_point,1]
      if (scan != 0.chr)
         if (@rl_char_is_quoted_p)
            isbrk = (found_quote == 0 ||
            !send(@rl_char_is_quoted_p,@rl_line_buffer, @rl_point)) &&
            brkchars.include?(scan)
         else
            isbrk = brkchars.include?(scan)
         end
         if (isbrk)
            if (@rl_basic_quote_characters &&
               @rl_basic_quote_characters.include?(scan) &&
               (_end - @rl_point) > 1)
               delimiter = scan
            end
            if (@rl_special_prefixes.nil? || !@rl_special_prefixes.include?(scan) )
               @rl_point+=1
            end
         end
      end
      return [quote_char,found_quote!=0,delimiter]
   end
   def gen_completion_matches(text, start, _end, our_func, found_quote, quote_char)
      @rl_completion_found_quote = found_quote
      @rl_completion_quote_character = quote_char
      if (@rl_attempted_completion_function)
         matches = Readline.send(@rl_attempted_completion_function,text, start, _end)
         if (matches || @rl_attempted_completion_over)
            @rl_attempted_completion_over = false
            return (matches)
         end
      end
      matches = rl_completion_matches(text, our_func)
      matches
   end
   def remove_duplicate_matches(matches)
      if matches.length>0
         matches[1..-2] = matches[1..-2].sort.uniq
      end
      matches
   end
   def postprocess_matches(matchesp, matching_filenames)
      matches = matchesp
      return 0 if matches.nil?
      if (@rl_ignore_completion_duplicates)
         remove_duplicate_matches(matches)
      end
      if (@rl_ignore_some_completions_function && matching_filenames)
         nmatch = matches.length
         send(@rl_ignore_some_completions_function,matches)
         if (matches.nil? || matches[0].nil?)
            matches = nil
            return 0
         else
            i = matches.length
            if (i > 1 && i < nmatch)
               t = matches[0]
               compute_lcd_of_matches(matches, i - 1, t)
            end
         end
      end
      matchesp = matches
      1
   end
   def insert_all_matches(matches, point, qc)
      rl_begin_undo_group()
      if (qc && qc.length>0 && point>0 && @rl_line_buffer[point - 1,1] == qc)
         point-=1
      end
      rl_delete_text(point, @rl_point)
      @rl_point = point
      if (matches[1])
         i = 1
         while(matches[i])
            rp = make_quoted_replacement(matches[i], SINGLE_MATCH, qc)
            rl_insert_text(rp)
            rl_insert_text(" ")
            if (rp != matches[i])
               rp = nil
            end
            i += 1
         end
      else
         rp = make_quoted_replacement(matches[0], SINGLE_MATCH, qc)
         rl_insert_text(rp)
         rl_insert_text(" ")
         if (rp != matches[0])
            rp = nil
         end
      end
      rl_end_undo_group()
   end
   def make_quoted_replacement(match, mtype, qc)
      replacement = match
      should_quote = match && @rl_completer_quote_characters &&
      @rl_filename_completion_desired &&
      @rl_filename_quoting_desired
      if (should_quote)
         should_quote = should_quote && (qc.nil? || qc == 0.chr ||
         (@rl_completer_quote_characters && @rl_completer_quote_characters.include?(qc)))
      end
      if (should_quote)
         should_quote = @rl_filename_quote_characters ?
         !!match[@rl_filename_quote_characters] :
         false
         do_replace = should_quote ? mtype : NO_MATCH
         if (do_replace != NO_MATCH && @rl_filename_quoting_function)
            replacement = send(@rl_filename_quoting_function,match, do_replace, qc)
         end
      end
      replacement
   end
   def insert_match(match, start, mtype, qc)
      oqc = qc
      replacement = make_quoted_replacement(match, mtype, qc)
      if (replacement)
         if (qc && qc.length>0 && start!=0 && @rl_line_buffer[start - 1,1] == qc &&
            replacement[0,1] == qc)
            start-=1
         elsif (qc && (qc != oqc) && start!=0 && @rl_line_buffer[start - 1,1] == oqc &&
            replacement[0,1] != oqc)
            start-=1
         end
         _rl_replace_text(replacement, start, @rl_point - 1)
         if (replacement != match)
            replacement = nil
         end
      end
   end
   def printable_part(pathname)
      if (!@rl_filename_completion_desired)
         return (pathname)
      end
      temp = pathname.rindex('/')
      return pathname if temp.nil?
      File.basename(pathname)
   end
   def fnprint(to_print)
      printed_len = 0
      case @encoding
      when 'E'
         arr = to_print.scan(/./me)
      when 'S'
         arr = to_print.scan(/./ms)
      when 'U'
         arr = to_print.scan(/./mu)
      when 'X'
         arr = to_print.dup.force_encoding(@encoding_name).chars
      else
         arr = to_print.scan(/./m)
      end
      arr.each do |s|
         if(ctrl_char(s))
            @rl_outstream.write('^'+(s[0].ord|0x40).chr.upcase)
            printed_len += 2
         elsif s == RUBOUT
            @rl_outstream.write('^?')
            printed_len += 2
         else
            @rl_outstream.write(s)
            if @encoding=='U'
               printed_len += s.unpack('U').first >= 0x1000 ? 2 : 1
            elsif @encoding=='X'
               printed_len += s.ord >= 0x1000 ? 2 : 1
            else
               printed_len += s.length
            end
         end
      end
      printed_len
   end
   def _rl_internal_pager(lines)
      @rl_outstream.puts "--More--"
      @rl_outstream.flush
      i = get_y_or_n(1)
      _rl_erase_entire_line()
      if (i == 0)
         return -1
      elsif (i == 2)
         return (lines - 1)
      else
         return 0
      end
   end
   def path_isdir(filename)
      return File.directory?(filename)
   end
   def stat_char(filename)
      return nil if !File.exists?(filename)
      return '/' if File.directory?(filename)
      return '%' if File.chardev?(filename)
      return '#' if File.blockdev?(filename)
      return '@' if File.symlink?(filename)
      return '=' if File.socket?(filename)
      return '|' if File.pipe?(filename)
      return '*' if File.executable?(filename)
      nil
   end
   def print_filename(to_print, full_pathname)
      extension_char = 0.chr
      printed_len = fnprint(to_print)
      if (@rl_filename_completion_desired && (@rl_visible_stats || @_rl_complete_mark_directories))
         if (to_print != full_pathname)
            if full_pathname.nil? || full_pathname.length==0
               dn = '/'
            else
               dn = File.dirname(full_pathname)
            end
            s = File.expand_path(dn)
            if (@rl_directory_completion_hook)
               send(@rl_directory_completion_hook,s)
            end
            slen = s.length
            tlen = to_print.length
            new_full_pathname = s.dup
            if (s[-1,1] == '/' )
               slen-=1
            else
               new_full_pathname[slen,1] = '/'
            end
            new_full_pathname[slen .. -1] = '/' + to_print
            if (@rl_visible_stats)
               extension_char = stat_char(new_full_pathname)
            else
               if (path_isdir(new_full_pathname))
                  extension_char = '/'
               end
            end
            new_full_pathname = nil
         else
            s = File.expand_path(full_pathname)
            if (@rl_visible_stats)
               extension_char = stat_char(s)
            else
               if (path_isdir(s))
                  extension_char = '/'
               end
            end
         end
         s = nil
         if (extension_char)
            @rl_outstream.write(extension_char)
            printed_len+=1
         end
      end
      printed_len
   end
   def get_y_or_n(for_pager)
      while(true)
         rl_setstate(RL_STATE_MOREINPUT)
         c = rl_read_key()
         rl_unsetstate(RL_STATE_MOREINPUT)
         if (c == 'y' || c == 'Y' || c == ' ')
            return (1)
         end
         if (c == 'n' || c == 'N' || c == RUBOUT)
            return (0)
         end
         if (c == ABORT_CHAR)
            _rl_abort_internal()
         end
         if (for_pager && (c == NEWLINE || c == RETURN))
            return (2)
         end
         if (for_pager && (c == 'q' || c == 'Q'))
            return (0)
         end
         rl_ding()
      end
   end
   def fnwidth(string)
      left = string.length + 1
      width = pos = 0
      while (string[pos] && string[pos,1] != 0.chr)
         if (ctrl_char(string[0,1]) || string[0,1] == RUBOUT)
            width += 2
            pos+=1
         else
            case @encoding
            when 'E'
               wc = string[pos,left-pos].scan(/./me)[0]
               bytes = wc.length
               tempwidth = wc.length
            when 'S'
               wc = string[pos,left-pos].scan(/./ms)[0]
               bytes = wc.length
               tempwidth = wc.length
            when 'U'
               wc = string[pos,left-pos].scan(/./mu)[0]
               bytes = wc.length
               tempwidth = wc.unpack('U').first >= 0x1000 ? 2 : 1
            when 'X'
               wc = string[pos,left-pos].force_encoding(@encoding_name)[0]
               bytes = wc.bytesize
               tempwidth = wc.ord >= 0x1000 ? 2 : 1
            else
               wc = string[pos,left-pos].scan(/./m)[0]
               bytes = wc.length
               tempwidth = wc.length
            end
            clen = bytes
            pos += clen
            w = tempwidth
            width += (w >= 0) ? w : 1
         end
      end
      width
   end
   def display_matches(matches)
      _rl_move_vert(@_rl_vis_botlin)
      if matches[1].nil?
         temp = printable_part(matches[0])
         rl_crlf()
         print_filename(temp, matches[0])
         rl_crlf()
         rl_forced_update_display()
         @rl_display_fixed = true
         return
      end
      max = 0
      i = 1
      while(matches[i])
         temp = printable_part(matches[i])
         len = fnwidth(temp)
         if (len > max)
            max = len
         end
         i += 1
      end
      len = i - 1
      if (@rl_completion_display_matches_hook)
         send(@rl_completion_display_matches_hook,matches, len, max)
         return
      end
      if (@rl_completion_query_items > 0 && len >= @rl_completion_query_items)
         rl_crlf()
         @rl_outstream.write("Display all #{len} possibilities? (y or n)")
         @rl_outstream.flush
         if (get_y_or_n(false)==0)
            rl_crlf()
            rl_forced_update_display()
            @rl_display_fixed = true
            return
         end
      end
      rl_display_match_list(matches, len, max)
      rl_forced_update_display()
      @rl_display_fixed = true
   end
   def rl_complete_internal(what_to_do)
      rl_setstate(RL_STATE_COMPLETING)
      set_completion_defaults(what_to_do)
      saved_line_buffer = @rl_line_buffer ? @rl_line_buffer.delete(0.chr) : nil
      our_func = @rl_completion_entry_function ?
      @rl_completion_entry_function : :rl_filename_completion_function
      _end = @rl_point
      found_quote = false
      delimiter = 0.chr
      quote_char = 0.chr
      if (@rl_point!=0)
         quote_char,found_quote,delimiter = _rl_find_completion_word()
      end
      start = @rl_point
      @rl_point = _end
      text = rl_copy_text(start, _end)
      matches = gen_completion_matches(text, start, _end, our_func, found_quote, quote_char)
      nontrivial_lcd = !!(matches && text != matches[0])
      text = nil
      if matches.nil?
         rl_ding()
         saved_line_buffer = nil
         @completion_changed_buffer = false
         rl_unsetstate(RL_STATE_COMPLETING)
         return 0
      end
      i = @rl_filename_completion_desired
      if (postprocess_matches(matches, i) == 0)
         rl_ding()
         saved_line_buffer = nil
         @completion_changed_buffer = false
         rl_unsetstate(RL_STATE_COMPLETING)
         return 0
      end
      case (what_to_do)
      when TAB,'!','@'
         if (matches[0])
            insert_match(matches[0], start, matches[1] ? MULT_MATCH : SINGLE_MATCH, quote_char)
         end
         if (matches[1])
            if (what_to_do == '!')
               display_matches(matches)
            elsif (what_to_do == '@')
               if (!nontrivial_lcd)
                  display_matches(matches)
               end
            elsif (@rl_editing_mode != @vi_mode)
               rl_ding()
            end
         else
            append_to_match(matches[0], delimiter, quote_char, nontrivial_lcd)
         end
      when '*'
         insert_all_matches(matches, start, quote_char)
      when '?'
         display_matches(matches)
      else
         $stderr.write("\r\nreadline: bad value #{what_to_do} for what_to_do in rl_complete\n")
         rl_ding()
         saved_line_buffer = nil
         rl_unsetstate(RL_STATE_COMPLETING)
         return 1
      end
      matches = nil
      if (saved_line_buffer)
         @completion_changed_buffer = @rl_line_buffer.delete(0.chr) != saved_line_buffer
         saved_line_buffer = nil
      end
      rl_unsetstate(RL_STATE_COMPLETING)
      0
   end
   def rl_complete(ignore, invoking_key)
      if (@rl_inhibit_completion)
         return (_rl_insert_char(ignore, invoking_key))
      elsif (@rl_last_func == :rl_complete && !@completion_changed_buffer)
         return (rl_complete_internal('?'))
      elsif (@_rl_complete_show_all)
         return (rl_complete_internal('!'))
      elsif (@_rl_complete_show_unmodified)
         return (rl_complete_internal('@'))
      else
         return (rl_complete_internal(TAB))
      end
   end
   def history_get(offset)
      local_index = offset - @history_base
      return (local_index >= @history_length || local_index < 0 || @the_history.nil?) ?
      nil : @the_history[local_index]
   end
   def rl_replace_from_history(entry, flags)
      rl_replace_line(entry.line, false)
      @rl_undo_list = entry.data
      @rl_point = @rl_end
      @rl_mark = 0
      if (@rl_editing_mode == @vi_mode)
         @rl_point = 0
         @rl_mark = @rl_end
      end
   end
   def remove_history(which)
      if (which < 0 || which >= @history_length || @history_length ==  0 || @the_history.nil?)
         return nil
      end
      return_value = @the_history[which]
      @the_history.delete_at(which)
      @history_length-=1
      return_value
   end
   def block_sigint()
      return if @sigint_blocked
      @sigint_blocked = true
   end
   def release_sigint()
      return if !@sigint_blocked
      @sigint_blocked = false
   end
   def save_tty_chars()
      @_rl_last_tty_chars = @_rl_tty_chars
      h = Hash[*`stty -a`.scan(/(\w+) = ([^;]+);/).flatten]
      h.each {|k,v| v.gsub!(/\^(.)/){($1[0].ord ^ ((?a..?z).include?($1[0]) ? 0x60 : 0x40)).chr}}
      @_rl_tty_chars.t_erase = h['erase']
      @_rl_tty_chars.t_kill = h['kill']
      @_rl_tty_chars.t_intr = h['intr']
      @_rl_tty_chars.t_quit = h['quit']
      @_rl_tty_chars.t_start = h['start']
      @_rl_tty_chars.t_stop = h['stop']
      @_rl_tty_chars.t_eof = h['eof']
      @_rl_tty_chars.t_eol = "\n"
      @_rl_tty_chars.t_eol2 = h['eol2']
      @_rl_tty_chars.t_susp = h['susp']
      @_rl_tty_chars.t_dsusp = h['dsusp']
      @_rl_tty_chars.t_reprint = h['rprnt']
      @_rl_tty_chars.t_flush = h['flush']
      @_rl_tty_chars.t_werase = h['werase']
      @_rl_tty_chars.t_lnext = h['lnext']
      @_rl_tty_chars.t_status = -1
      @otio = `stty -g`
   end
   def _rl_bind_tty_special_chars(kmap)
      kmap[@_rl_tty_chars.t_erase] = :rl_rubout
      kmap[@_rl_tty_chars.t_kill] = :rl_unix_line_discard
      kmap[@_rl_tty_chars.t_werase] = :rl_unix_word_rubout
      kmap[@_rl_tty_chars.t_lnext] = :rl_quoted_insert
   end
   def prepare_terminal_settings(meta_flag)
      @readline_echoing_p = (`stty -a`.scan(/-*echo\b/).first == 'echo')
      setting = " -echo -icrnl cbreak"
      if (`stty -a`.scan(/-parenb\b/).first == '-parenb')
         setting << " pass8"
      end
      setting << " -ixoff"
      rl_bind_key(@_rl_tty_chars.t_start, :rl_restart_output)
      @_rl_eof_char = @_rl_tty_chars.t_eof
      `stty #{setting}`
   end
   def _rl_control_keypad(on)
      if on && @_rl_term_ks
         @_rl_out_stream.write(@_rl_term_ks)
      elsif !on && @_rl_term_ke
         @_rl_out_stream.write(@_rl_term_ke)
      end
   end
   def rl_tty_unset_default_bindings(kmap)
      return if (!rl_isstate(RL_STATE_TTYCSAVED))
      kmap[@_rl_tty_chars.t_erase] = :rl_insert
      kmap[@_rl_tty_chars.t_kill] = :rl_insert
      kmap[@_rl_tty_chars.t_lnext] = :rl_insert
      kmap[@_rl_tty_chars.t_werase] = :rl_insert
   end
   def rl_prep_terminal(meta_flag)
      if no_terminal?
         @readline_echoing_p = true
         return
      end
      return if (@terminal_prepped)
      block_sigint()
      if (@_rl_bind_stty_chars)
         if (@rl_editing_mode == @vi_mode)
            rl_tty_unset_default_bindings(@vi_insertion_keymap)
         else
            rl_tty_unset_default_bindings(@_rl_keymap)
         end
      end
      save_tty_chars()
      rl_setstate(RL_STATE_TTYCSAVED)
      if (@_rl_bind_stty_chars)
         if (@rl_editing_mode == @vi_mode)
            _rl_bind_tty_special_chars(@vi_insertion_keymap)
         else
            _rl_bind_tty_special_chars(@_rl_keymap)
         end
      end
      prepare_terminal_settings(meta_flag)
      if (@_rl_enable_keypad)
         _rl_control_keypad(true)
      end
      @rl_outstream.flush
      @terminal_prepped = true
      rl_setstate(RL_STATE_TERMPREPPED)
      release_sigint()
   end
   def rl_deprep_terminal()
      return if ENV["TERM"].nil?
      return if (!@terminal_prepped)
      block_sigint()
      if (@_rl_enable_keypad)
         _rl_control_keypad(false)
      end
      @rl_outstream.flush
      `stty #{@otio}`
      @terminal_prepped = false
      rl_unsetstate(RL_STATE_TERMPREPPED)
      release_sigint()
   end
   def _rl_set_mark_at_pos(position)
      return -1 if (position > @rl_end)
      @rl_mark = position
      0
   end
   def rl_set_mark(count, key)
      _rl_set_mark_at_pos(@rl_explicit_arg ? count : @rl_point)
   end
   def rl_kill_line (direction, ignore)
      if (direction < 0)
         return (rl_backward_kill_line(1, ignore))
      else
         orig_point = @rl_point
         rl_end_of_line(1, ignore)
         if (orig_point != @rl_point)
            rl_kill_text(orig_point, @rl_point)
         end
         @rl_point = orig_point
         if (@rl_editing_mode == @emacs_mode)
            @rl_mark = @rl_point
         end
      end
      0
   end
   def rl_backward_kill_line(direction, ignore)
      if (direction < 0)
         return (rl_kill_line(1, ignore))
      else
         if (@rl_point==0)
            rl_ding()
         else
            orig_point = @rl_point
            rl_beg_of_line(1, ignore)
            if (@rl_point != orig_point)
               rl_kill_text(orig_point, @rl_point)
            end
            if (@rl_editing_mode == @emacs_mode)
               @rl_mark = @rl_point
            end
         end
      end
      0
   end
   def rl_kill_full_line(count, ignore)
      rl_begin_undo_group()
      @rl_point = 0
      rl_kill_text(@rl_point, @rl_end)
      @rl_mark = 0
      rl_end_undo_group()
      0
   end
   def rl_reverse_search_history(sign, key)
      rl_search_history(-sign, key)
   end
   def rl_forward_search_history(sign, key)
      rl_search_history(sign, key)
   end
   def rl_search_history(direction, invoking_key)
      rl_setstate(RL_STATE_ISEARCH)
      cxt = _rl_isearch_init(direction)
      rl_display_search(cxt.search_string, (cxt.sflags & SF_REVERSE)!=0, -1)
      if (rl_isstate(RL_STATE_CALLBACK))
         return (0)
      end
      r = -1
      while(true)
         c = _rl_search_getchar(cxt)
         r = _rl_isearch_dispatch(cxt, cxt.lastc)
         break if (r <= 0)
      end
      _rl_isearch_cleanup(cxt, r)
   end
   def _rl_scxt_alloc(type, flags)
      cxt = Struct.new(:type,:sflags,:search_string,:search_string_index,:search_string_size,:lines,:allocated_line,
      :hlen,:hindex,:save_point,:save_mark,:save_line,:last_found_line,:prev_line_found,:save_undo_list,:history_pos,
      :direction,:lastc,:sline,:sline_len,:sline_index,:search_terminators,:mb).new
      cxt.type = type
      cxt.sflags = flags
      cxt.search_string = nil
      cxt.search_string_size = cxt.search_string_index = 0
      cxt.lines = nil
      cxt.allocated_line = nil
      cxt.hlen = cxt.hindex = 0
      cxt.save_point = @rl_point
      cxt.save_mark = @rl_mark
      cxt.save_line = where_history()
      cxt.last_found_line = cxt.save_line
      cxt.prev_line_found = nil
      cxt.save_undo_list = nil
      cxt.history_pos = 0
      cxt.direction = 0
      cxt.lastc = 0
      cxt.sline = nil
      cxt.sline_len = cxt.sline_index = 0
      cxt.search_terminators = nil
      cxt
   end
   def history_list()
      @the_history
   end
   def _rl_isearch_init(direction)
      cxt = _rl_scxt_alloc(RL_SEARCH_ISEARCH, 0)
      if (direction < 0)
         cxt.sflags |= SF_REVERSE
      end
      cxt.search_terminators = @_rl_isearch_terminators ? @_rl_isearch_terminators :
      @default_isearch_terminators
      hlist = history_list()
      rl_maybe_replace_line()
      i = 0
      if (hlist)
         i += 1 while(hlist[i])
      end
      cxt.hlen = i
      cxt.lines = []
      for i in 0 ... cxt.hlen
         cxt.lines[i] = hlist[i].line
      end
      if (@_rl_saved_line_for_history)
         cxt.lines[i] = @_rl_saved_line_for_history.line.dup
      else
         cxt.allocated_line = @rl_line_buffer.dup
         cxt.lines << cxt.allocated_line
      end
      cxt.hlen+=1
      cxt.history_pos = cxt.save_line
      rl_save_prompt()
      cxt.search_string_size = 128
      cxt.search_string_index = 0
      cxt.search_string = ""
      cxt.direction = (direction >= 0) ? 1 : -1
      cxt.sline = @rl_line_buffer
      cxt.sline_len = cxt.sline.delete(0.chr).length
      cxt.sline_index = @rl_point
      @_rl_iscxt = cxt
      cxt
   end
   def rl_save_prompt()
      @saved_local_prompt = @local_prompt
      @saved_local_prefix = @local_prompt_prefix
      @saved_prefix_length = @prompt_prefix_length
      @saved_local_length = @local_prompt_len
      @saved_last_invisible = @prompt_last_invisible
      @saved_visible_length = @prompt_visible_length
      @saved_invis_chars_first_line = @prompt_invis_chars_first_line
      @saved_physical_chars = @prompt_physical_chars
      @local_prompt = @local_prompt_prefix = nil
      @local_prompt_len = 0
      @prompt_last_invisible = @prompt_visible_length = @prompt_prefix_length = 0
      @prompt_invis_chars_first_line = @prompt_physical_chars = 0
   end
   def rl_restore_prompt()
      @local_prompt = nil
      @local_prompt_prefix = nil
      @local_prompt = @saved_local_prompt
      @local_prompt_prefix = @saved_local_prefix
      @local_prompt_len = @saved_local_length
      @prompt_prefix_length = @saved_prefix_length
      @prompt_last_invisible = @saved_last_invisible
      @prompt_visible_length = @saved_visible_length
      @prompt_invis_chars_first_line = @saved_invis_chars_first_line
      @prompt_physical_chars = @saved_physical_chars
      @saved_local_prompt = @saved_local_prefix = nil
      @saved_local_length = 0
      @saved_last_invisible = @saved_visible_length = @saved_prefix_length = 0
      @saved_invis_chars_first_line = @saved_physical_chars = 0
   end
   def rl_message(msg_buf)
      @rl_display_prompt = msg_buf
      if @saved_local_prompt.nil?
         rl_save_prompt()
         @msg_saved_prompt = true
      end
      @local_prompt,@prompt_visible_length,@prompt_last_invisible,@prompt_invis_chars_first_line,@prompt_physical_chars =
      expand_prompt(msg_buf)
      @local_prompt_prefix = nil
      @local_prompt_len = @local_prompt ? @local_prompt.length : 0
      send(@rl_redisplay_function)
      0
   end
   def rl_display_search(search_string, reverse_p, where)
      message = '('
      if (reverse_p)
         message << "reverse-"
      end
      message << "i-search)`"
      if (search_string)
         message << search_string
      end
      message << "': "
      rl_message(message)
      message = nil
      send(@rl_redisplay_function)
   end
   def rl_transpose_chars(count, key)
      return 0 if (count == 0)
      if (@rl_point==0 || @rl_end < 2)
         rl_ding()
         return -1
      end
      rl_begin_undo_group()
      if (@rl_point == @rl_end)
         if !@rl_byte_oriented
            @rl_point = _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_NONZERO)
         else
            @rl_point -= 1
         end
         count = 1
      end
      prev_point = @rl_point
      if !@rl_byte_oriented
         @rl_point = _rl_find_prev_mbchar(@rl_line_buffer, @rl_point, MB_FIND_NONZERO)
      else
         @rl_point -= 1
      end
      char_length = prev_point - @rl_point
      dummy = @rl_line_buffer[@rl_point,char_length]
      rl_delete_text(@rl_point, @rl_point + char_length)
      @rl_point += count
      _rl_fix_point(0)
      rl_insert_text(dummy)
      rl_end_undo_group()
      dummy = nil
      0
   end
   def rl_unix_line_discard(count, key)
      if (@rl_point == 0)
         rl_ding()
      else
         rl_kill_text(@rl_point, 0)
         @rl_point = 0
         if (@rl_editing_mode == @emacs_mode)
            @rl_mark = @rl_point
         end
      end
      0
   end
   def rl_yank(count, ignore)
      if @rl_kill_ring.nil?
         _rl_abort_internal()
         return -1
      end
      _rl_set_mark_at_pos(@rl_point)
      rl_insert_text(@rl_kill_ring[@rl_kill_index])
      0
   end
   def rl_yank_pop(count, key)
      if (((@rl_last_func != :rl_yank_pop) && (@rl_last_func != :rl_yank)) ||
         @rl_kill_ring.nil?)
         _rl_abort_internal()
         return -1
      end
      l = @rl_kill_ring[@rl_kill_index].length
      n = @rl_point - l
      if (n >= 0 && @rl_line_buffer[n,l] == @rl_kill_ring[@rl_kill_index][0,l])
         rl_delete_text(n, @rl_point)
         @rl_point = n
         @rl_kill_index-=1
         if (@rl_kill_index < 0)
            @rl_kill_index = @rl_kill_ring_length - 1
         end
         rl_yank(1, 0)
         return 0
      else
         _rl_abort_internal()
         return -1
      end
   end
   def rl_yank_nth_arg_internal(count, ignore, history_skip)
      pos = where_history()
      if (history_skip>0)
         history_skip.times { entry = previous_history() }
      end
      entry = previous_history()
      history_set_pos(pos)
      if entry.nil?
         rl_ding()
         return -1
      end
      arg = history_arg_extract(count, count, entry.line)
      if (arg.nil? || arg=='')
         rl_ding()
         arg = nil
         return -1
      end
      rl_begin_undo_group()
      _rl_set_mark_at_pos(@rl_point)
      if (@rl_editing_mode == @vi_mode)
         rl_vi_append_mode(1, ignore)
         rl_insert_text(" ")
      end
      rl_insert_text(arg)
      arg = nil
      rl_end_undo_group()
      return 0
   end
   def rl_yank_nth_arg(count, ignore)
      rl_yank_nth_arg_internal(count, ignore, 0)
   end
   @history_skip = 0
   @explicit_arg_p = false
   @count_passed = 1
   @direction = 1
   @undo_needed = false
   def rl_yank_last_arg(count, key)
      if (@rl_last_func != :rl_yank_last_arg)
         @history_skip = 0
         @explicit_arg_p = @rl_explicit_arg
         @count_passed = count
         @direction = 1
      else
         if (@undo_needed)
            rl_do_undo()
         end
         if (count < 1)
            @direction = -@direction
         end
         @history_skip += @direction
         if (@history_skip < 0)
            @history_skip = 0
         end
      end
      if (@explicit_arg_p)
         retval = rl_yank_nth_arg_internal(@count_passed, key, @history_skip)
      else
         retval = rl_yank_nth_arg_internal('$', key, @history_skip)
      end
      @undo_needed = retval == 0
      retval
   end
   def _rl_char_search_internal(count, dir, smbchar, len)
      pos = @rl_point
      inc = (dir < 0) ? -1 : 1
      while (count!=0)
         if ((dir < 0 && pos <= 0) || (dir > 0 && pos >= @rl_end))
            rl_ding()
            return -1
         end
         pos = (inc > 0) ? _rl_find_next_mbchar(@rl_line_buffer, pos, 1, MB_FIND_ANY) :
         _rl_find_prev_mbchar(@rl_line_buffer, pos, MB_FIND_ANY)
         begin
            if (_rl_is_mbchar_matched(@rl_line_buffer, pos, @rl_end, smbchar, len)!=0)
               count-=1
               if (dir < 0)
                  @rl_point = (dir == BTO) ? pos+1 : pos
               else
                  @rl_point = (dir == FTO) ? pos-1 : pos
               end
               break
            end
            prepos = pos
         end while ((dir < 0) ? (pos = _rl_find_prev_mbchar(@rl_line_buffer, pos, MB_FIND_ANY)) != prepos :
         (pos = _rl_find_next_mbchar(@rl_line_buffer, pos, 1, MB_FIND_ANY)) != prepos)
      end
      0
   end
   def _rl_char_search(count, fdir, bdir)
      mbchar = ''
      mb_len = _rl_read_mbchar(mbchar, MB_LEN_MAX)
      if (count < 0)
         return (_rl_char_search_internal(-count, bdir, mbchar, mb_len))
      else
         return (_rl_char_search_internal(count, fdir, mbchar, mb_len))
      end
   end
   def rl_char_search(count, key)
      _rl_char_search(count, FFIND, BFIND)
   end
   def trans(i)
      ((i) == -1 ? @rl_point : ((i) == -2 ? @rl_end : (i)))
   end
   def rl_do_undo()
      start = _end = waiting_for_begin = 0
      begin
         return 0 if @rl_undo_list.nil?
         @_rl_doing_an_undo = true
         rl_setstate(RL_STATE_UNDOING)
         if (@rl_undo_list.what == UNDO_DELETE || @rl_undo_list.what == UNDO_INSERT)
            start = trans(@rl_undo_list.start)
            _end = trans(@rl_undo_list.end)
         end
         case (@rl_undo_list.what)
         when UNDO_DELETE
            @rl_point = start
            rl_insert_text(@rl_undo_list.text)
            @rl_undo_list.text = nil
         when UNDO_INSERT
            rl_delete_text(start, _end)
            @rl_point = start
         when UNDO_END
            waiting_for_begin+=1
         when UNDO_BEGIN
            if (waiting_for_begin!=0)
               waiting_for_begin-=1
            else
               rl_ding()
            end
         end
         @_rl_doing_an_undo = false
         rl_unsetstate(RL_STATE_UNDOING)
         release = @rl_undo_list
         @rl_undo_list = @rl_undo_list.next
         replace_history_data(-1, release, @rl_undo_list)
         release = nil
      end while (waiting_for_begin!=0)
      1
   end
   def rl_undo_command(count, key)
      if (count < 0)
         return 0
      end
      while (count>0)
         if (rl_do_undo())
            count-=1
         else
            rl_ding()
            break
         end
      end
      0
   end
   def rl_kill_word(count, key)
      if (count < 0)
         return (rl_backward_kill_word(-count, key))
      else
         orig_point = @rl_point
         rl_forward_word(count, key)
         if (@rl_point != orig_point)
            rl_kill_text(orig_point, @rl_point)
         end
         @rl_point = orig_point
         if (@rl_editing_mode == @emacs_mode)
            rl_mark = @rl_point
         end
      end
      0
   end
   def rl_backward_kill_word(count, ignore)
      if (count < 0)
         return (rl_kill_word(-count, ignore))
      else
         orig_point = @rl_point
         rl_backward_word(count, ignore)
         if (@rl_point != orig_point)
            rl_kill_text(orig_point, @rl_point)
         end
         if (@rl_editing_mode == @emacs_mode)
            @rl_mark = @rl_point
         end
      end
      0
   end
   def rl_revert_line(count, key)
      if @rl_undo_list.nil?
         rl_ding()
      else
         while (@rl_undo_list)
            rl_do_undo()
         end
         if (@rl_editing_mode == @vi_mode)
            @rl_point = @rl_mark = 0
         end
      end
      0
   end
   def rl_backward_char_search (count, key)
      _rl_char_search(count, BFIND, FFIND)
   end
   def rl_insert_completions(ignore, invoking_key)
      rl_complete_internal('*')
   end
   def _rl_arg_init()
      rl_save_prompt()
      @_rl_argcxt = 0
      rl_setstate(RL_STATE_NUMERICARG)
   end
   def _rl_arg_getchar()
      rl_message("(arg: #{@rl_arg_sign * @rl_numeric_arg}) ")
      rl_setstate(RL_STATE_MOREINPUT)
      c = rl_read_key()
      rl_unsetstate(RL_STATE_MOREINPUT)
      c
   end
   def _rl_arg_dispatch(cxt, c)
      key = c
      if (@_rl_keymap[c] == :rl_universal_argument)
         if ((cxt & NUM_SAWDIGITS) == 0)
            @rl_numeric_arg *= 4
            return 1
         elsif (rl_isstate(RL_STATE_CALLBACK))
            @_rl_argcxt |= NUM_READONE
            return 0
         else
            rl_setstate(RL_STATE_MOREINPUT)
            key = rl_read_key()
            rl_unsetstate(RL_STATE_MOREINPUT)
            rl_restore_prompt()
            rl_clear_message()
            rl_unsetstate(RL_STATE_NUMERICARG)
            return (_rl_dispatch(key, @_rl_keymap))
         end
      end
      r = c[1,1]
      if (r>='0' && r<='9')
         r = r.to_i
         @rl_numeric_arg = @rl_explicit_arg ? (@rl_numeric_arg * 10) +  r : r
         @rl_explicit_arg = 1
         @_rl_argcxt |= NUM_SAWDIGITS
      elsif (c == '-' && !@rl_explicit_arg)
         @rl_numeric_arg = 1
         @_rl_argcxt |= NUM_SAWMINUS
         @rl_arg_sign = -1
      else
         if ((@_rl_argcxt & NUM_SAWMINUS)!=0 && @rl_numeric_arg == 1 && !@rl_explicit_arg)
            @rl_explicit_arg = 1
         end
         rl_restore_prompt()
         rl_clear_message()
         rl_unsetstate(RL_STATE_NUMERICARG)
         r = _rl_dispatch(key, @_rl_keymap)
         if (rl_isstate(RL_STATE_CALLBACK))
            if (!@rl_done)
               send(@rl_redisplay_function)
            end
            r = 0
         end
         return r
      end
      1
   end
   def _rl_arg_overflow()
      if (@rl_numeric_arg > 1000000)
         @_rl_argcxt = 0
         @rl_explicit_arg = @rl_numeric_arg = 0
         rl_ding()
         rl_restore_prompt()
         rl_clear_message()
         rl_unsetstate(RL_STATE_NUMERICARG)
         return 1
      end
      0
   end
   def rl_digit_loop()
      while (true)
         return 1 if _rl_arg_overflow()!=0
         c = _rl_arg_getchar()
         if (c >= "\xFE")
            _rl_abort_internal()
            return -1
         end
         r = _rl_arg_dispatch(@_rl_argcxt, c)
         break if (r <= 0 || !rl_isstate(RL_STATE_NUMERICARG))
      end
      return r
   end
   def rl_digit_argument(ignore, key)
      _rl_arg_init()
      if (rl_isstate(RL_STATE_CALLBACK))
         _rl_arg_dispatch(@_rl_argcxt, key)
         rl_message("(arg: #{@rl_arg_sign * @rl_numeric_arg}) ")
         return 0
      else
         rl_execute_next(key)
         return (rl_digit_loop())
      end
   end
   def rl_execute_next(c)
      @rl_pending_input = c
      rl_setstate(RL_STATE_INPUTPENDING)
      0
   end
   def rl_beginning_of_history(count, key)
      rl_get_previous_history(1 + where_history(), key)
   end
   def rl_end_of_history(count, key)
      rl_maybe_replace_line()
      using_history()
      rl_maybe_unsave_line()
      0
   end
   def rl_upcase_word(count, key)
      rl_change_case(count, UpCase)
   end
   def rl_downcase_word(count, key)
      rl_change_case(count, DownCase)
   end
   def rl_capitalize_word(count, key)
      rl_change_case(count, CapCase)
   end
   def rl_modifying(start, _end)
      if (start > _end)
         start,_end = _end,start
      end
      if (start != _end)
         temp = rl_copy_text(start, _end)
         rl_begin_undo_group()
         rl_add_undo(UNDO_DELETE, start, _end, temp)
         rl_add_undo(UNDO_INSERT, start, _end, nil)
         rl_end_undo_group()
      end
      0
   end
   def rl_change_case(count, op)
      start = @rl_point
      rl_forward_word(count, 0)
      _end = @rl_point
      if (op != UpCase && op != DownCase && op != CapCase)
         rl_ding()
         return -1
      end
      if (count < 0)
         start,_end = _end,start
      end
      rl_modifying(start, _end)
      inword = false
      while (start < _end)
         c = _rl_char_value(@rl_line_buffer, start)
         if !@rl_byte_oriented
            _next = _rl_find_next_mbchar(@rl_line_buffer, start, 1, MB_FIND_NONZERO)
         else
            _next = start + 1
         end
         if (!_rl_walphabetic(c))
            inword = false
            start = _next
            next
         end
         if (op == CapCase)
            nop = inword ? DownCase : UpCase
            inword = true
         else
            nop = op
         end
         if (isascii(c))
            nc = (nop == UpCase) ? c.upcase : c.downcase
            @rl_line_buffer[start] = nc
         end
         start = _next
      end
      @rl_point = _end
      0
   end
   def isascii(c)
    int_val = c[0].to_i
    return (int_val < 128 && int_val > 0)
   end
   def noninc_search(dir, pchar)
      cxt = _rl_nsearch_init(dir, pchar)
      if (rl_isstate(RL_STATE_CALLBACK))
         return (0)
      end
      r = 0
      while (true)
         c = _rl_search_getchar(cxt)
         if (c == 0.chr)
            break
         end
         r = _rl_nsearch_dispatch(cxt, c)
         if (r < 0)
            return 1
         elsif (r == 0)
            break
         end
      end
      r = _rl_nsearch_dosearch(cxt)
      (r >= 0) ? _rl_nsearch_cleanup(cxt, r) : (r != 1)
   end
   def rl_noninc_forward_search(count, key)
      noninc_search(1, (key == '?') ? '?' : nil)
   end
   def rl_noninc_reverse_search(count, key)
      noninc_search(-1, (key == '/') ? '/' : nil)
   end
   def make_history_line_current(entry)
      _rl_replace_text(entry.line, 0, @rl_end)
      _rl_fix_point(1)
      if (@rl_editing_mode == @vi_mode)
         rl_free_undo_list()
      end
      if (@_rl_saved_line_for_history)
         @_rl_saved_line_for_history = nil
      end
   end
   def history_set_pos(pos)
      if (pos > @history_length || pos < 0 || @the_history.nil?)
         return (0)
      end
      @history_offset = pos
      1
   end
   def history_search_prefix (string, direction)
      history_search_internal(string, direction, ANCHORED_SEARCH)
   end
   def history_search_pos(string, dir, pos)
      old = where_history()
      history_set_pos(pos)
      if (history_search(string, dir) == -1)
         history_set_pos(old)
         return (-1)
      end
      ret = where_history()
      history_set_pos(old)
      ret
   end
   def noninc_search_from_pos(string, pos, dir)
      return 1 if (pos < 0)
      old = where_history()
      return -1 if (history_set_pos(pos) == 0)
      rl_setstate(RL_STATE_SEARCH)
      if (string[0,1] == '^')
         ret = history_search_prefix(string + 1, dir)
      else
         ret = history_search(string, dir)
      end
      rl_unsetstate(RL_STATE_SEARCH)
      if (ret != -1)
         ret = where_history()
      end
      history_set_pos(old)
      ret
   end
   def noninc_dosearch(string, dir)
      if (string.nil? || string == '' || @noninc_history_pos < 0)
         rl_ding()
         return 0
      end
      pos = noninc_search_from_pos(string, @noninc_history_pos + dir, dir)
      if (pos == -1)
         rl_maybe_unsave_line()
         rl_clear_message()
         @rl_point = 0
         rl_ding()
         return 0
      end
      @noninc_history_pos = pos
      oldpos = where_history()
      history_set_pos(@noninc_history_pos)
      entry = current_history()
      if (@rl_editing_mode != @vi_mode)
         history_set_pos(oldpos)
      end
      make_history_line_current(entry)
      @rl_point = 0
      @rl_mark = @rl_end
      rl_clear_message()
      1
   end
   def _rl_make_prompt_for_search(pchar)
      rl_save_prompt()
      _p = @rl_prompt ? @rl_prompt.rindex("\n") : nil
      if _p.nil?
         len = (@rl_prompt && @rl_prompt.length>0 ) ? @rl_prompt.length : 0
         if (len>0)
            pmt = @rl_prompt.dup
         else
            pmt = ''
         end
         pmt << pchar
      else
         _p+=1
         pmt = @rl_prompt[_p..-1]
         pmt << pchar
      end
      @prompt_physical_chars = @saved_physical_chars + 1
      pmt
   end
   def _rl_nsearch_init(dir, pchar)
      cxt = _rl_scxt_alloc(RL_SEARCH_NSEARCH, 0)
      if (dir < 0)
         cxt.sflags |= SF_REVERSE
      end
      cxt.direction = dir
      cxt.history_pos = cxt.save_line
      rl_maybe_save_line()
      @rl_undo_list = nil
      @rl_line_buffer[0,1] = 0.chr
      @rl_end = @rl_point = 0
      _p = _rl_make_prompt_for_search(pchar ? pchar : ':')
      rl_message(_p)
      _p = nil
      rl_setstate(RL_STATE_NSEARCH)
      @_rl_nscxt = cxt
      cxt
   end
   def _rl_nsearch_cleanup(cxt, r)
      cxt = nil
      @_rl_nscxt = nil
      rl_unsetstate(RL_STATE_NSEARCH)
      r != 1
   end
   def _rl_nsearch_abort(cxt)
      rl_maybe_unsave_line()
      rl_clear_message()
      @rl_point = cxt.save_point
      @rl_mark = cxt.save_mark
      rl_restore_prompt()
      rl_unsetstate(RL_STATE_NSEARCH)
   end
   def _rl_nsearch_dispatch(cxt, c)
      case (c)
      when "\C-W"
         rl_unix_word_rubout(1, c)
      when "\C-W"
         rl_unix_line_discard(1, c)
      when RETURN,NEWLINE
         return 0
      when "\C-H",RUBOUT
         if (@rl_point == 0)
            _rl_nsearch_abort(cxt)
            return -1
         end
         _rl_rubout_char(1, c)
      when "\C-C","\C-G"
         rl_ding()
         _rl_nsearch_abort(cxt)
         return -1
      else
         if !@rl_byte_oriented
            rl_insert_text(cxt.mb)
         else
            _rl_insert_char(1, c)
         end
      end
      send(@rl_redisplay_function)
      1
   end
   def _rl_nsearch_dosearch(cxt)
      @rl_mark = cxt.save_mark
      if (@rl_point == 0)
         if @noninc_search_string.nil?
            rl_ding()
            rl_restore_prompt()
            rl_unsetstate(RL_STATE_NSEARCH)
            return -1
         end
      else
         @noninc_history_pos = cxt.save_line
         @noninc_search_string = @rl_line_buffer.dup
         rl_free_undo_list()
      end
      rl_restore_prompt()
      noninc_dosearch(@noninc_search_string, cxt.direction)
   end
   def rl_transpose_words(count, key)
      orig_point = @rl_point
      return if (count==0)
      rl_forward_word(count, key)
      w2_end = @rl_point
      rl_backward_word(1, key)
      w2_beg = @rl_point
      rl_backward_word(count, key)
      w1_beg = @rl_point
      rl_forward_word(1, key)
      w1_end = @rl_point
      if ((w1_beg == w2_beg) || (w2_beg < w1_end))
         rl_ding()
         @rl_point = orig_point
         return -1
      end
      word1 = rl_copy_text(w1_beg, w1_end)
      word2 = rl_copy_text(w2_beg, w2_end)
      rl_begin_undo_group()
      @rl_point = w2_beg
      rl_delete_text(w2_beg, w2_end)
      rl_insert_text(word1)
      @rl_point = w1_beg
      rl_delete_text(w1_beg, w1_end)
      rl_insert_text(word2)
      @rl_point = w2_end
      rl_end_undo_group()
      word1 = nil
      word2 = nil
      0
   end
   def rl_re_read_init_file(count, ignore)
      r = rl_read_init_file(nil)
      rl_set_keymap_from_edit_mode()
      r
   end
   def rl_exchange_point_and_mark(count, key)
      if (@rl_mark > @rl_end)
         @rl_mark = -1
      end
      if (@rl_mark == -1)
         rl_ding()
         return -1
      else
         @rl_point, @rl_mark = @rl_mark, @rl_point
      end
      0
   end
   def rl_display_match_list(matches, len, max)
      max += 2
      limit = @_rl_screenwidth / max
      if (limit != 1 && (limit * max == @_rl_screenwidth))
         limit-=1
      end
      if (limit == 0)
         limit = 1
      end
      count = (len + (limit - 1)) / limit
      if (!@rl_ignore_completion_duplicates)
         matches[1,len] = matches[1,len].sort
      end
      rl_crlf()
      lines = 0
      if (!@_rl_print_completions_horizontally)
         for i in 1 .. count
            l = i
            for j in 0 ... limit
               if (l > len || matches[l].nil?)
                  break
               else
                  temp = printable_part(matches[l])
                  printed_len = print_filename(temp, matches[l])
                  if (j + 1 < limit)
                     @rl_outstream.write(' '*(max - printed_len))
                  end
               end
               l += count
            end
            rl_crlf()
            lines+=1
            if (@_rl_page_completions && lines >= (@_rl_screenheight - 1) && i < count)
               lines = _rl_internal_pager(lines)
               return if (lines < 0)
            end
         end
      else
         i = 1
         while(matches[i])
            temp = printable_part(matches[i])
            printed_len = print_filename(temp, matches[i])
            if (matches[i+1])
               if ((limit > 1) && (i % limit) == 0)
                  rl_crlf()
                  lines+=1
                  if (@_rl_page_completions && lines >= @_rl_screenheight - 1)
                     lines = _rl_internal_pager(lines)
                     return if (lines < 0)
                  end
               else
                  @rl_outstream.write(' '*(max - printed_len))
               end
            end
            i += 1
         end
         rl_crlf()
      end
   end
   def append_to_match(text, delimiter, quote_char, nontrivial_match)
      temp_string = 0.chr * 4
      temp_string_index = 0
      if (quote_char && @rl_point>0 && !@rl_completion_suppress_quote &&
         @rl_line_buffer[@rl_point - 1,1] != quote_char)
         temp_string[temp_string_index] = quote_char
         temp_string_index += 1
      end
      if (delimiter != 0.chr)
         temp_string[temp_string_index] = delimiter
         temp_string_index += 1
      elsif (!@rl_completion_suppress_append && @rl_completion_append_character)
         temp_string[temp_string_index] = @rl_completion_append_character
         temp_string_index += 1
      end
      temp_string[temp_string_index] = 0.chr
      temp_string_index += 1
      if (@rl_filename_completion_desired)
         filename = File.expand_path(text)
         s = (nontrivial_match && !@rl_completion_mark_symlink_dirs) ?
         File.lstat(filename) : File.stat(filename)
         if s.directory?
            if @_rl_complete_mark_directories
               if (@rl_point>0 && @rl_line_buffer[@rl_point,1] == 0.chr && @rl_line_buffer[@rl_point - 1,1] == '/' )
               elsif (@rl_line_buffer[@rl_point,1] != '/')
                  rl_insert_text('/')
               end
            end
         elsif s.symlink? && File.stat(filename).directory?
         else
            if (@rl_point == @rl_end && temp_string_index>0)
               rl_insert_text(temp_string)
            end
         end
         filename = nil
      else
         if (@rl_point == @rl_end && temp_string_index>0)
            rl_insert_text(temp_string)
         end
      end
      temp_string_index
   end
   def stifle_history(max)
      max = 0 if (max < 0)
      if (@history_length > max)
         @the_history.slice!(0,(@history_length - max))
         @history_length = max
      end
      @history_stifled = true
      @max_input_history = @history_max_entries = max
   end
   def unstifle_history()
      if (@history_stifled)
         @history_stifled = false
         return (@history_max_entries)
      else
         return (-@history_max_entries)
      end
   end
   def history_is_stifled()
      return (@history_stifled)
   end
   def clear_history()
      @the_history = nil
      @history_offset = @history_length = 0
   end
   def insert_some_chars(string, count, col)
      if @hConsoleHandle
         _rl_output_some_chars(string,0,count)
      else
         if (@rl_byte_oriented)
            if (count != col)
               $stderr.write("readline: debug: insert_some_chars: count (#{count}) != col (#{col})\n");
            end
         end
         if (@_rl_term_im)
            @_rl_out_stream.write(@_rl_term_im)
         end
         if (@_rl_term_ic)
            @_rl_out_stream.write(@_rl_term_ic * count)
         end
         _rl_output_some_chars(string,0, count)
         if (@_rl_term_ei)
            @_rl_out_stream.write(@_rl_term_ei)
         end
      end
   end
   def delete_chars(count)
      return if (count > @_rl_screenwidth)
      if @hConsoleHandle.nil?
         if (@_rl_term_dc)
            @_rl_out_stream.write(@_rl_term_dc * count)
         end
      end
   end
   def _rl_adjust_point(string, point)
      length = string.length
      return -1 if (point < 0)
      return -1 if (length < point)
      pos = 0
      case @encoding
      when 'E'
         pos = string.scan(/./me).inject(0){|r,x| r<point ? r += x.length : r }
      when 'S'
         pos = string.scan(/./ms).inject(0){|r,x| r<point ? r += x.length : r }
      when 'U'
         pos = string.scan(/./mu).inject(0){|r,x| r<point ? r += x.length : r }
      when 'X'
         pos = string.dup.force_encoding(@encoding_name).chars.inject(0){|r,x| r<point ? r += x.bytesize : r }
      else
         pos = point
      end
      pos - point
   end
   def _rl_find_next_mbchar(string, seed, count, flags)
      if @encoding == 'N'
         return (seed + count)
      end
      seed = 0 if seed < 0
      return seed if count <= 0
      point = seed + _rl_adjust_point(string,seed)
      if (seed < point)
         count -= 1
      end
      str = (flags == MB_FIND_NONZERO) ? string.sub(/\x00+$/,'') : string
      case @encoding
      when 'E'
         point += str[point..-1].scan(/./me)[0,count].to_s.length
      when 'S'
         point += str[point..-1].scan(/./ms)[0,count].to_s.length
      when 'U'
         point += str[point..-1].scan(/./mu)[0,count].to_s.length
      when 'X'
         point += str[point..-1].force_encoding(@encoding_name)[0,count].bytesize
      else
         point += count
         point = str.length if point >= str.length
      end
      point
   end
   def _rl_find_prev_mbchar(string, seed, flags)
      if @encoding == 'N'
         return ((seed == 0) ? seed : seed - 1)
      end
      length = string.length
      if seed < 0
         return 0
      elsif length < seed
         return length
      end
      case @encoding
      when 'E'
         string[0,seed].scan(/./me)[0..-2].to_s.length
      when 'S'
         string[0,seed].scan(/./ms)[0..-2].to_s.length
      when 'U'
         string[0,seed].scan(/./mu)[0..-2].to_s.length
      when 'X'
         string[0,seed].force_encoding(@encoding_name)[0..-2].bytesize
      end
   end
   def _rl_compare_chars(buf1, pos1, buf2, pos2)
      return false if buf1[pos1].nil? || buf2[pos2].nil?
      case @encoding
      when 'E'
         buf1[pos1..-1].scan(/./me)[0] == buf2[pos2..-1].scan(/./me)[0]
      when 'S'
         buf1[pos1..-1].scan(/./ms)[0] == buf2[pos2..-1].scan(/./ms)[0]
      when 'U'
         buf1[pos1..-1].scan(/./mu)[0] == buf2[pos2..-1].scan(/./mu)[0]
      when 'X'
         buf1[pos1..-1].force_encoding(@encoding_name)[0] == buf2[pos2..-1].force_encoding(@encoding_name)[0]
      else
         buf1[pos1] == buf2[pos2]
      end
   end
   def _rl_get_char_len(src)
      return 0 if src[0,1] == 0.chr || src.length==0
      case @encoding
      when 'E'
         len = src.scan(/./me)[0].to_s.length
      when 'S'
         len = src.scan(/./ms)[0].to_s.length
      when 'U'
         len = src.scan(/./mu)[0].to_s.length
      when 'X'
         src = src.dup.force_encoding(@encoding_name)
         len = src.valid_encoding? ? src[0].bytesize : 0
      else
         len = 1
      end
      len==0 ? -2 : len
   end
   def _rl_read_mbchar(mbchar, size)
      mb_len = 0
      while (mb_len < size)
         rl_setstate(RL_STATE_MOREINPUT)
         mbchar << rl_read_key()
         mb_len += 1
         rl_unsetstate(RL_STATE_MOREINPUT)
         case @encoding
         when 'E'
            break unless mbchar.scan(/./me).empty?
         when 'S'
            break unless mbchar.scan(/./ms).empty?
         when 'U'
            break unless mbchar.scan(/./mu).empty?
         when 'X'
            break if mbchar.dup.force_encoding(@encoding_name).valid_encoding?
         end
      end
      mb_len
   end
   def _rl_read_mbstring(first, mb, mlen)
      c = first
      for i in 0 ... mlen
         mb << c
         if _rl_get_char_len(mb) == -2
            rl_setstate(RL_STATE_MOREINPUT)
            c = rl_read_key()
            rl_unsetstate(RL_STATE_MOREINPUT)
         else
            break
         end
      end
      c
   end
   def _rl_is_mbchar_matched(string, seed, _end, mbchar, length)
      return 0 if ((_end - seed) < length)
      for i in 0 ... length
         if (string[seed + i] != mbchar[i])
            return 0
         end
      end
      1
   end
   def redraw_prompt(t)
      oldp = @rl_display_prompt
      rl_save_prompt()
      @rl_display_prompt = t
      @local_prompt,@prompt_visible_length,@prompt_last_invisible,@prompt_invis_chars_first_line,@prompt_physical_chars =
      expand_prompt(t)
      @local_prompt_prefix = nil
      @local_prompt_len = @local_prompt ? @local_prompt.length : 0
      rl_forced_update_display()
      @rl_display_prompt = oldp
      rl_restore_prompt()
   end
   def _rl_redisplay_after_sigwinch()
      if @_rl_term_cr
         @rl_outstream.write(@_rl_term_cr)
         @_rl_last_c_pos = 0
         if @_rl_term_clreol
            @rl_outstream.write(@_rl_term_clreol)
         else
            space_to_eol(@_rl_screenwidth)
            @rl_outstream.write(@_rl_term_cr)
         end
         if @_rl_last_v_pos > 0
            _rl_move_vert(0)
         end
      else
         rl_crlf()
      end
      t = @rl_display_prompt.index("\n")
      if t
         redraw_prompt(@rl_display_prompt[(t+1)..-1])
      else
         rl_forced_update_display()
      end
   end
   def rl_resize_terminal()
      if @readline_echoing_p
         _rl_get_screen_size(@rl_instream.fileno, 1)
         if @rl_redisplay_function != :rl_redisplay
            rl_forced_update_display()
         else
            _rl_redisplay_after_sigwinch()
         end
      end
   end
   def rl_sigwinch_handler(sig)
      rl_setstate(RL_STATE_SIGHANDLER)
      rl_resize_terminal()
      rl_unsetstate(RL_STATE_SIGHANDLER)
   end
   module_function :rl_attempted_completion_function,:rl_deprep_term_function,
   :rl_event_hook,:rl_attempted_completion_over,:rl_basic_quote_characters,
   :rl_basic_word_break_characters,:rl_completer_quote_characters,
   :rl_completer_word_break_characters,:rl_completion_append_character,
   :rl_filename_quote_characters,:rl_instream,:rl_library_version,:rl_outstream,
   :rl_readline_name,
   :rl_attempted_completion_function=,:rl_deprep_term_function=,
   :rl_event_hook=,:rl_attempted_completion_over=,:rl_basic_quote_characters=,
   :rl_basic_word_break_characters=,:rl_completer_quote_characters=,
   :rl_completer_word_break_characters=,:rl_completion_append_character=,
   :rl_filename_quote_characters=,:rl_instream=,:rl_library_version=,:rl_outstream=,
   :rl_readline_name=,:history_length,:history_base
  def no_terminal?
    term = ENV["TERM"]
    term.nil? || (term == 'dumb') || (RUBY_PLATFORM =~ /mswin|mingw/)
  end
  private :no_terminal?
end
