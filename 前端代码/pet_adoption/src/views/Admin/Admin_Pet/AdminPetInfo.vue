<template>
    <div class="head2"> 
      <el-container>
        <el-header style="display: flex; height: 100px; background-color:	#FFEBCD ;border-radius:15px;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
          <i
            class="el-icon-chicken"
            style="
              font-size: 40px;
              height: 40px;
              align-self: center;
              margin-left: 50px;">
          </i>
          <h3 style="margin-left: 5px; align-self: center">宠物管理</h3>
        <el-drawer
           title="我是标题"
            :visible.sync="drawer"
              :with-header="false">
              <div style="margin: 10px 10px 10px 10px;">
                  <el-button type="primary" icon="el-icon-s-opportunity"  style="color: white;">提示</el-button>
                  <div style="margin-top: 20px"><el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button><h style="">：此按钮返回管理员中心</h></div>
                  <div style="margin-top: 15px"><el-button type="primary" icon="el-icon-thumb" circle></el-button><h style="">：此按钮打开提示</h></div>
                  <div style="margin-top: 15px"><el-button type="primary" icon="el-icon-refresh-right" circle ></el-button><h style="">：此按钮刷新数据</h></div>
                </div>
            </el-drawer>
          <el-button type="primary" round @click="Adminout" style="height: 40px; align-self: center; margin-left: 950px;"
            >退出</el-button>
        </el-header>
        <el-container class="aside" style="margin-top: 10px;" >
          <el-aside style="display: block;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
            <el-menu unique-opened="true">
              <el-submenu index="1">
                <template slot="title">
                  <i class="el-icon-user" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">用户管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="1-1" style="text-align: center"><router-link to="/InfoUser" style="color: black;">用户信息管理</router-link></el-menu-item>
                  <el-menu-item index="1-2" style="text-align: center"><router-link to="/AppUser" style="color: black;">用户申请管理</router-link>
                    </el-menu-item>
                  <el-menu-item index="1-3" style="text-align: center"><router-link to="/ComplaintsUser" style="color: black;">用户投诉管理</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              <el-submenu index="2">
                <template slot="title">
                  <i class="el-icon-chicken" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">宠物管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="2-1" style="text-align: center"><router-link to="/AdminPetInfo" style="color: black;">宠物信息管理</router-link></el-menu-item>
                  <el-menu-item index="2-2" style="text-align: center"><router-link to="/AdminPetApp" style="color: black;">宠物领养情况</router-link></el-menu-item>
                  <el-menu-item index="2-3" style="text-align: center"><router-link to="/PetTag" style="color: black;">宠物标签情况</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              <el-submenu index="3">
                <template slot="title">
                  <i class="el-icon-bell" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">通知管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="3-1" style="text-align: center"><router-link to="/AdminNotification" style="color: black;">用户通知</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              
              <el-submenu index="4">
                <template slot="title">
                  <i class="el-icon-document-remove" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">数据统计</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="4-1" style="text-align: center;"><router-link to="/petCount" style="color: black;">领养统计</router-link></el-menu-item>
                 
                </el-menu-item-group>
              </el-submenu>
            </el-menu>
          </el-aside>
  
          <el-main style="display: block;">
            <el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button>
            <el-button @click="drawer = true" type="primary" icon="el-icon-thumb" circle></el-button>
            <el-button type="primary" icon="el-icon-refresh-right" circle @click="load" ></el-button>
            <el-button type="primary" icon="el-icon-document-add" circle @click="addpPtFun" ></el-button>
            <hr style="margin: 10px 0px 10px 0px;">
                <el-input
                    placeholder="品种查询"
                    v-model="inputSelect1"
                    @change="selectInput"
                    prefix-icon="el-icon-search"
                    style="width: 200px;"
                    clearable>
                </el-input>
                <el-input
                    placeholder="种类查询"
                    v-model="inputSelect2"
                    @change="selectInput"
                    prefix-icon="el-icon-search"
                    style="width: 200px; margin-left: 20px;"
                    clearable>
                </el-input>
                <el-input
                    placeholder="性别查询"
                    v-model="inputSelect3"
                    @change="selectInput"
                    prefix-icon="el-icon-search"
                    style="width: 200px; margin-left: 20px;"
                    clearable>
                </el-input>
                <el-checkbox-group v-model="checkList" @change="selectInput" style="margin-top: 10px">
                  <el-checkbox label="有没有绝孕"></el-checkbox>
                  <el-checkbox label="是否有领养历史"></el-checkbox>
                </el-checkbox-group>
            <el-table
            :data="tableData"
                    v-loading="loading"
                    border
                    style="width: 100%; border-radius: 15px; margin-top: 10px;border: 2px solid #ccc" 
                    max-height="550px">
                    <el-table-column
                    fixed
                    prop="petId"
                    sortable
                    label="宠物编号"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="category"
                    sortable
                    label="种类"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="breed"
                    sortable
                    label="品种"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="petName"
                    sortable
                    label="名字"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="age"
                    sortable
                    label="年龄"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="gender"
                    label="性别"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="weight"
                    label="体重"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="color"
                    label="颜色"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="neutered"
                    label="是否绝孕"
                    width="120px">
                    <template slot-scope="scope">
                          <span v-if="scope.row.neutered == 1">有</span>
                          <span v-else-if="scope.row.neutered == 0">没有</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                    prop="adoptionHistory"
                    label="是否有领养历史"
                    width="120px">
                    <template slot-scope="scope">
                          <span v-if="scope.row.adoptionHistory == 1">是</span>
                          <span v-else-if="scope.row.adoptionHistory == 0">否</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                    prop="adoptionStatus"
                    label="领养状态"
                    width="120px">
                        <template slot-scope="scope">
                          <span v-if="scope.row.adoptionStatus == 1">正在领养</span>
                          <span v-else-if="scope.row.adoptionStatus == 0">未领养</span>
                          <span v-else-if="scope.row.adoptionStatus == 3">不能领养</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                    fixed="right"
                    label="操作"
                    width="100">
                    <template slot-scope="scope">
                    <el-button @click="handleClick(scope.row)" type="text" size="small">健康信息</el-button>
                    <el-button @click="editRow(scope.row)" type="text" size="small">编辑</el-button>
                </template>
                </el-table-column>
            </el-table>

            <el-dialog :visible.sync="healthDialogVisible" title="健康信息">
              <el-form ref="healthForm" :model="healthInfo" label-width="120px">
                <el-form-item label="宠物ID">
                  <el-input v-model="healthInfo.petId" disabled></el-input>
                </el-form-item>
                <el-form-item label="兽医记录">
                  <el-input v-model="healthInfo.vetRecords"></el-input>
                </el-form-item>
                <el-form-item label="疫苗接种情况">
                  <el-input v-model="healthInfo.vaccinationRecords"></el-input>
                </el-form-item>
                <el-form-item label="上次修改时间">
                  <el-date-picker
                    v-model="healthInfo.lastModifiedTime"
                    type="date"
                    placeholder="选择日期时间">
                  </el-date-picker>
                </el-form-item>
                <el-form-item label="疫苗接种状态">
                  <el-switch v-model="healthInfo.vaccinationStatus"></el-switch>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="submitHealthForm('healthForm')">立即保存</el-button>
                  <el-button @click="healthDialogVisible = false">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>

            <el-dialog :visible.sync="dialogVisible" title="编辑宠物信息">
              <el-form ref="form" :model="form" label-width="120px">
                <el-form-item label="宠物编号">
                  <el-input v-model="form.petId" placeholder="请输入宠物编号"></el-input>
                </el-form-item>

                <el-form-item label="种类">
                  <el-input v-model="form.category" placeholder="请输入种类"></el-input>
                </el-form-item>

                <el-form-item label="品种">
                  <el-input v-model="form.breed" placeholder="请输入品种"></el-input>
                </el-form-item>

                <el-form-item label="名字">
                  <el-input v-model="form.petName" placeholder="请输入名字"></el-input>
                </el-form-item>

                <el-form-item label="年龄">
                  <el-input v-model="form.age" placeholder="请输入年龄"></el-input>
                </el-form-item>

                <el-form-item label="性别">
                  <el-input v-model="form.gender" placeholder="请输入性别"></el-input>
                </el-form-item>

                <el-form-item label="体重">
                  <el-input v-model="form.weight" placeholder="请输入体重"></el-input>
                </el-form-item>

                <el-form-item label="颜色">
                  <el-input v-model="form.color" placeholder="请输入颜色"></el-input>
                </el-form-item>

                <el-form-item label="是否绝育">
                  <el-switch v-model="form.neutered"></el-switch>
                </el-form-item>

                <el-form-item label="是否有领养历史">
                  <el-switch v-model="form.adoptionHistory"></el-switch>
                </el-form-item>

                <el-form-item label="领养状态">
                  <el-select v-model="form.adoptionStatus" placeholder="请选择领养状态">
                    <el-option label="未领养" :value="0"></el-option>
                    <el-option label="正在领养" :value="1"></el-option>
                    <el-option label="不能领养" :value="3"></el-option>
                  </el-select>
                </el-form-item>

                <el-form-item>
                  <el-button type="primary" @click="submitForm('form')">立即保存</el-button>
                  <el-button @click="dialogVisible = false">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>

            <el-dialog :visible.sync="addPet" title="添加宠物!!!以下内容为必填">
              <el-form ref="formAdd" :model="formAdd" label-width="120px">

                <el-form-item label="种类">
                  <el-input v-model="formAdd.category" placeholder="请输入种类"></el-input>
                </el-form-item>

                <el-form-item label="品种">
                  <el-input v-model="formAdd.breed" placeholder="请输入品种"></el-input>
                </el-form-item>

                <el-form-item label="名字">
                  <el-input v-model="formAdd.petName" placeholder="请输入名字"></el-input>
                </el-form-item>

                <el-form-item label="地区">
                  <el-input v-model="formAdd.region" placeholder="请输入地区"></el-input>
                </el-form-item>

                <el-form-item label="年龄">
                  <el-input v-model="formAdd.age" placeholder="请输入年龄"></el-input>
                </el-form-item>

                <el-form-item label="性别">
                  <el-input v-model="formAdd.gender" placeholder="请输入性别"></el-input>
                </el-form-item>

                <el-form-item label="体重">
                  <el-input v-model="formAdd.weight" placeholder="请输入体重"></el-input>
                </el-form-item>

                <el-form-item label="颜色">
                  <el-input v-model="formAdd.color" placeholder="请输入颜色"></el-input>
                </el-form-item>

                <el-form-item label="是否绝育">
                  <el-switch v-model="formAdd.neutered"></el-switch>
                </el-form-item>

                <el-form-item label="是否有领养历史">
                  <el-switch v-model="formAdd.adoptionHistory"></el-switch>
                </el-form-item>

                <el-form-item label="领养状态">
                  <el-select v-model="formAdd.adoptionStatus" placeholder="请选择领养状态">
                    <el-option label="未领养" :value="0"></el-option>
                    <el-option label="正在领养" :value="1"></el-option>
                    <el-option label="不能领养" :value="3"></el-option>
                  </el-select>
                </el-form-item>

                <el-form-item>
                  <el-button type="primary" @click="submitAdd('formAdd')">立即保存</el-button>
                  <el-button @click="addPet = false">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>

            <el-dialog :visible.sync="addHealth" title="添加健康信息">
              <el-form ref="formAddHealth" :model="formAddHealth" label-width="120px">
                <el-form-item label="宠物编号">
                  <el-input v-model="formAddHealth.petId"></el-input>
                </el-form-item>
                <el-form-item label="兽医记录">
                  <el-input v-model="formAddHealth.vetRecords"></el-input>
                </el-form-item>
                <el-form-item label="疫苗接种情况">
                  <el-input v-model="formAddHealth.vaccinationRecords"></el-input>
                </el-form-item>
                <el-form-item label="治疗记录">
                  <el-input v-model="formAddHealth.treatmentRecords"></el-input>
                </el-form-item>
                <el-form-item label="上次修改时间">
                  <el-date-picker
                    v-model="formAddHealth.lastModifiedTime"
                    type="date"
                    placeholder="选择日期时间">
                  </el-date-picker>
                </el-form-item>
                <el-form-item label="疫苗接种状态">
                  <el-switch v-model="formAddHealth.vaccinationStatus"></el-switch>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="addHealthFun('healthForm')">立即保存</el-button>
                  <el-button @click="addHealth = false">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>

            </el-main>
        </el-container>
      </el-container>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  export default {
    data() {
      return {
        loading:false,
        addHealth:false,
        dialogVisible: false,
        healthDialogVisible: false,
        addPet:false,
        drawer: false,
        inputSelect1:'',
        inputSelect2:'',
        inputSelect3:'',
        checkList: [],
        tableData: [{
        }],
        formAdd:{
          category:'',
          breed:'',
          petName:'',
          weight:'',
          age:'',
          gender:'',
          color:'',
          neutered:'',
          adoptionHistory:'',
          adoptionStatus:0,
        },
        formAddHealth:{
        petId: '',
        vetRecords: '',
        vaccinationRecords: '',
        treatmentRecords: '',
        lastModifiedTime: '',
        vaccinationStatus: 0,
        },
        form: {
          adoptionStatus:0,
        },
        healthInfo: {
        petId: '',
        vetRecords: '',
        vaccinationRecords: '',
        treatmentRecords: '',
        lastModifiedTime: '',
        vaccinationStatus: false,
        },
        }
    },  
    methods: {
    addHealthFun(formName) {
      this.$refs[formName].validate((valid) => {
          if (valid) {
            console.log(valid)
            // 提交表单数据到服务器
            axios.put(
              'http://localhost:8080/Pet/addHealth', 
              this.formAddHealth
            )
              .then(response => {
                if (response.status === 200) {
                  this.$message.success('提交成功!');
                  this.addHealth = false;
                } else {
                  this.$message.error('提交失败!');
                }
              })
              .catch(error => {
                console.error('提交失败:', error);
              });
          } else {
            console.log('提交失败!!');
            return false;
          }
        });
      },
      addpPtFun(){
        this.addPet=true;
      },
      submitAdd(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            console.log(valid)
            // 提交表单数据到服务器
            axios.put(
              'http://localhost:8080/Pet/addPet', 
              this.formAdd
            )
              .then(response => {
                if (response.status === 200) {
                  this.$message.success('提交成功!');
                  this.addPet = false;
                } else {
                  this.$message.error('提交失败!');
                }
              })
              .catch(error => {
                console.error('提交失败:', error);
              });
          } else {
            console.log('提交失败!!');
            return false;
          }
        });
      },
      selectInput() {
        const category = this.inputSelect1 || '';
        const breed = this.inputSelect2 || '';
        const gender = this.inputSelect3 || '';
        const neutered = this.checkList.includes('有没有绝孕') ? 1 : 0;
        const adoptionHistory = this.checkList.includes('是否有领养历史') ? 1 : 0;
        const params = {
            category,
            breed,
            gender,
            neutered,
            adoptionHistory
        };
        const url = 'http://localhost:8080/Pet/selsectPet';
        console.log(params)
        axios.get(url, {params})
          .then(response => {
            this.tableData = response.data.data;
          })
          .catch(error => {
            console.error('查询失败:', error);
            this.$message.error('查询失败!');
          });
      },
    submitHealthForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const payload = this.healthInfo;
            console.log("--------",payload)
            axios.put('http://localhost:8080/Pet/updateHealth', payload)
              .then(response => {
                if (response.status === 200) {
                  this.$message.success('提交成功!');
                  this.healthDialogVisible = false;
                  this.loadTableData(); // 重新加载表格数据
                } else {
                  this.$message.error('提交失败!');
                }
              })
              .catch(error => {
                console.error('提交失败:', error);
              });
          } else {
            console.log('提交失败!!');
            return false;
          }
        });
      },
    handleClick(row) {
      this.healthDialogVisible = true;
        console.log("____>",row.petId)
        axios.get(
          `http://localhost:8080/Pet/listHealth/${row.petId}`,
        )
          .then(response => {
            if (response.data.data.length > 0) {
                this.healthInfo = response.data.data[0];
                console.log("----->", this.healthInfo);
            }else {
              this.healthDialogVisible=false
              
            this.$alert('是否添加', '获取健康信息失败', {
            confirmButtonText: '确定',
            callback: action => {
              if (action === 'confirm') {
                this.addHealth=true
              }
            }
          });
            }
      })
          .catch(error => {
            console.error('获取健康信息失败:', error);
            
            this.$message.error('获取健康信息失败!');
          });
      },
    editRow(row) {
      this.form = { ...row }; // 使用展开运算符复制行数据到表单
      this.dialogVisible = true; // 打开对话框
    },
    submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            // 提交表单数据到服务器
            axios.put(
              'http://localhost:8080/Pet/updatePet', 
              this.form
            )
              .then(response => {
                if (response.status === 200) {
                  this.$message.success('提交成功!');
                  this.dialogVisible = false;
                } else {
                  this.$message.error('提交失败!');
                }
              })
              .catch(error => {
                console.error('提交失败:', error);
              });
          } else {
            console.log('提交失败!!');
            return false;
          }
        });
      },
      Adminout() {
        this.$confirm("您要退出账号吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            this.$router.push({ name: "LoginUi" });
            this.$message({
              type: "success",
              message: "退出成功!",
            });
          })
          .catch(() => {
            this.$message({
              type: "info",
              message: "已取消操作",
            });
          });
      },
    load(){
      this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 1000);
      axios.get("http://localhost:8080/Pet/list").then((result) => {
          this.tableData=result.data.data
          this.$message({
          showClose: true,
          message: '数据已加载',
          type: 'success'
        });
      });
    },
    },
    mounted() {
      //发送异步请求，获取数据
      this.load()
      
    }, 
  };
  </script >
  
  <style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
    overflow: hidden;
  }
  </style>