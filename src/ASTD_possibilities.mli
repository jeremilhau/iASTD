(** ASTD possibilities module *)

type t = Possibility of (ASTD_state.t * ASTD_arrow.t) | Mult of t list | Synch of (ASTD_term.t*t) list
;;





(** Constructors *)

val create_possibilities : ASTD_environment.t -> ASTD_event.t -> ASTD_arrow.t list ->  t



(** Accessors *)

val is_mult : t -> bool
val is_synch : t -> bool

val cons_mult : t -> t -> t
val cons_synch : t -> t -> t
val cons : t -> t -> t

val clear_cons : t -> t -> t
val find_m : t -> t -> bool

val get_state_data : t -> ASTD_state.t

val possible : t -> bool 
val never_empty : t -> bool 
val no_possibilities : t -> bool



(** Manipulation Functions *)

val choice_is : 'a list -> int -> 'a

val choose_next : 'a list -> 'a





(** Main Functions *)

val complete_possibilities : ASTD_state.t -> t -> t

val complete_synch_poss : t -> t

val complete_synch_side : bool -> t -> t

val complete_single_possibilities : ASTD_state.t -> t -> t


val possible_evolutions : ASTD_astd.t -> ASTD_state.t -> ASTD_event.t -> ASTD_environment.t -> (t * bool) 


(** Printers *)

val print : t -> ASTD_astd.t -> string -> unit


       
