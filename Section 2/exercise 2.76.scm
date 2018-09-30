#lang sicp
; In explicit dispatch, we must change condition of all generic operations to add new new types.
; In data-directed style, we only have to change the table with packages for new operations or new types.
; In message-passing style, we have to change dispatch procedure to add new operations.

; Explicit dispatch and data-directed style is appropriate for adding new operations frequently
; because they don't need to change old codes to add new operations.

; Data-directed style and message-passing is appropriate for adding new types frequently
; because they don't need to change old codes to add new types.