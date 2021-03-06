#include "uthash.h"
#include <time.h>
#include <stdlib.h>   /* malloc */
#include <stdio.h>    /* printf */

typedef struct example_user_t {
    int id;
    int cookie;
    UT_hash_handle hh;
} example_user_t;

int main() {
    int i;
    example_user_t *user, *tmp, *users=NULL;

    /* create elements */
    for(i=0;i<10;i++) {
        if ( (user = (example_user_t*)m_malloc(sizeof(example_user_t))) == NULL) exit(-1);
        user->id = i;
        user->cookie = i*i;
        HASH_ADD_INT(users,id,user);
    }

    /* find each even ID */
    for(i=0;i<10;i+=2) {
        HASH_FIND_INT(users,&i,tmp);
        if (tmp) printf("user id %d found, cookie %d\n", tmp->id, tmp->cookie);
        else printf("user id %d not found\n", i);
    }
	
	/* free memory */
	HASH_ITER(hh, users, user, tmp) {
		HASH_DEL(users, user);     /* delete; users advances to next */
		m_free(user);
	}
   
	return 0;
}
