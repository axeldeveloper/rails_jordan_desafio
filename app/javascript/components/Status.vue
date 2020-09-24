<template>
  <div id="ap">
    <md-card>
      <md-card-header>
        <div class="md-title">{{ message }}</div>
      </md-card-header>

      <md-card-content>
        <div class="viewport">
          <md-toolbar :md-elevation="1">
          <span class="md-title">CPF</span>
          </md-toolbar>
          <md-list class="md-double-line">
              <md-subheader class="md-primary">[Total de cpf] </md-subheader>
              <md-list-item>
                <md-icon>data_usage</md-icon>
                <span class="md-list-item-text">  TOTAL OF CPF:  </span>
                <span class="md-list-item-text">  ({{status.total_cpf}}) </span>    
              </md-list-item>
          </md-list>

          <md-toolbar :md-elevation="1">
          <span class="md-title">COUNT QUERY</span>
          </md-toolbar>
          <md-list>
              <md-subheader class="md-primary">[Total query by cpf]</md-subheader>
              <md-list-item v-for="(value, key) in status.count_query" v-bind:key="key" >
                <md-icon>data_usage</md-icon>
                <span class="md-list-item-text">  CPF: ({{ key }}) </span>  
                <span class="md-list-item-text">  TOTAL:  ({{ value}}) </span>      
              </md-list-item>
          </md-list>

          <md-toolbar :md-elevation="1">
            <span class="md-title">LAST CONSULTATIONS</span>
          </md-toolbar>
          <md-list>
              <md-subheader class="md-primary">[Last consultations of query ]</md-subheader>
              <md-list-item v-for="(value, key) in status.ultimate_query" v-bind:key="key" >
                <md-icon>data_usage</md-icon>
                <span class="md-list-item-text"> CPF: ({{ key }}) </span>        
                <span class="md-list-item-text"> DATE: {{moment(value).format('DD/MM/YYYY')}}</span>    
              </md-list-item>
          </md-list>
        </div>
      </md-card-content>

      <md-card-actions>
        <md-button to="/"> Home</md-button>
      </md-card-actions>
    </md-card>


    
    
  </div>
</template>

<script>
import { getStatusBlackList as getStatus } from "../services/status";
import moment from 'moment'

export default {
  name: "Status",

  data: function() {
    return {
      message: "STATUS BLACK LIST!",
      status: {},
    };
  },

  methods: {
    moment: function () {
      return moment();
    },
    getBlackList() {
      this.status = {};
      let row = getStatus();
      //row.then((response) => this.status.push(response.data));
      row.then((response) => this.status = response.data);
      console.log(this.status);

      console.log(this.status.count_query);
    },

  },

  //filter: {}, 

  created: function () {
    this.getBlackList(); 
  } 


};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
