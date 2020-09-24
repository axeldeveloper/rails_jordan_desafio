<template>
  <div id="ap">
    <md-table v-model="search" md-card md-height="100%">
      <md-table-toolbar>
        <h1 class="md-title">BlackList</h1>

        <md-field md-clearable class="md-toolbar-section-end">
          <label>CPF</label>
          <md-input
            v-model="imputCpf"
            placeholder="Informe o CPF 999.999.999-99..."
          ></md-input>
        </md-field>

        <md-button class="md-icon-button" @click="getBlackList()">
          <md-icon v-bind:class="{ 'md-accent': searchEnabled }"
            >search</md-icon
          >
        </md-button>
      </md-table-toolbar>

      <md-table-empty-state
        md-label="No cpf found"
        :md-description="`No cpf found for this '${search}' query. Try a different search term or create a new cpf include to backlist.`"
      >
        <md-button class="md-primary md-raised" @click="NewIncludeList">
          Include to cpf in blacklist click to plus icon in grid
        </md-button>
      </md-table-empty-state>

      <md-table-row
        slot="md-table-row"
        slot-scope="{ item }"
       
        md-selectable="single"
      >
        <md-table-cell md-label="CPF" md-sort-by="cpf" md-numeric>{{
          item.cpf
        }}</md-table-cell>
        <md-table-cell md-label="Situation" md-sort-by="situation">{{
          item.situation
        }}</md-table-cell>

        <md-table-cell md-label="Options">
          <md-button v-if="item.situation == 'FREE'"
            class="md-dense md-primary"
            @click.native="Create(item)">
            <md-icon>add</md-icon>
          </md-button>
          <md-button v-if="item.situation == 'BLOCK'"
            class="md-accent" @click.native="Delete(item)">
            <md-icon>delete</md-icon>
          </md-button>
        </md-table-cell>
      </md-table-row>
    </md-table>

    <md-snackbar :md-active.sync="showSnackbar" :md-persistent="true">
        <span style="width:100%; text-align:center;">
            {{SnackbarLabel}}
        </span>
    </md-snackbar> 

  </div>
</template>

<script>
import Http from "../services/http"; // não precisa de .js
//import {getCpfBlackList as getCPF} from "../services/search";

import {
    getCpfBlackList as getCPF,
    update  as DeleteBlackList,
    include as CreateBlackList,
} from "../services/search";

import { set } from "vue";

export default {
    name: "Search",
    data: () => ({
        message: "Hello Search!",
        imputCpf: null,
        search: [],
        searchEnabled: false,
        showSnackbar : false,
        SnackbarLabel: ""
    }),

    methods: {
        getBlackList() {
            this.search = [];
            let row = getCPF(this.imputCpf);
            row.then(response => this.search.push(response.data) );
        },

        getClass: ({ situation }) => ({
            "md-primary": situation === "FREE",
            "md-default": situation === "BLOCK",
        }),

        Create(item) {
            let { cpf, active } = item;
            active = true;
            CreateBlackList({ cpf, active }).then((response) => {
                this.SnackbarLabel = response.data.msg;
                this.showSnackbar = true;
                this.getBlackList()
            }); 
        },

        Delete(item) {    
            let { id, cpf, active } = item.row;
            active = active == true ? false : true;
            DeleteBlackList({ id, cpf, active }).then((response) => {
                this.SnackbarLabel = response.data.msg;
                this.showSnackbar = true;
                this.getBlackList()
            });  
        },

        NewIncludeList ()  {
            console.log("Novo")
        }
    },

    created() {
        this.searched = this.users;
    },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
